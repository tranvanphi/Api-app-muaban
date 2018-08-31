<?php
defined('BASEPATH') OR exit('No direct script access allowed');

require_once APPPATH . '/libraries/REST_Controller.php';
require_once APPPATH . '/libraries/JWT.php';
require_once APPPATH . '/libraries/BeforeValidException.php';
require_once APPPATH . '/libraries/ExpiredException.php';
require_once APPPATH . '/libraries/SignatureInvalidException.php';

require_once APPPATH . '/libraries/Upload_library.php';
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

    function addPosts_post(){
        $idUser = $this->post('iduser');
        $title = $this->post('title');
        $price = $this->post('price');
        $catalog = $this->post('catalog');
        $location = $this->post('location');
        $image_list = $this->post('image_list');
        $content = $this->post('content');

        $pos = strpos($image_list, ',');
        if ($pos !== false) {
            $image_avatar = substr($image_list, 0, $pos);
        }else{
            $image_avatar = $image_list;
        }
        
        $data = array(
            'id_user' => $idUser,
            'title'    => $title,
            'price'    => $price,
            'id_catelogy'  => $catalog,
            'location' => $location,
            'content'  => $content,
            'img_avatar' =>$image_avatar,
            'image_list' => $image_list
        );
        $id = $this->Post_model->insertPost($data);
        if(!$id)
        {
            $output['id'] = $id;
            $this->set_response($output, REST_Controller::HTTP_OK);
        }else{
            $output['status'] = 'wrong when add post';
            $this->set_response($output, REST_Controller::HTTP_OK);
        }
        
    }



    function uploads_post(){
        $this->load->library('upload');
        // print_r($_FILES);
        if($_FILES['image']['size'] > 0){
            $config['upload_path'] = 'uploads/posts/';
            $config['allowed_types'] = 'gif|jpg|png';
            $config['max_width'] = 10000;
            $config['max_height'] = 10000;
            $config['overwrite'] = false;
            // $config['encrypt_name'] = true;
            $config['max_filename'] = 50;
            $this->upload->initialize($config);

            // if(!$this->upload->do_upload('file')){
            if(!$this->upload->do_upload('image')){
                $error = $this->upload->display_errors();
                $output['status'] = false;
                $output['message'] = $error;
                $this->set_response($output, REST_Controller::HTTP_OK);
            }else{
                $data = array('upload_data' => $this->upload->data());
                $output['status'] = true;
                $output['namefile'] = $data['upload_data']['file_name'];
                $this->set_response($output, REST_Controller::HTTP_OK);
            }
        }else{
            $output['status'] = false;
            $output['message'] = 'Select file';
            $this->set_response($output, REST_Controller::HTTP_NOT_FOUND);
        }
    }

    function removeFile_post(){
        $this->load->helper('url'); 
        $uploadPath = 'uploads/posts/';
        // print_r($_POST);
        $filename = $uploadPath.$_POST['filename'];
        echo $filename.'<br/>';
        if (file_exists($filename)) {
            unlink($filename);
            echo "có";
            $output['status'] = true;
            $output['message'] = 'delete file';
            $this->set_response($output, REST_Controller::HTTP_OK);
        }else{
            $output['status'] = false;
            $output['message'] = 'file not exist';
            $this->set_response($output, REST_Controller::HTTP_NOT_FOUND);
        }
    }

}