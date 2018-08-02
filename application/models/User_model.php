<?php 
Class User_model extends CI_model
{
    var $tableUser  = 'user';

    public function __construct()
    {
        parent::__construct();
    }

    public function findId($id){
        $this->db->select('*');
        $this->db->where('id',$id);
        $query = $this->db->get($this->tableUser);
        if ($query->num_rows() == 1) {
            $result = $query->result();
            return $result[0];
        }
        return false;
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

    public function check_exist($username){
        $this->db->where('username',$username);
        $query = $this->db->get($this->tableUser);
        if ($query->num_rows() >= 1) {
            return  true;
        }
        return false;
    }

    public function insertUser($data)
    {
        $this->db->insert($this->tableUser,$data);
        return $this->db->insert_id();
    }
   
}