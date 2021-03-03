<?php
class Products extends Admin_Base_Controller
{
    public function __construct()
    {
        parent::__construct();
        $this->load->model('Product_model');
        $this->load->model('Category_model');
        $this->load->model('Brand_model');
        $this->load->model('Uoms_model');

        // check admin groups or not
        $group = 'admin';
        if (!$this->ion_auth->in_group($group)) {
            $this->session->set_flashdata('message', 'You must be an administrator to view the Product setup page.');
            redirect('admin/dashboard/access_denied');
        }
    }

    public function index()
    {
        $this->data['title'] = 'Manage Products';
        $this->data['breadcrumbs'] = 'Manage products';
        $this->load->view('admin/products/manage', $this->data);
    }

    // get all records
    public function get_all()
    {
        $this->setOutputMode(NORMAL);
        if ($this->input->is_ajax_request()) {
            $this->data['all'] = $this->Product_model->get_all_with_joining();
            $view = $this->load->view('admin/products/all', $this->data, true);
            $this->output->set_output($view);
        } else {
            redirect('admin/dashboard');
        }
    }

    // insert form
    public function create_form()
    {
        $this->setOutputMode(NORMAL);

        if ($this->input->is_ajax_request()) {
            $this->data['categories'] = $this->Category_model->get_all();
            $this->data['brands'] = $this->Brand_model->get_all();
            $this->data['uoms'] = $this->Uoms_model->get_all();
            $view = $this->load->view('admin/products/add', $this->data, true);
            $this->output->set_output($view);
        } else {
            redirect('admin/dashboard');
        }
    }

    // Insert New records
    public function create()
    {
        header('Content-Type: application/json');
        $this->setOutputMode(NORMAL);
        if ($this->input->is_ajax_request()) {
            $name = $this->input->post('name');
            $category_id = $this->input->post('category_id');
            $brand_id = $this->input->post('brand_id');
            $size = $this->input->post('size');
            $color = $this->input->post('color');
            $model = $this->input->post('model');
            $stock_available = $this->input->post('stock_available');

            //set validations
            $this->form_validation->set_rules('name', 'Product Name', 'trim|required');
            $this->form_validation->set_rules('stock_available', 'Opening Stock Required', 'trim|required');

            if ($this->form_validation->run() == false) {
                $errors = array();
                foreach ($this->input->post() as $key => $value) {
                    $errors[$key] = form_error($key);
                }
                $response_array['errors'] = array_filter($errors);

                $response_array['type'] = 'danger';
                $response_array['message'] = '<div class="alert alert-danger alert-dismissable"><i class="fa fa-warning"></i> <strong class="alert  alert-dismissable"> Sorry!  Validation errors occurs. </strong></div>';
                echo json_encode($response_array);
            } else {
                $insertData = array(
                    'name' => trim($name),
                    'category_id' => $category_id,
                    'brand_id' => $brand_id,
                    'size' => $size,
                    'color' => $color,
                    'model' => $model,
                    'stock_available' => $stock_available,
                    'created_at' => date('Y-m-d H:i:s'),
                    'created_by' => $this->ion_auth->user()->row()->id,
                    'updated_at' => date('Y-m-d H:i:s'),
                    'updated_by' => $this->ion_auth->user()->row()->id,
                    'is_active' => 1,
                );

                $insertData = $this->security->xss_clean($insertData);

                $results = $this->Product_model->create($insertData);

                if ($results) {
                    $response_array['type'] = 'success';
                    $response_array['message'] = '<div class="alert alert-success alert-dismissable"><i class="fa fa-check"></i><strong>  Congratulations! </strong>  Created Successfully. </div>';
                    echo json_encode($response_array);
                } else {
                    $response_array['type'] = 'danger';
                    $response_array['message'] = $response_array['message'] . '<div class="alert alert-danger alert-dismissable"><i class="fa fa-times"></i><strong> Sorry! </strong>  Failed.</div>';
                    echo json_encode($response_array);
                }
            }
        } else {
            redirect('admin/dashboard');
        }
    }

    // get a record by id
    public function view($id)
    {
    }

    //update form
    public function edit_form()
    {
        $this->setOutputMode(NORMAL);
        if ($this->input->is_ajax_request()) {
            $id = $this->input->post('id');
            $this->data['single'] = $this->Product_model->get_by_id($id);
            $this->data['categories'] = $this->Category_model->get_all();
            $this->data['brands'] = $this->Brand_model->get_all();
            $this->data['uoms'] = $this->Uoms_model->get_all();
            $view = $this->load->view('admin/products/edit', $this->data, true);
            $this->output->set_output($view);
        } else {
            redirect('admin/dashboard');
        }
    }

    // edit a record
    public function edit()
    {
        header('Content-Type: application/json');
        $this->setOutputMode(NORMAL);
        if ($this->input->is_ajax_request()) {
            $updateId = $this->input->post('updateId');
            $name = $this->input->post('name');
            $category_id = $this->input->post('category_id');
            $brand_id = $this->input->post('brand_id');
            $size = $this->input->post('size');
            $color = $this->input->post('color');
            $model = $this->input->post('model');
            $stock_available = $this->input->post('stock_available');
            $updated_at = date('Y-m-d H:i:s');
            $updated_by = $this->ion_auth->user()->row()->id;

            //set validations
            $this->form_validation->set_rules('name', 'Product Name', 'trim|required');

            if ($this->form_validation->run() == false) {
                $errors = array();
                foreach ($this->input->post() as $key => $value) {
                    $errors[$key] = form_error($key);
                }
                $response_array['errors'] = array_filter($errors);

                $response_array['type'] = 'danger';
                $response_array['message'] = '<div class="alert alert-danger alert-dismissable"><i class="fa fa-warning"></i> <strong class="alert  alert-dismissable"> Sorry!  Validation errors occurs. </strong></div>';
                echo json_encode($response_array);
            } else {
                $updateData = array(
                    'name' => trim($name),
                    'category_id' => $category_id,
                    'brand_id' => $brand_id,
                    'size' => $size,
                    'color' => $color,
                    'model' => $model,
                    'stock_available' => $stock_available,
                    'updated_at' => $updated_at,
                    'updated_by' => $updated_by,
                );

                $updateData = $this->security->xss_clean($updateData);

                $results = $this->Product_model->edit($updateData, $updateId);

                if ($results) {
                    $response_array['type'] = 'success';
                    $response_array['message'] = '<div class="alert alert-success alert-dismissable"><i class="fa fa-check"></i><strong>  Congratulations! </strong>  Updated Successfully. </div>';
                    echo json_encode($response_array);
                } else {
                    $response_array['type'] = 'danger';
                    $response_array['message'] = $response_array['message'] . '<div class="alert alert-danger alert-dismissable"><i class="fa fa-times"></i><strong> Sorry! </strong>  Failed.</div>';
                    echo json_encode($response_array);
                }
            }
        } else {
            redirect('admin/dashboard');
        }
    }

    // delete a record
    public function delete()
    {
        header('Content-Type: application/json');
        $this->setOutputMode(NORMAL);
        if ($this->input->is_ajax_request()) {
            $id = $this->input->post('id');

            $result = $this->Product_model->delete($id);

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
