	<?php

    defined('BASEPATH') or exit('No direct script access allowed');

    class Stockins extends Admin_Base_Controller
    {
        public function __construct()
        {
            parent::__construct();
            $this->load->library('grocery_CRUD');
            $this->setTemplateFile('grocery_view');
            $this->load->model('stockins_model');

            // check librarians groups or not
            $group = 'admin';
            if (!$this->ion_auth->in_group($group)) {
                $this->session->set_flashdata('message', 'You must be an admin to view this page.');
                redirect('admin/dashboard/access_denied');
            }
        }

        public function index()
        {
            redirect('admin/stockins/all_stockins/');
        }

        public function all_stockins()
        {
            try {

                // Grocery settings getGroceryCRUD( $TableName, $Subject, $PageTitle, $Breadcrumbs )
                $crud = $this->getGroceryCRUD('stockins', 'Stockins', 'Stockins', 'Manage All Stockins');

                // data Grid view fields
                $crud->columns('purchase_id', 'product_id', 'supplier_id', 'quantity', 'date', 'updated_at');

                // Insert form
                $crud->add_fields('purchase_id', 'product_id', 'supplier_id', 'quantity', 'date', 'stockadjustment', 'stockinreason_id', 'created_at', 'created_by', 'updated_at', 'updated_by');

                // Update form
                $crud->edit_fields('purchase_id', 'product_id', 'supplier_id', 'quantity', 'date', 'stockadjustment', 'stockinreason_id', 'created_at', 'created_by', 'updated_at', 'updated_by');

                // Set Relation
                $crud->set_relation('product_id', 'products', 'name');
                $crud->set_relation('supplier_id', 'suppliers', 'company_name');
                $crud->set_relation('stockinreason_id', 'stockinreasons', 'name');

                //File upload
                //$crud->set_field_upload('file_path', 'assets/images/credit');

                // Unset, hide fields
                $crud->change_field_type('created_at', 'invisible')
                ->change_field_type('created_by', 'invisible')
                ->change_field_type('updated_at', 'invisible')
                ->change_field_type('updated_by', 'invisible');

                // Unset, hide fields from view page
                //$crud->unset_read_fields('cre_or_up_by');

                // Required fields
                $crud->required_fields('product_id', 'quantity');

                // Rename field level
                $crud->display_as('purchase_id', 'Purchase Order ID')
                ->display_as('product_id', 'Product')
                ->display_as('supplier_id', 'Supplier')
                ->display_as('date', 'Stock Entry date')
                ->display_as('stockadjustment', 'Stock Adjustment? (Increase)')
                ->display_as('stockinreason_id', 'Stock Adjustment Reason')
                ->display_as('quantity', 'Quantity');

                //	callback functions
                $crud->callback_column('status', array($this, '_callback_status'))
                ->callback_before_insert(array($this, 'custom_data_callback'))
                ->callback_after_insert(array($this, 'add_data_stock_table'))
                ->callback_before_update(array($this, 'custom_data_update_callback'))
                ->callback_after_update(array($this, 'stock_data_update'));
                //->callback_read_field('file_path', array($this, '_callback_view_photo'))
                //->callback_read_field('status', array($this, '_callback_status'));

                // render output result
                $output = $crud->render();
                $this->load->view('admin/suppliers/v_suppliers', (array) $output);

                // error handle
            } catch (Exception $e) {
                show_error($e->getMessage() . ' --- ' . $e->getTraceAsString());
            }
        }

        // add and update cre_or_up_date & cre_or_up_date value
        public function custom_data_callback($post_array)
        {
            $post_array['created_at'] = date('Y-m-d H:i:s');
            $post_array['created_by'] = $this->ion_auth->get_user_id();
            $post_array['updated_at'] = date('Y-m-d H:i:s');
            $post_array['updated_by'] = $this->ion_auth->get_user_id();
            $post_array['is_active'] = 1;

            return $post_array;
        }

        public function add_data_stock_table($post_array, $primary_key)
        {
            $query = $this->db->query('SELECT product_id, quantity FROM stockins where id = '. $primary_key);
            $stockin = $query->row_array();
            $query = $this->db->query('SELECT stock_available FROM products where id = '. $stockin['product_id']);
            $product = $query->row_array();

            $stock_insert = array(
                "product_id" => $stockin['product_id'],
                "transaction_type" => 'stockin',
                "transaction_id" => $primary_key,
                "quantity" => $stockin['quantity'],
                "stock_available_before_transaction" => $product['stock_available'],
                "stock_available_after_transaction" => $product['stock_available'] + $stockin['quantity'],
                "date"      => $stockin['date'],
                "created_at" => date('Y-m-d H:i:s'),
                "updated_at" => date('Y-m-d H:i:s'),
                "created_by" => $this->ion_auth->get_user_id(),
                "updated_by" => $this->ion_auth->get_user_id(),
                'is_active'  => 1
            );

            $this->db->insert('stocks', $stock_insert);

            $product_stock_update = array(
                "stock_available" => $product['stock_available'] + $stockin['quantity']
            );
            $this->db->update('products', $product_stock_update, array('id' => $stockin['product_id']));

            return true;
        }


        public function custom_data_update_callback($post_array)
        {
            $post_array['updated_at'] = date('Y-m-d H:i:s');
            $post_array['updated_by'] = $this->ion_auth->get_user_id();
            return $post_array;
        }

        public function stock_data_update($post_array, $primary_key)
        {
            $query = $this->db->query('SELECT product_id, quantity, date FROM stockins where id = '. $primary_key);
            $stockin = $query->row_array();
            $query = $this->db->query('SELECT stock_available FROM products where id = '. $stockin['product_id']);
            $product = $query->row_array();

            $stock_update = array(
                "product_id" => $stockin['product_id'],
                "transaction_type" => 'stockin',
                "quantity" => $stockin['quantity'],
                "stock_available_before_transaction" => $product['stock_available'],
                "stock_available_after_transaction" => $product['stock_available'] + $stockin['quantity'],
                "date"     => $stockin['date'],
                "created_at" => date('Y-m-d H:i:s'),
                "updated_at" => date('Y-m-d H:i:s'),
                "created_by" => $this->ion_auth->get_user_id(),
                "updated_by" => $this->ion_auth->get_user_id(),
                'is_active'  => 1
            );

            $this->db->update('stocks', $stock_update, array('transaction_id' => $primary_key, 'transaction_type' => 'stockin'));

            $product_stock_update = array(
                "stock_available" => $product['stock_available'] + $stockin['quantity']
            );
            $this->db->update('products', $product_stock_update, array('id' => $stockin['product_id']));

            return true;
        }

        // Change the color of status like active and deactive users
        public function _callback_status($value, $row)
        {
            return $value == '1' ? "<strong style='color: #67bf7e'>ACTIVE</strong>" : "<strong style='color: #e66f57'>INACTIVE</strong>";
        }

        // view user image in column
        public function _callback_view_photo($value, $row)
        {
            $image_url = base_url('assets/images/credit/' . $value);
            return "<a href=$image_url class='fancybox'><img class='img-responsive img-thumbnail' src=$image_url  width='100px'/></a>";
        }

        // initial setup of grocery crud by table name, theme and others
        public function getGroceryCRUD($TableName, $Subject, $PageTitle, $Breadcrumbs)
        {
            $crud = new grocery_CRUD();
            $this->data['title'] = $PageTitle;
            $this->data['breadcrumbs'] = $Breadcrumbs;
            $crud->set_theme('tablestrap');
            $crud->set_table($TableName);
            $crud->set_subject($Subject);

            return $crud;
        }
    }
