<?php
class Purchase_model extends CI_Model
{
    public $_table = 'purchases';
    public $primary_key = 'id';
    public $name = 'name';
    public $active = 'is_active';

    public function __construct()
    {
        parent::__construct();
    }

    // Insert New records
    public function create($insertData)
    {
        $result = $this->db->insert($this->_table, $insertData);
        return $result;
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

    public function get_all_with_joining()
    {
        $this->db->select('purchases.id as id, suppliers.company_name as supplier, purchases.purchase_date as purchase_date, purchases.updated_at as updated_at')
            ->from($this->_table)
            ->order_by($this->primary_key, 'DESC');
        $this->db->join('suppliers', 'suppliers.id = purchases.supplier_id');
        $query = $this->db->get();
        if ($query->num_rows() != 0) {
            return $query->result_array();
        } else {
            return false;
        }
    }

    public function getActiveProductData()
    {
        $sql = "SELECT * FROM products ORDER BY id DESC";
        $query = $this->db->query($sql, array(1));
        return $query->result_array();
    }

    // get the orders item data
    public function getOrdersItemData($purchase_id = null)
    {
        if (!$purchase_id) {
            return false;
        }

        $sql = "SELECT * FROM stockins WHERE purchase_id = ?";
        $query = $this->db->query($sql, array($purchase_id));
        return $query->result_array();
    }



    // get a record by id
    public function get_by_id($id)
    {
        $this->db->select('*')
            ->from($this->_table)
            ->where($this->primary_key, $id);
        $query = $this->db->get();
        if ($query->num_rows() != 0) {
            return $query->result_array();
        } else {
            return false;
        }
    }

    // check duplicate entry or already exists
    public function exist($data, $id)
    {
        $query = $this->db->select('*')
            ->from($this->_table)
            ->where($this->name, $data)
            ->where_not_in($this->primary_key, $id)
            ->get();
        $num = $query->num_rows();
        if ($num == 0) {
            return true;
        } else {
            return false;
        }
    }

    // edit a record
    public function edit($updateData, $updateId)
    {
        $result = $this->db->where($this->primary_key, $updateId)->update($this->_table, $updateData);
        return $result;
    }

    // delete a record
    public function delete($id)
    {
        $result = $this->db->delete($this->_table, array($this->primary_key => $id));
        return $result;
    }
}
