<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Yoneticiler_model extends CI_Model {

	public function get_all(){
		
        $result = $this->db->get("uyeler")->result();
        
        return $result;
	}

    public function get($where){
        
		$result = $this->db->where($where)->get("uyeler")->row();
        
        return $result;
	}
    
    public function insert($data){
                
        $insert = $this->db->insert("uyeler", $data);
        return $insert;
		
	}
    
    public function update($where, $data){
		
        $update = $this->db->where($where)->update("uyeler", $data);
        return $update;
	}
    
    public function delete($where){
		
        $delete = $this->db->where($where)->delete("uyeler");
        return $delete;
	}
}
