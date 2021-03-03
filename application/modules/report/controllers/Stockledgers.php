<?php
defined('BASEPATH') or exit('No direct script access allowed');

class Stockledgers extends Admin_Base_Controller
{
    public function __construct()
    {
        parent::__construct();
        $this->load->library('table');
        $this->load->library('pagination');
        $this->load->helper('form');
        $this->load->helper('url');

        $this->load->model('stockledger_model');
    }

    public function getstockledgerdata()
    {
        $section_id = "";
        $product = array();
        if ($this->input->post('submit') != null) {
            $section_id = $this->input->post('section_id');
            $product = $this->input->post('product_id');
        }

        $config = array();
        $config['base_url'] = base_url() . 'report/Stockledgers/getstockledgerdata';
        $config['per_page'] = 10;
        $config['total_rows'] = $this->stockledger_model->getcount($section_id, $product);

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

        $this->data['stocks'] = $this->stockledger_model->get_stocks_filterd($section_id, $product, $config["per_page"], $offset);
        $this->data['link'] = $this->pagination->create_links();

        $this->data['title'] = 'Stock Ledger Reports';
        $this->data['breadcrumbs'] = 'Stock Ledger Reports';
        $view = $this->load->view('report/stockledger', $this->data, true);
        $this->output->set_output($view);
    }
}
