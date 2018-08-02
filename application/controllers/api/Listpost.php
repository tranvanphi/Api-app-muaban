<?php
defined('BASEPATH') OR exit('No direct script access allowed');

require_once APPPATH . '/libraries/REST_Controller.php';
require_once APPPATH . '/libraries/JWT.php';
require_once APPPATH . '/libraries/BeforeValidException.php';
require_once APPPATH . '/libraries/ExpiredException.php';
require_once APPPATH . '/libraries/SignatureInvalidException.php';
use \Firebase\JWT\JWT;

Class Listpost extends REST_Controller{

    public function __construct(){
        parent::__construct();
        $this->load->model('Post_model');

        header('Content-Type: application/json');
		header('Access-Control-Allow-Origin: *');
        header("Access-Control-Allow-Headers: X-API-KEY, Origin, X-Requested-With, Content-Type, Accept, Access-Control-Request-Method");
        header("Access-Control-Allow-Methods: GET, POST, OPTIONS, PUT, DELETE");
    }


	function findWhere_post(){
        $id = $_POST['id'];
        $list = $this->Post_model->getWhere($id);
        echo json_encode($list);
    }
    
    function getId_post(){
        $name = $_POST['name'];
        $id = $this->Post_model->getId($name);
        echo json_encode($id);
    }

}