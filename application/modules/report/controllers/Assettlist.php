<?php
defined('BASEPATH') or exit('No direct script access allowed');

class Assettlist extends Admin_Base_Controller
{
    public function __construct()
    {
        parent::__construct();
        $this->load->library('table');
        $this->load->library('pagination');
        $this->load->helper('form');
        $this->load->helper('url');

        $this->load->model('Assetlist_model');
    }

    public function getTotalAssetCount()
    {
        $asset = array();
        if ($this->input->post('submit') != null) {
            $asset = $this->input->post('asset_id');
        }

        $config = array();
        $config['base_url'] = base_url() . 'report/Assettlist/getTotalAssetCount';
        $config['per_page'] = 10;
        $config['total_rows'] = $this->Assetlist_model->getcount($asset);

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

        $this->data['assetcounts'] = $this->Assetlist_model->get_assets_filterd($asset, $config["per_page"], $offset);
        $this->data['link'] = $this->pagination->create_links();
        $this->data['assets_for_excel'] = $this->Assetlist_model->get_assets_excel($asset);

        $this->data['title'] = 'Current Asset List';
        $this->data['breadcrumbs'] = 'Current Asset Reports';
        $view = $this->load->view('report/assettotallists', $this->data, true);
        $this->output->set_output($view);
    }

    public function exportCSV()
    {
        $asset = array();
        if ($this->input->post('export') != null) {
            $asset = $this->input->post('asset_id');
        }
        // file name
        $filename = 'assets_' . date('Ymd') . '.csv';
        header('Content-Description: File Transfer');
        header('Content-Type: application/octet-stream');
        header("Content-Disposition: attachment; filename=$filename");
        header('Content-Transfer-Encoding: binary');
        header('Expires: 0');
        header('Cache-Control: must-revalidate, post-check=0, pre-check=0');
        header('Pragma: public');
        echo "\xEF\xBB\xBF"; // UTF-8 BOM

        // get data
        $currentAssetData = $this->Assetlist_model->get_assets_excel($asset);

        // file creation
        $file = fopen('php://output', 'w');

        $header = array("Record", "Asset", "Available");
        fputcsv($file, $header);
        foreach ($currentAssetData as $key => $line) {
            fputcsv($file, $line);
        }
        fclose($file);
        exit;
    }

}
