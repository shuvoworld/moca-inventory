<?php

defined('BASEPATH') or exit('No direct script access allowed');

class Designations extends Admin_Base_Controller
{
    public function __construct()
    {
        parent::__construct();
        $this->load->library('grocery_CRUD');
        $this->setTemplateFile('grocery_view');
        $this->load->model('Designations_model');

        // check librarians groups or not
        $group = 'admin';
        if (!$this->ion_auth->in_group($group)) {
            $this->session->set_flashdata('message', 'You must be an admin to view this page.');
            redirect('admin/dashboard/access_denied');
        }
    }

    public function index()
    {
        redirect('admin/designations/all_designations/');
    }

    public function all_designations()
    {
        try {

            // Grocery settings getGroceryCRUD( $TableName, $Subject, $PageTitle, $Breadcrumbs )
            $crud = $this->getGroceryCRUD('designations', 'Designations', 'Designations', 'Manage All Designations');

            // data Grid view fields
            $crud->columns('name', 'grade', 'rank', 'updated_at');


            // Insert form
            $crud->add_fields('name', 'grade', 'rank', 'created_at', 'created_by', 'updated_at', 'updated_by');

            // Update form
            $crud->edit_fields('name', 'grade', 'rank', 'created_at', 'created_by', 'updated_at', 'updated_by');

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
            $crud->required_fields('name');

            // Rename field level
            $crud->display_as('name', ' Name');

            //	callback functions
            $crud->callback_column('status', array($this, '_callback_status'))
                ->callback_before_insert(array($this, 'custom_data_callback'))
                ->callback_before_update(array($this, 'custom_data_update_callback'));
            //->callback_read_field('file_path', array($this, '_callback_view_photo'))
            //->callback_read_field('status', array($this, '_callback_status'));

            // render output result
            $output = $crud->render();
            $this->load->view('admin/designations/v_designations', (array) $output);

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
