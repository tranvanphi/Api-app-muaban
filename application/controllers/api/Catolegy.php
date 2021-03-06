<?php
defined('BASEPATH') OR exit('No direct script access allowed');

require_once APPPATH . '/libraries/REST_Controller.php';
require_once APPPATH . '/libraries/JWT.php';
require_once APPPATH . '/libraries/BeforeValidException.php';
require_once APPPATH . '/libraries/ExpiredException.php';
require_once APPPATH . '/libraries/SignatureInvalidException.php';
use \Firebase\JWT\JWT;

Class Catolegy extends REST_Controller{

    protected $allowed_http_methods = array('get', 'delete', 'post', 'put', 'patch', 'head');

    public function __construct(){
        parent::__construct();
        $this->load->model('Catolegy_model');
        header("Access-Control-Allow-Origin: * ");
        header("Access-Control-Allow-Headers: X-API-KEY, Origin, X-Requested-With, Content-Type, Accept, Access-Control-Request-Method, Authorization, No-Auth");  
        $method = $_SERVER['REQUEST_METHOD'];
        if($method == "OPTIONS") {
            die();
        }
    }


	function findAll_get(){
        $catolegy = $this->Catolegy_model->findAll();
        echo json_encode($catolegy);
	}

	function findAllDetalt_get(){
        // echo json_encode($_GET);
        // return false;
	    $catelogy_detail = $this->Catolegy_model->listDetailt();
        echo json_encode($catelogy_detail);
	}
}