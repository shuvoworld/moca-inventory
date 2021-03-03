<?php
defined('BASEPATH') or exit('No direct script access allowed');

class Events extends CI_Controller
{

    public function __construct()
    {
        parent::__construct();
    }

    public function updateCurrentStockTable()
    {
        if ($this->db->simple_query('INSERT INTO current_stock (product_id, available_stock, date, updated_at)
        SELECT id,stock_available,CURDATE(),now() FROM products')) {
            echo "Success!";
        } else {
            echo "Query failed!";
        }
    }

}
