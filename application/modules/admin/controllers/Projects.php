<?php

class Projects extends Admin_Base_Controller
{
    public function __construct()
    {
        parent::__construct();
        $this->load->model('project_model');
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
        $this->data['title'] = 'Manage Projects and Programs';
        $this->data['breadcrumbs'] = 'Manage projects';
        $this->load->view('admin/projects/manage', $this->data);
    }

    // get all records
    public function get_all()
    {
        $this->setOutputMode(NORMAL);
        if ($this->input->is_ajax_request()) {
            $this->data['all'] = $this->project_model->get_all();
            $view = $this->load->view('admin/projects/all', $this->data, true);
            $this->output->set_output($view);
        } else {
            redirect('admin/dashboard');
        }
    }

    // insert form
    public function create_form()
    {
        $this->data['title'] = 'Add Project/Program';
        $this->data['breadcrumbs'] = 'Add Project/Program';
        $this->data['project_types'] = $this->project_model->get_project_types();
        $this->data['project_partners'] = $this->project_model->get_project_partners();
        $this->data['get_implementing_bodies'] = $this->project_model->get_implementing_bodies();
        $view = $this->load->view('admin/projects/add', $this->data, true);
        $this->output->set_output($view);
    }

    // Insert New records
    public function create()
    {
        $this->data['title'] = 'Add Project/Program';
        $this->data['breadcrumbs'] = 'Add Project/Program';
        $this->data['project_types'] = $this->project_model->get_project_types();
        $this->data['project_partners'] = $this->project_model->get_project_partners();
        $this->data['get_implementing_bodies'] = $this->project_model->get_implementing_bodies();
        $this->data['old_data'] = $this->input->post();

        $name = $this->input->post('name');
        $name_BN = $this->input->post('name_BN');
        $project_main_type = $this->input->post('project_main_type');
        $project_partner = $this->input->post('project_partner');
        $project_implementing_body = $this->input->post('project_implementing_body');
        $project_director_name = $this->input->post('project_director_name');
        $project_director_designation = $this->input->post('$project_director_designation');
        $project_director_contact = $this->input->post('$project_director_contact');
        $created_at = date('Y-m-d H:i:s');
        $created_by = $this->ion_auth->user()->row()->id;
        $updated_at = date('Y-m-d H:i:s');
        $updated_by = $this->ion_auth->user()->row()->id;

        //set validations
        $this->form_validation->set_rules('name', 'Project Name', 'trim|required');
        $this->form_validation->set_rules('name_BN', 'Project Bengali Name', 'trim|required');
        $this->form_validation->set_rules('project_implementing_body', 'Agency', 'required');

        if ($this->form_validation->run() == false) {
            $this->session->set_flashdata('error', validation_errors());
            $this->load->view('admin/projects/add', $this->data);
        } else {
            $insertData = array(
                'name' => trim($name),
                'name_BN' => trim($name_BN),
                'main_type_id' => trim($project_main_type),
                'agency_id' => trim($project_implementing_body),
                'partner_id' => trim($project_partner),
                'project_director_name' => trim($project_director_name),
                'project_director_designation' => trim($project_director_designation),
                'created_at' => trim($created_at),
                'created_by' => trim($created_by),
                'updated_at' => trim($updated_at),
                'updated_by' => trim($updated_by),
                'is_active' => 1,
            );

            $insertData = $this->security->xss_clean($insertData);

            $results = $this->project_model->create($insertData);

            if ($results) {
                $this->session->set_flashdata('success', 'Successfully created');
                redirect('admin/projects');
            } else {
                $this->session->set_flashdata('errors', 'Error occurred!');
                $this->load->view('admin/projects/add');
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
        $this->data['title'] = 'Edit Project/Program';
        $this->data['breadcrumbs'] = 'Edit Project/Program';
        $this->data['single'] = $this->project_model->get_by_id($id);
        $this->data['project_types'] = $this->project_model->get_project_types();
        $this->data['project_partners'] = $this->project_model->get_project_partners();
        $this->data['get_implementing_bodies'] = $this->project_model->get_implementing_bodies();
        $view = $this->load->view('admin/projects/edit', $this->data, true);
        $this->output->set_output($view);
    }

    // edit a record
    public function edit()
    {
        $updateId = $this->input->post('updateId');
        $name = $this->input->post('name');
        $name_BN = $this->input->post('name_BN');
        $project_main_type = $this->input->post('project_main_type');
        $project_main_type_BN = $this->db->query("Select * from project_maintypes where id = " . $project_main_type)->row()->name_BN;
        $project_partner = $this->input->post('project_partner');
        $project_implementing_body = $this->input->post('project_implementing_body');
        $project_director_name = $this->input->post('project_director_name');
        $project_director_designation = $this->input->post('$project_director_designation');
        $project_director_contact = $this->input->post('$project_director_contact');
        $updated_at = date('Y-m-d H:i:s');
        $updated_by = $this->ion_auth->user()->row()->id;

        //set validations
        $this->form_validation->set_rules('name', 'Project Name', 'trim|required');
        $this->form_validation->set_rules('name_BN', 'Project Bengali Name', 'trim|required');

        if ($this->form_validation->run() == false) {
            $this->session->set_flashdata('error', validation_errors());
            redirect('admin/projects/edit_form/' . $this->input->post('updateId'));
        } else {
            $updateData = array(
                'name' => trim($name),
                'name_BN' => trim($name_BN),
                'main_type_id' => trim($project_main_type),
                'main_type_BN' => trim($project_main_type_BN),
                'agency_id' => trim($project_implementing_body),
                'partner_id' => trim($project_partner),
                'project_director_name' => trim($project_director_name),
                'project_director_designation' => trim($project_director_designation),
                'created_at' => trim($created_at),
                'created_by' => trim($created_by),
                'updated_at' => trim($updated_at),
                'updated_by' => trim($updated_by),
                'is_active' => 1,
            );

            $updateData = $this->security->xss_clean($updateData);

            $results = $this->project_model->edit($updateData, $updateId);

            if ($results) {
                $this->session->set_flashdata('success', 'Successfully updated');
                redirect('admin/projects');
            } else {
                $this->session->set_flashdata('errors', 'Error occurred!!');
                redirect('admin/projects/edit_form');
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

            $result = $this->project_model->delete($id);

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
