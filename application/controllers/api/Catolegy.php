<?php
defined('BASEPATH') OR exit('No direct script access allowed');

require_once APPPATH . '/libraries/REST_Controller.php';
require_once APPPATH . '/libraries/JWT.php';
require_once APPPATH . '/libraries/BeforeValidException.php';
require_once APPPATH . '/libraries/ExpiredException.php';
require_once APPPATH . '/libraries/SignatureInvalidException.php';
use \Firebase\JWT\JWT;

Class Catolegy extends REST_Controller{

    public function __construct(){
        parent::__construct();
        $this->load->model('Catolegy_model');

        header('Content-Type: application/json');
		header('Access-Control-Allow-Origin: *');
        header("Access-Control-Allow-Headers: X-API-KEY, Origin, X-Requested-With, Content-Type, Accept, Access-Control-Request-Method");
        header("Access-Control-Allow-Methods: GET, POST, OPTIONS, PUT, DELETE");
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