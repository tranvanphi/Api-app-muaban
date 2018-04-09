<?php
defined('BASEPATH') OR exit('No direct script access allowed');

require APPPATH . 'libraries/REST_Controller.php';

class Cities extends REST_Controller 
{

    public function __construct()
    {
        parent::__construct();
        $this->load->model('Cities_model');
    }

    public function index_get()
    {
       
        $cities = $this->Cities_model->get();

        if(!is_null($cities))
        {
            $this->response(array('response' => $cities), 200);
        } else {
            $this->response(array('error' => 'no item in databse'), 404);
        }
    }

    public function find_get($id)
    {
        if(!$id)
        {
            $this->response(null, 400);
        }
        $city = $this->Cities_model->get($id);
        if(!is_null($city))
        {
            $this->response(array('response' => $city), 200);
        }else{
            $this->response(array('error' => 'no item in databse'), 404);
        }
    }

    public function index_post()
    {
     
        if($this->post('city'))
        {
            $this->response(null, 400);
        }
        $this->Cities_model->save($this->post('city'));
        if(!is_null($id))
        {
            $this->response(array('response' => $id), 200);
        }else{
            $this->response(array('error' => 'no add'), 400);
        }
    }

    public function index_put($id)
    {

        
        if(!$this->put('city') || !$id)
        {
            $this->response(null, 400);
        }
        $update = $this->Cities_model->update($id, $this->put('city'));

        if(!is_null($update))
        {
            $this->response(array('response' => 'update scussess'), 200);
        }else{
            $this->response(array('error' => 'no update scussess'), 400);
        } 
    }

    public function index_delete($id)
    {
        if(!$id)
        {
            $this->response(null, 400);
        }
        $delete = $this->Cities_model->delete($id);

        if(!is_null($delete))
        {
            $this->response(array('response' => 'delete scussess'), 200);
        }else{
            $this->response(array('error' => 'no delete scussess'), 400);
        } 
    }
}
