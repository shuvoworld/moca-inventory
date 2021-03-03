<?php

defined('BASEPATH') or exit('No direct script access allowed');

class Stockouts extends Admin_Base_Controller
{
    public function __construct()
    {
        parent::__construct();
        $this->load->library('grocery_CRUD');
        $this->setTemplateFile('grocery_view');
        $this->load->model('stockouts_model');

        // check librarians groups or not
        $group = 'admin';
        if (!$this->ion_auth->in_group($group)) {
            $this->session->set_flashdata('message', 'You must be an admin to view this page.');
            redirect('admin/dashboard/access_denied');
        }
    }

    public function index()
    {
        redirect('admin/stockouts/all_stockouts/');
    }

    public function all_stockouts()
    {
        try {

            // Grocery settings getGroceryCRUD( $TableName, $Subject, $PageTitle, $Breadcrumbs )
            $crud = $this->getGroceryCRUD('stockouts', 'Stockouts', 'Stockouts', 'Manage All Stockouts');

            // data Grid view fields
            $crud->columns('order_id', 'product_id', 'section_id', 'quantity', 'date', 'updated_at');

            // Insert form
            $crud->add_fields('order_id', 'product_id', 'section_id', 'quantity', 'date', 'stockadjustment', 'stockoutreason_id', 'created_at', 'created_by', 'updated_at', 'updated_by');

            // Update form
            $crud->edit_fields('order_id', 'product_id', 'section_id', 'quantity', 'date', 'stockadjustment', 'stockoutreason_id', 'created_at', 'created_by', 'updated_at', 'updated_by');

            // Set Relation
            $crud->set_relation('product_id', 'products', 'name');
            $crud->set_relation('section_id', 'sections', 'name');
            $crud->set_relation('stockoutreason_id', 'stockoutreasons', 'name');

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
            $crud->display_as('order_id', 'Order ID')
                ->display_as('product_id', 'Product')
                ->display_as('section_id', 'Section')
                ->display_as('date', 'Stock Out date')
                ->display_as('stockadjustment', 'Stock Adjustment (Decrease)?')
                ->display_as('stockoutreason_id', 'Stock Adjustment Reason')
                ->display_as('quantity', 'Quantity');

            //    callback functions
            $crud->callback_column('status', array($this, '_callback_status'))
                ->callback_before_insert(array($this, 'custom_data_callback'))
                ->callback_after_insert(array($this, 'add_data_stock_table'))
                ->callback_before_update(array($this, 'custom_data_update_callback'))
                ->callback_after_update(array($this, 'stock_data_update'));
            //->callback_read_field('file_path', array($this, '_callback_view_photo'))
            //->callback_read_field('status', array($this, '_callback_status'));

            // render output result
            $output = $crud->render();
            $this->load->view('admin/stockouts/v_stockouts', (array) $output);

            // error handle
        } catch (Exception $e) {
            show_error($e->getMessage() . ' --- ' . $e->getTraceAsString());
        }
    }

    public function add_data_stock_table($post_array, $primary_key)
    {
        $query = $this->db->query('SELECT product_id, quantity, date FROM stockouts where id = ' . $primary_key);
        $stockout = $query->row_array();
        $query = $this->db->query('SELECT stock_available FROM products where id = ' . $stockout['product_id']);
        $product = $query->row_array();

        $stock_insert = array(
            "product_id" => $stockout['product_id'],
            "transaction_type" => 'stockout',
            "transaction_id" => $primary_key,
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

        $product_stock_update = array(
            "stock_available" => $product['stock_available'] - $stockout['quantity'],
        );
        $this->db->update('products', $product_stock_update, array('id' => $stockout['product_id']));

        $this->db->insert('stocks', $stock_insert);

        return true;
    }

    public function stock_data_update($post_array, $primary_key)
    {
        $query = $this->db->query('SELECT product_id, quantity, date FROM stockouts where id = ' . $primary_key);
        $stockout = $query->row_array();
        $query = $this->db->query('SELECT stock_available FROM products where id = ' . $stockout['product_id']);
        $product = $query->row_array();

        $stock_update = array(
            "product_id" => $stockin['product_id'],
            "transaction_type" => 'stockin',
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

        $this->db->update('stocks', $stock_update, array('transaction_id' => $primary_key, 'transaction_type' => 'stockouts'));

        return true;
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

    // add and update cre_or_up_date & cre_or_up_date value
    public function custom_data_update_callback($post_array)
    {
        $post_array['updated_at'] = date('Y-m-d H:i:s');
        $post_array['updated_by'] = $this->ion_auth->get_user_id();
        return $post_array;
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
