<?php 
Class User_model extends CI_model
{
    var $tableUser  = 'user';

    public function __construct()
    {
        parent::__construct();
    }

    public function findAll(){
        echo 'table uesr';
    }
    
    public function login($username, $password){
        $this->db->select('*');
        $this->db->where('username',$username);
        $this->db->where('password',$password);
        $query = $this->db->get($this->tableUser);
        if ($query->num_rows() == 1) {
            $result = $query->result();
            return $result[0];
        }
        return false;
    }

   
}