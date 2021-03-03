<?php
defined('BASEPATH') or exit('No direct script access allowed');

class Currentstock extends Admin_Base_Controller
{
    public function __construct()
    {
        parent::__construct();
        $this->load->library('table');
        $this->load->library('pagination');
        $this->load->helper('form');
        $this->load->helper('url');

        $this->load->model('Currentstock_model');
    }

    public function getCurrentStocklist()
    {
        $stockdate = "";
        $product = array();
        if ($this->input->post('submit') != null) {
            $stockdate = $this->input->post('stockdate');
            $product = $this->input->post('product_id');
        }

        $config = array();
        $config['base_url'] = base_url() . 'report/Currentstock/getCurrentStocklist';
        $config['per_page'] = 20;
        $config['total_rows'] = $this->Currentstock_model->getcount($stockdate, $product);

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

        $this->data['stocks'] = $this->Currentstock_model->get_stocks_filterd($stockdate, $product, $config["per_page"], $offset);
        $this->data['link'] = $this->pagination->create_links();
        $this->data['stocks_for_excel'] = $this->Currentstock_model->get_stocks_excel($stockdate, $product);

        $this->data['title'] = 'Current Stock';
        $this->data['breadcrumbs'] = 'Current Stock Reports';
        $view = $this->load->view('report/currentstock', $this->data, true);
        $this->output->set_output($view);
    }

    public function exportCSV()
    {
        $stockdate = "";
        $product = array();
        if ($this->input->post('export') != null) {
            $stockdate = $this->input->post('stockdate');
            $product = $this->input->post('product_id');
        }
        // file name
        $filename = 'stocks_' . date('Ymd') . '.csv';
        header('Content-Description: File Transfer');
        header('Content-Type: application/octet-stream');
        header("Content-Disposition: attachment; filename=$filename");
        header('Content-Transfer-Encoding: binary');
        header('Expires: 0');
        header('Cache-Control: must-revalidate, post-check=0, pre-check=0');
        header('Pragma: public');
        echo "\xEF\xBB\xBF"; // UTF-8 BOM

        // get data
        $currentStockData = $this->Currentstock_model->get_stocks_excel($stockdate, $product);

        // file creation
        $file = fopen('php://output', 'w');

        $header = array("Record", "Product", "Date", "Stock Available");
        fputcsv($file, $header);
        foreach ($currentStockData as $key => $line) {
            fputcsv($file, $line);
        }
        fclose($file);
        exit;
    }

}
