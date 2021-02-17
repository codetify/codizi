<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Sayfalar_model extends CI_Model {

	public function get_all(){
		
        $result = $this->db->get("sayfalar")->result();
        
        return $result;
	}

    public function get($where){
        
		$result = $this->db->where($where)->get("sayfalar")->row();
        
        return $result;
	}
    
    public function insert($data){
                
        $insert = $this->db->insert("sayfalar", $data);
        return $insert;
		
	}
    
    public function update($where, $data){
		
        $update = $this->db->where($where)->update("sayfalar", $data);
        return $update;
	}
    
    public function delete($where){
		
        $delete = $this->db->where($where)->delete("sayfalar");
        return $delete;
	}

	public function get_aktif(){
	    $result = $this->db->where("sayfa_durum=1")->get("sayfalar")->result();
	    return $result;
    }
}
