<?php 
Class Location_model extends CI_model
{
    var $tableDistrict      = 'district';
    var $tableGrovince      = 'province';

    public function __construct()
    {
        parent::__construct();
    }

    public function listDetailt(){
        $query = $this->db->query("SELECT `pro`.`name` as provinceName ,`pro`.`id` as provinceId,`dis`.`name`,`dis`.`id`  FROM `".$this->tableDistrict."` as `dis`,`".$this->tableGrovince."` as `pro` where `pro`.`id` = `dis`.`id_province`");
        return $query->result();
    }
   
}