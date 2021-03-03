<?php

class Currentstock_model extends CI_Model
{
    public $_table = 'current_stocks';
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

    public function get_stocks_filterd($stockdate = "", $product = array(), $limit, $offset)
    {
        $this->db->select('cs.id as currentstockid, p.`name` AS product_name, cs.date AS stockdate, cs.available_stock AS stock_available')
            ->from('`current_stock` AS cs')
            ->join('products as p', 'cs.product_id = p.id', 'left');
        if ($stockdate != '') {
            $this->db->where('cs.date', $stockdate);
        }
        if (!empty($product)) {
            $this->db->where_in('cs.product_id', $product);
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

    public function getcount($stockdate = "", $product = array())
    {
        $query = $this->db->select('p.`name` AS product_name, cs.date AS stockdate, cs.available_stock AS stock_available')
            ->from('`current_stock` AS cs')
            ->join('products as p', 'cs.product_id = p.id', 'left');
        if ($stockdate != '') {
            $query = $this->db->where('cs.date', $stockdate);
        }
        if (!empty($product)) {
            $query = $this->db->where_in('cs.product_id', $product);
        }
        if (!empty($product)) {
            $query = $this->db->where_in('cs.product_id', $product);
        }

        return $query->count_all_results();
    }

    public function get_stocks_excel($stockdate = "", $product = array())
    {
        $this->db->select('cs.id as currentstockid, p.`name` AS product_name, cs.date AS stockdate, cs.available_stock AS stock_available')
            ->from('`current_stock` AS cs')
            ->join('products as p', 'cs.product_id = p.id', 'left');
        if ($stockdate != '') {
            $this->db->where('cs.date', $stockdate);
        }
        if (!empty($product)) {
            $this->db->where_in('cs.product_id', $product);
        }
        $query = $this->db->get();
        if ($query->num_rows() > 0) {
            foreach ($query->result_array() as $row) {
                $data[] = $row;
            }
            return $data;
        }
        return false;
    }
}
