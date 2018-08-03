<?php
defined('BASEPATH') OR exit('No direct script access allowed');

require_once APPPATH . '/libraries/REST_Controller.php';
require_once APPPATH . '/libraries/JWT.php';
require_once APPPATH . '/libraries/BeforeValidException.php';
require_once APPPATH . '/libraries/ExpiredException.php';
require_once APPPATH . '/libraries/SignatureInvalidException.php';
use \Firebase\JWT\JWT;

Class Posts extends REST_Controller{

    protected $allowed_http_methods = array('get', 'delete', 'post', 'put', 'patch', 'head');

    public function __construct(){
        parent::__construct();
        $this->load->model('Post_model');
        header("Access-Control-Allow-Origin: * ");
        header("Access-Control-Allow-Headers: X-API-KEY, Origin, X-Requested-With, Content-Type, Accept, Access-Control-Request-Method, Authorization, No-Auth");  
        $method = $_SERVER['REQUEST_METHOD'];
        if($method == "OPTIONS") {
            die();
        }
    }

    function listposts_post(){
        $data = array();
        $limit = 3; 
        // print_r($_POST);  
        if(isset($_POST['name']))    { $name     = $this->post('name'); }
        if(isset($_POST['page']))    { $page     = $this->post('page'); }
        if(isset($_POST['typeUser'])){ $typeUser = $this->post('typeUser');}
        if(isset($_POST['typeSort'])){ $typeSort = $this->post('typeSort');}

        if(!isset($name)){
            // echo 'khong post name';
            $numrow = $this->Post_model->countall($name = '',$typeUser); //8
            $totalPage = ceil($numrow/$limit);
            $start = ($page*$limit);
            $result = $this->Post_model->getPostLimit($name = '',$typeUser,$start,$limit);
            $data['result'] = $result;
            $data['totalPage'] = $totalPage;
            echo json_encode($data);
        }else{
            // echo 'có post name'; 
            $numrow = $this->Post_model->countall($name,$typeUser);
            $totalPage = ceil($numrow/$limit);
            $start = ($page*$limit);
            $result = $this->Post_model->getPostLimit($name,$typeUser,$typeSort,$start,$limit);
            $data['result'] = $result;
            $data['totalPage'] = $totalPage;
            echo json_encode($data);
        }

        // start = (page*limit)-limit+1;
        //totalPage = ceil(numrow/limit);   
        //page  start           limit
        // 0    1,2,3          3
        // 1   4,5,6
        // 2   7,8,9
    }

    function listPostsChild_post(){
        $data = array();
        $limit = 3;  
        if(isset($_POST['id']))      { $id     = $this->post('id'); }
        if(isset($_POST['page']))    { $page     = $this->post('page'); }
        if(isset($_POST['typeUser'])){ $typeUser = $this->post('typeUser');}
        if(isset($_POST['typeSort'])){ $typeSort = $this->post('typeSort');}

        if(!isset($id)){
            // echo 'khong post name';
            $numrow = $this->Post_model->countAllChildCatalog($id = 0,$typeUser); //8
            $totalPage = ceil($numrow/$limit);
            $start = ($page*$limit);
            $result = $this->Post_model->getPostLimitChild($id = 0,$typeUser,$start,$limit);
            $data['result'] = $result;
            $data['totalPage'] = $totalPage;
            echo json_encode($data);
        }else{
            // echo 'có post name'; 
            $numrow = $this->Post_model->countAllChildCatalog($id,$typeUser);
            $totalPage = ceil($numrow/$limit);
            $start = ($page*$limit);
            $result = $this->Post_model->getPostLimitChild($id,$typeUser,$typeSort,$start,$limit);
            $data['result'] = $result;
            $data['totalPage'] = $totalPage;
            echo json_encode($data);
        }
    }

    function postDetail_post(){
        $id = $_POST['id'];
        $list = $this->Post_model->getPostDetail($id);
        echo json_encode($list);
    }


}