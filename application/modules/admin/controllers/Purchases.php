<?php

class Purchases extends Admin_Base_Controller
{
    public function __construct()
    {
        parent::__construct();
        $this->load->model('purchase_model');
        $this->load->model('suppliers_model');
        $this->load->model('product_model');
        $this->load->helper('form');

        // check admin groups or not
        $group = 'admin';
        if (!$this->ion_auth->in_group($group)) {
            $this->session->set_flashdata('message', 'You must be an administrator to view the agency setup page.');
            redirect('admin/dashboard/access_denied');
        }
    }

    public function index()
    {
        $this->data['title'] = 'Manage Purchases';
        $this->data['breadcrumbs'] = 'Manage purchases';
        $this->load->view('admin/purchases/manage', $this->data);
    }

    // get all records
    public function get_all()
    {
        $this->setOutputMode(NORMAL);
        if ($this->input->is_ajax_request()) {
            $this->data['all'] = $this->purchase_model->get_all_with_joining();
            $view = $this->load->view('admin/purchases/all', $this->data, true);
            $this->output->set_output($view);
        } else {
            redirect('admin/dashboard');
        }
    }

    // insert form
    public function create_form()
    {
        $this->data['title'] = 'Add Purchase';
        $this->data['breadcrumbs'] = 'Add Purchase';
        $this->data['suppliers'] = $this->suppliers_model->get_all();
        $this->data['products'] = $this->product_model->get_all();
        $view = $this->load->view('admin/purchases/add', $this->data, true);
        $this->output->set_output($view);
    }

    // Insert New records
    public function create()
    {
        $this->data['title'] = 'Add Purchase';
        $this->data['breadcrumbs'] = 'Add Purchase';
        $this->data['suppliers'] = $this->suppliers_model->get_all();
        $this->data['old_data'] = $this->input->post();

        $supplier_id = $this->input->post('supplier_id');
        $purchase_date = $this->input->post('purchase_date');
        $go_no = $this->input->post('go_no');
        $note = $this->input->post('note');
        $created_at = date('Y-m-d H:i:s');
        $created_by = $this->ion_auth->user()->row()->id;
        $updated_at = date('Y-m-d H:i:s');
        $updated_by = $this->ion_auth->user()->row()->id;

        //set validations
        $this->form_validation->set_rules('supplier_id', 'Supplier Name', 'required');

        if ($this->form_validation->run() == false) {
            $this->session->set_flashdata('error', validation_errors());
            $this->load->view('admin/purchases/add', $this->data);
        } else {
            $insertData = array(
                'supplier_id' => $supplier_id,
                'purchase_date' => $purchase_date,
                'go_no' => trim($go_no),
                'note' => trim($note),
                'created_at' => $created_at,
                'created_by' => $created_by,
                'updated_at' => $updated_at,
                'updated_by' => $updated_by,
                'is_active' => 1,
            );

            $insertData = $this->security->xss_clean($insertData);

            $results = $this->purchase_model->create($insertData);
            $order_id = $this->db->insert_id();

            $count_product = count($this->input->post('product'));
            for ($x = 0; $x < $count_product; $x++) {
                $items = array(
                    'purchase_id' => $order_id,
                    'supplier_id' => $supplier_id,
                    'product_id' => $this->input->post('product')[$x],
                    'quantity' => $this->input->post('qty')[$x],
                    'date' => date('Y-m-d'),
                    'created_at' => trim($created_at),
                    'created_by' => trim($created_by),
                    'updated_at' => trim($updated_at),
                    'updated_by' => trim($updated_by),
                    'is_active' => 1,
                );

                $this->db->insert('stockins', $items);
                $stockin_id = $this->db->insert_id();

                $query = $this->db->query('SELECT product_id, quantity, date FROM stockins where id = ' . $stockin_id);
                $stockin = $query->row_array();
                $query = $this->db->query('SELECT stock_available FROM products where id = ' . $stockin['product_id']);
                $product = $query->row_array();

                $stock_insert = array(
                    "product_id" => $stockin['product_id'],
                    "transaction_type" => 'stockin',
                    "transaction_id" => $stockin_id,
                    "quantity" => $stockin['quantity'],
                    "stock_available_before_transaction" => $product['stock_available'],
                    "stock_available_after_transaction" => $product['stock_available'] + $stockin['quantity'],
                    "date" => $stockin['date'],
                    "created_at" => date('Y-m-d H:i:s'),
                    "updated_at" => date('Y-m-d H:i:s'),
                    "created_by" => $this->ion_auth->get_user_id(),
                    "updated_by" => $this->ion_auth->get_user_id(),
                    'is_active' => 1,
                );

                $this->db->insert('stocks', $stock_insert);

                $product_stock_update = array(
                    "stock_available" => $product['stock_available'] + $stockin['quantity'],
                );
                $this->db->update('products', $product_stock_update, array('id' => $stockin['product_id']));
            }
            if ($results) {
                $this->session->set_flashdata('success', 'Successfully created');
                redirect('admin/purchases');
            } else {
                $this->session->set_flashdata('errors', 'Error occurred!');
                $this->load->view('admin/purchases/add');
            }
        }
    }

    // get a record by id
    public function view($id)
    {
    }

    //update form
    public function edit_form($id)
    {
        $this->data['single'] = $this->purchase_model->get_by_id($id);
        $this->data['title'] = 'Edit Purchase';
        $this->data['breadcrumbs'] = 'Edit Purchase';
        $this->data['products'] = $this->product_model->get_all();

        $this->db->select('suppliers.company_name as supplier')
            ->from('purchases');
        $this->db->join('suppliers', 'suppliers.id = purchases.supplier_id');
        $this->db->where('purchases.id', $id);
        $this->data['supplier'] = $this->db->get()->row()->supplier;

        $result = array();
        $orders_item = $this->purchase_model->getOrdersItemData($id);

        foreach ($orders_item as $k => $v) {
            $result['order_item'][] = $v;
        }

        $this->data['order_data'] = $result;
        $view = $this->load->view('admin/purchases/edit', $this->data, true);
        $this->output->set_output($view);
    }

    // edit a record
    public function edit()
    {
        $updateId = $this->input->post('updateId');
        $supplier_id = $this->input->post('supplier_id');
        $purchase_date = $this->input->post('purchase_date');
        $go_no = $this->input->post('go_no');
        $note = $this->input->post('note');
        $updated_at = date('Y-m-d H:i:s');
        $updated_by = $this->ion_auth->user()->row()->id;

        $this->form_validation->set_rules('supplier_id', 'Supplier Name', 'required');

        if ($this->form_validation->run() == false) {
            $this->session->set_flashdata('error', validation_errors());
            redirect('admin/purchases/edit_form/' . $this->input->post('updateId'));
        } else {
            $updateData = array(
                'supplier_id' => trim($supplier_id),
                'purchase_date' => trim($purchase_date),
                'go_no' => trim($go_no),
                'note' => trim($note),
                'updated_at' => trim($updated_at),
                'updated_by' => trim($updated_by),
                'is_active' => 1,
            );

            $updateData = $this->security->xss_clean($updateData);

            $results = $this->purchase_model->edit($updateData, $updateId);

            if ($results) {
                $this->session->set_flashdata('success', 'Successfully updated');
                redirect('admin/purchases');
            } else {
                $this->session->set_flashdata('errors', 'Error occurred!!');
                redirect('admin/purchases/edit_form');
            }
        }
    }

    // delete a record
    public function delete()
    {
        header('Content-Type: application/json');
        $this->setOutputMode(NORMAL);
        if ($this->input->is_ajax_request()) {
            $id = $this->input->post('id');

            //    need to check first how to adjust stock
            //            $result = $this->purchase_model->delete($id);
            //            $this->db->delete('stockins', array('purchase_id' => $id));

            if ($result) {
                $response_array['type'] = 'success';
                $response_array['message'] = '<div class="alert alert-success alert-dismissable"><i class="icon fa fa-check"></i> Successfully Deleted. </div>';
                echo json_encode($response_array);
            } else {
                $response_array['type'] = 'danger';
                $response_array['message'] = '<div class="alert alert-danger alert-dismissable"><i class="icon fa fa-times"></i> Sorry! Failed.</div>';
                echo json_encode($response_array);
            }
        }
    }
}
