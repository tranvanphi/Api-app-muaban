<?php 
Class Catolegy_model extends CI_model
{
    var $tableCatolegy      = 'catelogy';
    var $tableGroupCatolegy = 'group_catelogy';

    public function __construct()
    {
        parent::__construct();
    }

    public function findAll(){
        $this->db->select('id,name,alias_name,image_lage');
        return $this->db->get($this->tableGroupCatolegy)->result();
    }
 
    public function listDetailt(){
        $query = $this->db->query("SELECT `cate`.`id_group`,`groupCate`.`name` as namegroup ,`groupCate`.`alias_name`,`cate`.`name`,`cate`.`id`  FROM `".$this->tableCatolegy."` as `cate`,`".$this->tableGroupCatolegy."` as `groupCate` where `groupCate`.`id` = `cate`.`id_group`");
        return $query->result();
    }
   
}