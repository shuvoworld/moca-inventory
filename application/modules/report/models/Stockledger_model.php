<?php

class Stockledger_model extends CI_Model
{
    public $_table = 'stocks';
    public $primary_key = 'id';
    public $name = 'name_BN';
    public $active = 'active';

    public function __construct()
    {
        parent::__construct();
    }

    // get all records
    public function get_all()
    {
        $this->db->select('*')
            ->from($this->_table)
            ->order_by($this->primary_key, 'DESC');
        $query = $this->db->get();
        if ($query->num_rows() != 0) {
            return $query->result_array();
        } else {
            return false;
        }
    }

    public function get_stocks_filterd($section_id = "", $product = array(), $limit, $offset)
    {
        $this->db->select('sout.*,p.name as product_name, sc.name as section')
            ->from('stockouts as sout')
            ->join('products as p', 'sout.product_id = p.id', 'left')
            ->join('sections as sc', 'sout.section_id = sc.id', 'left');
        if ($section_id != '') {
            $this->db->where('sout.section_id', $section_id);
        }
        if (!empty($product)) {
            $this->db->where_in('sout.product_id', $product);
        }
        $this->db->limit($limit, $offset);
        $query = $this->db->get();
        if ($query->num_rows() > 0) {
            foreach ($query->result() as $row) {
                $data[] = $row;
            }
            return $data;
        }
        return false;
    }

    public function getcount($section_id = "", $product = array())
    {
        $query = $this->db->select('sout.*,p.name as product_name, sc.name as section')
            ->from('stockouts as sout')
            ->join('products as p', 'sout.product_id = p.id', 'left')
            ->join('sections as sc', 'sout.section_id = sc.id', 'left');
        if ($section_id != '') {
            $query = $this->db->where('sout.section_id', $section_id);
        }
        if (!empty($product)) {
            $query = $this->db->where_in('sout.product_id', $product);
        }

        return $query->count_all_results();
    }
}
