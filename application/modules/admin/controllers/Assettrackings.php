<?php

defined('BASEPATH') or exit('No direct script access allowed');

class Assettrackings extends Admin_Base_Controller {
	public function __construct() {
		parent::__construct();
		$this->load->library('grocery_CRUD');
		$this->setTemplateFile('grocery_view');
		$this->load->model('Assettrackings_model');

		// check librarians groups or not
		$group = 'admin';
		if (!$this->ion_auth->in_group($group)) {
			$this->session->set_flashdata('message', 'You must be an admin to view this page.');
			redirect('admin/dashboard/access_denied');
		}
	}

	public function index() {
		redirect('admin/assettrackings/all_assettrackings/');
	}

	public function all_assettrackings() {
		try {

			// Grocery settings getGroceryCRUD( $TableName, $Subject, $PageTitle, $Breadcrumbs )
			$crud = $this->getGroceryCRUD('assets_tracking', 'Asset Trackings', 'Asset Trackings', 'Track Assets');

			// data Grid view fields
			$crud->columns('name', 'asset_id', 'section_id', 'designation_id', 'date', 'quantity', 'updated_at');

			// Insert form
			$crud->add_fields(
				'asset_id',
				'section_id',
				'designation_id',
				'date',
				'quantity',
				'updated_at'
			);

			// Update form
			$crud->edit_fields(
				'asset_id',
				'section_id',
				'designation_id',
				'date',
				'quantity',
				'updated_at'
			);
			
			$crud->set_relation('asset_id', 'assets', 'name');
			$crud->set_relation('section_id', 'sections', 'name');
			$crud->set_relation('designation_id', 'designations', 'name');

			//File upload
			//$crud->set_field_upload('file_path', 'assets/images/credit');

			// Unset, hide fields
			// $crud->change_field_type('created_at', 'invisible')
			// 	->change_field_type('created_by', 'invisible')
			// 	->change_field_type('updated_at', 'invisible')
			// 	->change_field_type('updated_by', 'invisible');

			// Unset, hide fields from view page
			//$crud->unset_read_fields('cre_or_up_by');

			// Required fields
			$crud->required_fields('name', 'asset_id', 'section_id', 'designation_id', 'quantity');

			// Rename field level
			$crud->display_as('asset_id', ' Asset')
				->display_as('section_id', 'Section')
				->display_as('quantity', 'Quantity')
				->display_as('date', 'Delivery date')
				->display_as('designation_id', 'Designation');

			//	callback functions
			// $crud->callback_column('status', array($this, '_callback_status'))
			// 	->callback_before_insert(array($this, 'custom_data_callback'))
			// 	->callback_before_update(array($this, 'custom_data_update_callback'));
			//->callback_read_field('file_path', array($this, '_callback_view_photo'))
			//->callback_read_field('status', array($this, '_callback_status'));

			// render output result
			$output = $crud->render();
			$this->load->view('admin/assettrackings/v_assettrackings', (array) $output);

			// error handle
		} catch (Exception $e) {
			show_error($e->getMessage() . ' --- ' . $e->getTraceAsString());
		}
	}

	// add and update cre_or_up_date & cre_or_up_date value
	public function custom_data_callback($post_array) {
		$post_array['created_at'] = date('Y-m-d H:i:s');
		$post_array['created_by'] = $this->ion_auth->get_user_id();
		$post_array['updated_at'] = date('Y-m-d H:i:s');
		$post_array['updated_by'] = $this->ion_auth->get_user_id();
		$post_array['is_active'] = 1;

		return $post_array;
	}

	// add and update cre_or_up_date & cre_or_up_date value
	public function custom_data_update_callback($post_array) {
		$post_array['updated_at'] = date('Y-m-d H:i:s');
		$post_array['updated_by'] = $this->ion_auth->get_user_id();
		return $post_array;
	}

	// Change the color of status like active and deactive users
	public function _callback_status($value, $row) {
		return $value == '1' ? "<strong style='color: #67bf7e'>ACTIVE</strong>" : "<strong style='color: #e66f57'>INACTIVE</strong>";
	}

	// view user image in column
	public function _callback_view_photo($value, $row) {
		$image_url = base_url('assets/images/credit/' . $value);
		return "<a href=$image_url class='fancybox'><img class='img-responsive img-thumbnail' src=$image_url  width='100px'/></a>";
	}

	// initial setup of grocery crud by table name, theme and others
	public function getGroceryCRUD($TableName, $Subject, $PageTitle, $Breadcrumbs) {
		$crud = new grocery_CRUD();
		$this->data['title'] = $PageTitle;
		$this->data['breadcrumbs'] = $Breadcrumbs;
		$crud->set_theme('tablestrap');
		$crud->set_table($TableName);
		$crud->set_subject($Subject);

		return $crud;
	}
}
