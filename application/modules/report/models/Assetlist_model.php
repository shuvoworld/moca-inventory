<?php

class Assetlist_model extends CI_Model
{
    public $_table = 'assets';
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

    public function get_assets_filterd($asset = array(), $limit, $offset)
    {
        $this->db->select('assets.`name` AS asset_name, count(assets_tracking.id) as total_asset')
            ->from('`assets`')
            ->join('assets_tracking', 'assets.id = assets_tracking.asset_id', 'left')
            ->group_by('assets.id');

        if (!empty($asset)) {
            $this->db->where_in('assets.id', $asset);
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

    public function getcount($asset = array())
    {
        $query = $this->db->select('assets.`name` AS asset_name, count(assets_tracking.id) as total_asset')
            ->from('`assets`')
            ->join('assets_tracking', 'assets.id = assets_tracking.asset_id', 'left')
            ->group_by('assets.id');

        if (!empty($asset)) {
            $query = $this->db->where_in('assets.id', $asset);
        }

        return $query->count_all_results();
    }

    public function get_assets_excel($asset = array())
    {
        $this->db->select('assets.`name` AS asset_name, count(assets_tracking.id) as total_asset')
            ->from('`assets`')
            ->join('assets_tracking', 'assets.id = assets_tracking.asset_id', 'left')
            ->group_by('assets.id');

        if (!empty($asset)) {
            $this->db->where_in('assets.id', $asset);
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
