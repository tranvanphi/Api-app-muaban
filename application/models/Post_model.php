<?php 
Class Post_model extends CI_model
{
    var $Catolegy      = 'catelogy';
    var $GroupCatolegy = 'group_catelogy';
    var $tPost         = 'post';

    public function __construct()
    {
        parent::__construct();
    }
 
    public function getWhere($id){
        $query = $this->db->query("SELECT p.title,p.content,p.image_list,p.date_post, cat.name, grcat.name as namegroup FROM `".$this->tPost."` as p,`".$this->Catolegy."` as cat ,`".$this->GroupCatolegy."` as grcat WHERE p.id_catelogy = cat.id and cat.id_group = grcat.id and grcat.id = ".$id);
        return $query->result();
        
    }

    public function getId($name){
        $query = $this->db->query("SELECT * FROM `group_catelogy` where `group_catelogy`.`alias_name` = '".$name."'");
        return $query->result();
    }


    //===============================================================
    public function countall($name,$typeUser){
        $str = "SELECT `post`.`id`, `post`.`title` FROM ((((( post INNER JOIN user ON post.id_user = user.id) INNER JOIN catelogy ON catelogy.id = post.id_catelogy) INNER JOIN district on post.location = district.id) INNER JOIN province on province.id = district.id_province) inner JOIN group_catelogy on group_catelogy.id = catelogy.id_group) where group_catelogy.alias_name = '".$name."'";
        if($typeUser != 'all'){
            $str = $str." and `user`.`type` = ".$typeUser;
        }
        $query = $this->db->query($str);
        return $query->num_rows();
    }

    public function countAllChildCatalog($id,$typeUser){
        $str = "SELECT `post`.`id`, `post`.`title` FROM ((((( post INNER JOIN user ON post.id_user = user.id) INNER JOIN catelogy ON catelogy.id = post.id_catelogy) INNER JOIN district on post.location = district.id) INNER JOIN province on province.id = district.id_province) inner JOIN group_catelogy on group_catelogy.id = catelogy.id_group) where catelogy.id = '".$id."'";
        if($typeUser != 'all'){
            $str = $str." and `user`.`type` = ".$typeUser;
        }
        $query = $this->db->query($str);
        return $query->num_rows();
    }

    public function getPostLimit($name,$typeUser,$typeSort,$start,$limit){
        $str = "SELECT `group_catelogy`.`name` as groupCatelogy,`post`.`img_avatar`,`user`.`name`,`user`.`phone`,`post`.`id`, `post`.`location`, `post`.`title`,`post`.`price`,`post`.`content`, `post`.`image_list`, `post`.`date_post`,`catelogy`.`name` as nameCatelog , `district`.`name` as nameDistrict, `province`.`name` as nameProvince FROM ((((( post INNER JOIN user ON post.id_user = user.id) INNER JOIN catelogy ON catelogy.id = post.id_catelogy) INNER JOIN district on post.location = district.id) INNER JOIN province on province.id = district.id_province) inner JOIN group_catelogy on group_catelogy.id = catelogy.id_group) where group_catelogy.alias_name = '".$name."'";
        if($typeUser != 'all'){
            $str = $str." and `user`.`type` = ".$typeUser;
        }
        if($typeSort == 'date'){
            $str = $str." ORDER BY `post`.`date_post` DESC LIMIT ".$start.",".$limit;
        }else{
            $str = $str." ORDER BY `post`.`price` DESC LIMIT ".$start.",".$limit;
        }
        $query = $this->db->query($str);      
        return $query->result();
    }

    public function getPostLimitChild($id,$typeUser,$typeSort,$start,$limit){
        $str = "SELECT `group_catelogy`.`name` as groupCatelogy,`post`.`img_avatar`,`user`.`name`,`user`.`phone`,`post`.`id`, `post`.`location`, `post`.`title`,`post`.`price`,`post`.`content`, `post`.`image_list`, `post`.`date_post`,`catelogy`.`name` as nameCatelog , `district`.`name` as nameDistrict, `province`.`name` as nameProvince FROM ((((( post INNER JOIN user ON post.id_user = user.id) INNER JOIN catelogy ON catelogy.id = post.id_catelogy) INNER JOIN district on post.location = district.id) INNER JOIN province on province.id = district.id_province) inner JOIN group_catelogy on group_catelogy.id = catelogy.id_group) where catelogy.id = ".$id;
        if($typeUser != 'all'){
            $str = $str." and `user`.`type` = ".$typeUser;
        }
        if($typeSort == 'date'){
            $str = $str." ORDER BY `post`.`date_post` DESC LIMIT ".$start.",".$limit;
        }else{
            $str = $str." ORDER BY `post`.`price` ASC LIMIT ".$start.",".$limit;
        }
        $query = $this->db->query($str);      
        return $query->result();
    }
    
    
    public function getPostDetail($id){
        $str = "SELECT `group_catelogy`.`name` as groupCatelogy,`group_catelogy`.`alias_name`,`user`.`name`,`user`.`type` as typeUser,`user`.`phone`,`user`.`date_join`,`post`.`id`, `post`.`location`, `post`.`title`,`post`.`price`,`post`.`content`, `post`.`image_list`, `post`.`date_post`,`catelogy`.`name` as nameCatelog , `district`.`name` as nameDistrict, `province`.`name` as nameProvince FROM ((((( post INNER JOIN user ON post.id_user = user.id) INNER JOIN catelogy ON catelogy.id = post.id_catelogy) INNER JOIN district on post.location = district.id) INNER JOIN province on province.id = district.id_province) inner JOIN group_catelogy on group_catelogy.id = catelogy.id_group) where post.id = ".$id;
        $query = $this->db->query($str);      
        return $query->row();
    }

    public function insertPost($data){
        $this->db->insert($this->tPost,$data);
        return $this->db->insert_id();
    }
   
}