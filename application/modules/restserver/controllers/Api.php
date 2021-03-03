<?php
defined('BASEPATH') OR exit('No direct script access allowed');

require(APPPATH . 'libraries/REST_Controller.php');
require(APPPATH . 'libraries/Format.php');
use Restserver\Libraries\REST_Controller;
use Restserver\Libraries\Format;

class Api extends REST_Controller {

    function __construct()
    {
        // Construct the parent class
        parent::__construct();
    }


    public function products_get()
    {
		$products = $this->db->get('products')->result_array();

        $id = $this->get( 'id' );

        if ( $id === null )
        {
            // Check if the users data store contains users
            if ( $products )
            {
                // Set the response and exit
                $this->response( $products, 200 );
            }
            else
            {
                // Set the response and exit
                $this->response( [
                    'status' => false,
                    'message' => 'No producst were found'
                ], 404 );
            }
        }
        else
        {
            if ( array_key_exists( $id, $products ) )
            {
                $this->response( $products[$id], 200 );
            }
            else
            {
                $this->response( [
                    'status' => false,
                    'message' => 'No such product found'
                ], 404 );
            }
        }
    }


    public function suppliers_get()
    {
		$suppliers = $this->db->get('suppliers')->result_array();

        $id = $this->get( 'id' );

        if ( $id === null )
        {
            // Check if the users data store contains users
            if ( $suppliers )
            {
                // Set the response and exit
                $this->response( $suppliers, 200 );
            }
            else
            {
                // Set the response and exit
                $this->response( [
                    'status' => false,
                    'message' => 'No supplier were found'
                ], 404 );
            }
        }
        else
        {
            if ( array_key_exists( $id, $suppliers ) )
            {
                $this->response( $suppliers[$id], 200 );
            }
            else
            {
                $this->response( [
                    'status' => false,
                    'message' => 'No such supplier found'
                ], 404 );
            }
        }
    }
}