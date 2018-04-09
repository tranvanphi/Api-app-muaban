<?php 
Class Cities_model extends CI_model
{
    public function __construct()
    {
        parent::__construct();
    }

    public function get($id = null)
    {
        if(!is_null($id))
        {
            // $query = 'select * from cities where id = '.$id;
            // $this->db->query($query);
            $query= $this->db->select('*')->from('cities')->where('id', $id)->get();

            if($query->num_rows() === 1)
            {
                return $query->row_array();
            }
            return flase;
        }

        // $query = 'select * from cities';
        // $result = $this->db->query($query);
        // print_r($result->result_array());

        $query = $this->db->select('*')->from('cities')->get();
        if($query->num_rows() > 0)
        {
            return $query->result_array();
        }
        return false;
    }

    public function save($city)
    {
        $this->db->set($this->_setCity($city))->insert('cities');
        if($this->db->affected_rows() === 1)
        {
            return $this->db->insert_id();
        }
        return false;
    }

    public function update($id, $city)
    {
        $this->db->set($this->_setCity($city))->where('id', $id)->update('cities');
        if($this->db->affected_rows() === 1)
        {
            return true;
        }
        return false;
    }

    public function delete($id)
    {
        $this->db->where('id',$id)->delete('cities');
        if($this->db->affected_rows() === 1)
        {
            echo '2222';
            return true;
        }
        return false;
    }


    private function _setCity($city)
    {
        return array(
            'id' => $city['id'],
            'name' => $city['name']
        );
    }
}