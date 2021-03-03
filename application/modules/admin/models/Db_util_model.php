<?php
class Db_util_model extends CI_Model
{
    public function __construct()
    {
        parent::__construct();
    }

    public function get_admin_profile()
    {
        $query = $this->db->select('*')
            ->from('admin')
            ->get();
        $result = $query->result_array();
        return $result;
    }
}
