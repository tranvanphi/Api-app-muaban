<?php
defined('BASEPATH') OR exit('No direct script access allowed');

require_once APPPATH . '/libraries/REST_Controller.php';
require_once APPPATH . '/libraries/JWT.php';
require_once APPPATH . '/libraries/BeforeValidException.php';
require_once APPPATH . '/libraries/ExpiredException.php';
require_once APPPATH . '/libraries/SignatureInvalidException.php';
use \Firebase\JWT\JWT;

Class Location extends REST_Controller{

    protected $allowed_http_methods = array('get', 'delete', 'post', 'put', 'patch', 'head');

    public function __construct(){
        parent::__construct();
        $this->load->model('Location_model');
        header("Access-Control-Allow-Origin: * ");
        header("Access-Control-Allow-Headers: X-API-KEY, Origin, X-Requested-With, Content-Type, Accept, Access-Control-Request-Method, Authorization, No-Auth");  
        $method = $_SERVER['REQUEST_METHOD'];
        if($method == "OPTIONS") {
            die();
        }
    }

	function findAllDetalt_get(){
        // echo json_encode($_GET);
        // return false;
	    $location_detail = $this->Location_model->listDetailt();
        echo json_encode($location_detail);
	}
}