<?php
defined('BASEPATH') OR exit('No direct script access allowed');

require_once APPPATH . '/libraries/REST_Controller.php';
require_once APPPATH . '/libraries/JWT.php';
require_once APPPATH . '/libraries/BeforeValidException.php';
require_once APPPATH . '/libraries/ExpiredException.php';
require_once APPPATH . '/libraries/SignatureInvalidException.php';
use \Firebase\JWT\JWT;

Class User extends REST_Controller{
    protected $allowed_http_methods = array('get', 'delete', 'post', 'put', 'patch', 'head');

    public function __construct(){
        parent::__construct();
        $this->load->model('User_model');

		header("Access-Control-Allow-Origin: * ");
        header("Access-Control-Allow-Headers: X-API-KEY, Origin, X-Requested-With, Content-Type, Accept, Access-Control-Request-Method, Authorization, No-Auth");  
        $method = $_SERVER['REQUEST_METHOD'];
        if($method == "OPTIONS") {
            die();
        }
    }
    
    function login_post(){
        $u = $this->post('username');
        $p = md5($this->post('password'));
        $invalidLogin = ['invalid' => $u];
        $secretSignature = $this->config->item('secretkey');
        if(!$u || !$p) $this->response($invalidLogin, REST_Controller::HTTP_NOT_FOUND);
        $result = $this->User_model->login($u,$p);
        if($result) 
        {
            $token['id'] = $result->id;
            $token['name'] = $result->name;
            $token['phone'] = $result->phone;
            $token['date_join'] = $result->date_join;
            $token['email'] = $result->email;
            $date = new DateTime();
            $token['iat'] = $date->getTimestamp();
            $token['exp'] = $date->getTimestamp() + 60*60*5;
            $output['name'] = $result->name;
            $output['user_token'] = JWT::encode($token, $secretSignature);
            $this->set_response($output, REST_Controller::HTTP_OK);
        }
        else 
        {
            $this->set_response($invalidLogin, REST_Controller::HTTP_NOT_FOUND);
        }
    }

    public function checkuser_get(){
        $headers = $this->input->get_request_header('Authorization');
      
        if($headers)
        {
            $secretSignature = $this->config->item('secretkey');
            $token= "token";
            if (!empty($headers)) 
            {
                if (preg_match('/Bearer\s(\S+)/', $headers , $matches)) {
                    $token = $matches[1];
                }
            }
            try {
                $decoded = JWT::decode($token, $secretSignature, array('HS256'));
                return $this->set_response($decoded, REST_Controller::HTTP_OK);
            }
            catch (Exception $e) {
                $invalid = ['error' => $e->getMessage()]; //Respon if credential invalid
                $this->response($invalid, 401);//401
            }   
        }
    }

    function register_post()
    {
        $n = $this->post('name');
        $u = $this->post('username');
        $e = $this->post('email');
        $p = md5($this->post('password'));
        $invalidRegister = ['exist' => $u];
        $existUser = $this->User_model->check_exist($u);
        if(!$existUser)
        {
            $data = array(
                'name'      => $n,
                'username'  => $u,
                'password'  => $p,
                'email'     => $e
            );
            $id = $this->User_model->insertUser($data);   
            $secretSignature = $this->config->item('secretkey');
            $token['id'] = $id;
            $token['name'] = $n;
            $token['email'] = $e;
            $date = new DateTime();
            $token['iat'] = $date->getTimestamp();
            $token['exp'] = $date->getTimestamp() + 60*60*5;
            $output['name'] = $n;
            $output['user_token'] = JWT::encode($token, $secretSignature);
            $this->set_response($output, REST_Controller::HTTP_OK);
            
        }else{
            $this->set_response($invalidRegister, REST_Controller::HTTP_OK);
        }
        
    }

}