<?php

class Orders extends Admin_Base_Controller
{
    public function __construct()
    {
        parent::__construct();
        $this->load->model('orders_model');
        $this->load->model('sections_model');
        $this->load->model('product_model');
        $this->load->helper('form');

        // check admin groups or not
        $group = 'admin';
        if (!$this->ion_auth->in_group($group)) {
            $this->session->set_flashdata('message', 'আপনি অনুমোদিত ব্যবহারকারী নন।');
            redirect('admin/dashboard/access_denied');
        }
    }

    public function index()
    {
        $this->data['title'] = 'মালামাল বিতরণ';
        $this->data['breadcrumbs'] = 'মালামাল বিতরণ';
        $this->load->view('admin/orders/manage', $this->data);
    }

    // get all records
    public function get_all()
    {
        $this->setOutputMode(NORMAL);
        if ($this->input->is_ajax_request()) {
            $this->data['all'] = $this->orders_model->get_all_with_joining();
            $view = $this->load->view('admin/orders/all', $this->data, true);
            $this->output->set_output($view);
        } else {
            redirect('admin/dashboard');
        }
    }

    // insert form
    public function create_form()
    {
        $this->data['title'] = 'মালামাল বিতরণ';
        $this->data['breadcrumbs'] = 'মালামাল বিতরণ';
        $this->data['sections'] = $this->sections_model->get_all();
        $this->data['products'] = $this->product_model->get_all();
        $view = $this->load->view('admin/orders/add', $this->data, true);
        $this->output->set_output($view);
    }

    // Insert New records
    public function create()
    {
        $this->data['title'] = 'মালামাল বিতরণ যোগ';
        $this->data['breadcrumbs'] = 'মালামাল বিতরণ যোগ';
        $this->data['sections'] = $this->sections_model->get_all();
        $this->data['old_data'] = $this->input->post();

        $section_id = $this->input->post('section_id');
        $order_date = $this->input->post('order_date');
        $go_no = $this->input->post('go_no');
        $note = $this->input->post('note');
        $created_at = date('Y-m-d H:i:s');
        $created_by = $this->ion_auth->user()->row()->id;
        $updated_at = date('Y-m-d H:i:s');
        $updated_by = $this->ion_auth->user()->row()->id;

        //set validations
        $this->form_validation->set_rules('section_id', 'section Name', 'required');

        if ($this->form_validation->run() == false) {
            $this->session->set_flashdata('error', validation_errors());
            $this->load->view('admin/orders/add', $this->data);
        } else {
            $insertData = array(
                'section_id' => $section_id,
                'order_date' => $order_date,
                'go_no' => trim($go_no),
                'note' => trim($note),
                'created_at' => $created_at,
                'created_by' => $created_by,
                'updated_at' => $updated_at,
                'updated_by' => $updated_by,
                'is_active' => 1,
            );

            $insertData = $this->security->xss_clean($insertData);

            $results = $this->orders_model->create($insertData);
            $order_id = $this->db->insert_id();

            $count_product = count($this->input->post('product'));
            for ($x = 0; $x < $count_product; $x++) {
                $items = array(
                    'order_id' => $order_id,
                    'section_id' => $section_id,
                    'product_id' => $this->input->post('product')[$x],
                    'quantity' => $this->input->post('qty')[$x],
                    'stockadjustment' => 'No',
                    'stockoutreason_id' => 3,
                    'date' => date('Y-m-d'),
                    'created_at' => trim($created_at),
                    'created_by' => trim($created_by),
                    'updated_at' => trim($updated_at),
                    'updated_by' => trim($updated_by),
                    'is_active' => 1,
                );

                $this->db->insert('stockouts', $items);
                $stockout_id = $this->db->insert_id();

                $query = $this->db->query('SELECT product_id, quantity, date FROM stockouts where id = ' . $stockout_id);
                $stockout = $query->row_array();
                $query = $this->db->query('SELECT stock_available FROM products where id = ' . $stockout['product_id']);
                $product = $query->row_array();

                $stock_insert = array(
                    "product_id" => $stockout['product_id'],
                    "transaction_type" => 'stockout',
                    "transaction_id" => $stockout_id,
                    "quantity" => $stockout['quantity'],
                    "stock_available_before_transaction" => $product['stock_available'],
                    "stock_available_after_transaction" => $product['stock_available'] - $stockout['quantity'],
                    "date" => $stockout['date'],
                    "created_at" => date('Y-m-d H:i:s'),
                    "updated_at" => date('Y-m-d H:i:s'),
                    "created_by" => $this->ion_auth->get_user_id(),
                    "updated_by" => $this->ion_auth->get_user_id(),
                    'is_active' => 1,
                );

                $this->db->insert('stocks', $stock_insert);

                $product_stock_update = array(
                    "stock_available" => $product['stock_available'] - $stockout['quantity'],
                );
                $this->db->update('products', $product_stock_update, array('id' => $stockout['product_id']));
            }
            if ($results) {
                $this->session->set_flashdata('success', 'Successfully created');
                redirect('admin/orders');
            } else {
                $this->session->set_flashdata('errors', 'Error occurred!');
                $this->load->view('admin/orders/add');
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
        $this->data['single'] = $this->orders_model->get_by_id($id);
        $this->data['title'] = 'Edit order';
        $this->data['breadcrumbs'] = 'Edit order';
        $this->data['products'] = $this->product_model->get_all();

        $this->db->select('sections.name as section')
            ->from('orders');
        $this->db->join('sections', 'sections.id = orders.section_id');
        $this->db->where('orders.id', $id);
        $this->data['section'] = $this->db->get()->row()->section;

        $result = array();
        $orders_item = $this->orders_model->getOrdersItemData($id);

        foreach ($orders_item as $k => $v) {
            $result['order_item'][] = $v;
        }

        $this->data['order_data'] = $result;
        $view = $this->load->view('admin/orders/edit', $this->data, true);
        $this->output->set_output($view);
    }

    // edit a record
    public function edit()
    {
        $updateId = $this->input->post('updateId');
        $section_id = $this->input->post('section_id');
        $order_date = $this->input->post('order_date');
        $go_no = $this->input->post('go_no');
        $note = $this->input->post('note');
        $updated_at = date('Y-m-d H:i:s');
        $updated_by = $this->ion_auth->user()->row()->id;

        $this->form_validation->set_rules('section_id', 'section Name', 'required');

        if ($this->form_validation->run() == false) {
            $this->session->set_flashdata('error', validation_errors());
            redirect('admin/orders/edit_form/' . $this->input->post('updateId'));
        } else {
            $updateData = array(
                'section_id' => trim($section_id),
                'order_date' => trim($order_date),
                'go_no' => trim($go_no),
                'note' => trim($note),
                'updated_at' => trim($updated_at),
                'updated_by' => trim($updated_by),
                'is_active' => 1,
            );

            $updateData = $this->security->xss_clean($updateData);

            $results = $this->orders_model->edit($updateData, $updateId);

            if ($results) {
                $this->session->set_flashdata('success', 'Successfully updated');
                redirect('admin/orders');
            } else {
                $this->session->set_flashdata('errors', 'Error occurred!!');
                redirect('admin/orders/edit_form');
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
            //            $result = $this->order_model->delete($id);
            //            $this->db->delete('stockouts', array('order_id' => $id));

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
