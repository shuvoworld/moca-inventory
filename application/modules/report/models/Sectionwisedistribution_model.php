<?php

class Sectionwisedistribution_model extends CI_Model {
	public $_table = 'stockouts';
	public $primary_key = 'id';
	public $active = 'active';

	public function __construct() {
		parent::__construct();
	}

	// get all records
	public function get_all() {
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

	public function get_summary_filterd($section_id = "", $from_orderdate = "", $to_orderdate = "", $limit, $offset) {
		$this->db->select('sout.section_id,sout.product_id, count(*) as summary, p.name as product_name, sc.name as section')
			->from('stockouts as sout')
			->join('products as p', 'sout.product_id = p.id', 'left')
			->join('sections as sc', 'sout.section_id = sc.id', 'left');
		if ($section_id != '') {
			$this->db->where('sout.section_id', $section_id);
		}
		if ($from_orderdate != '') {
			$this->db->where('sout.date >=', $from_orderdate);
		}
		if ($to_orderdate != '') {
			$this->db->where('sout.date <=', $to_orderdate);
		}
		$this->db->group_by('sout.section_id');
		$this->db->group_by('sout.product_id');
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

	public function getcount($section_id = "", $from_orderdate, $to_orderdate) {
		$query = $this->db->select('sout.section_id,sout.product_id, count(*) as summary, p.name as product_name, sc.name as section')
			->from('stockouts as sout')
			->join('products as p', 'sout.product_id = p.id', 'left')
			->join('sections as sc', 'sout.section_id = sc.id', 'left');
		if ($section_id != '') {
			$query = $this->db->where('sout.section_id', $section_id);
		}
		if ($from_orderdate != '') {
			$query = $this->db->where('sout.date >=', $from_orderdate);
		}
		if ($to_orderdate != '') {
			$query = $this->db->where('sout.date <=', $to_orderdate);
		}
		$query = $this->db->group_by('sout.section_id');
		$query = $this->db->group_by('sout.product_id');

		return $query->count_all_results();
	}
}
