<?php
defined('BASEPATH') or exit('No direct script access allowed');

class Sectionwisedistributions extends Admin_Base_Controller
{
    public function __construct()
    {
        parent::__construct();
        $this->load->library('table');
        $this->load->library('pagination');
        $this->load->helper('form');
        $this->load->helper('url');

        $this->load->model('Sectionwisedistribution_model');
    }

    public function testData()
    {
        echo "<h1>Route found!</h1>";die();
    }

    public function getStockDistributionData()
    {
        $section_id = "";
        $from_orderdate = "";
        $to_orderdate = "";

        if ($this->input->post('submit') != null) {
            $section_id = $this->input->post('section_id');
            $from_orderdate = $this->input->post('from_orderdate');
            $to_orderdate = $this->input->post('to_orderdate');
        }

        $config = array();
        $config['base_url'] = base_url() . 'report/Sectionwisedistributions/getStockDistributionData';
        $config['per_page'] = 10;
        $config['total_rows'] = $this->Sectionwisedistribution_model->getcount($section_id, $from_orderdate, $to_orderdate);

        $config['uri_segment'] = 4;
        $config['full_tag_open'] = '<ul class="pagination">';
        $config['full_tag_close'] = '</ul>';
        $config['prev_link'] = 'Previous';
        $config['next_link'] = 'Next';
        $config['prev_tag_open'] = '<li>';
        $config['prev_tag_close'] = '</li>';
        $config['next_tag_open'] = '<li>';
        $config['next_tag_close'] = '</li>';
        $config['cur_tag_open'] = '<li class="active"><a href="#">';
        $config['cur_tag_close'] = '</a></li>';
        $config['num_tag_open'] = '<li>';
        $config['num_tag_close'] = '</li>';
        $config['first_tag_open'] = '<li>';
        $config['first_tag_close'] = '</li>';
        $config['last_tag_open'] = '<li>';
        $config['last_tag_close'] = '</li>';

        $offset = ($this->uri->segment(4)) ? $this->uri->segment(4) : 0;
        $this->data['x'] = (int) $this->uri->segment(4) + 1;

        if ($this->uri->segment(4) + $config['per_page'] > $config['total_rows']) {
            $this->data['y'] = $config['total_rows'];
        } else {
            $this->data['y'] = (int) $this->uri->segment(4) + $config['per_page'];
        }
        $this->data['config'] = $config;

        $this->pagination->initialize($config);

        $this->data['distribution_summary'] = $this->Sectionwisedistribution_model->get_summary_filterd($section_id, $from_orderdate, $to_orderdate, $config["per_page"], $offset);
        $this->data['link'] = $this->pagination->create_links();

        $this->data['title'] = 'Section Wise Product Distribution Summary';
        $this->data['breadcrumbs'] = 'Distribution Summary';
        $view = $this->load->view('report/section_wise_distribution', $this->data, true);
        $this->output->set_output($view);
    }
}
