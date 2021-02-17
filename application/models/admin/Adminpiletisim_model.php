<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Adminpiletisim_model extends CI_Model {

	public function get_all(){
		
        $result = $this->db->get("iletisim")->result();
        
        return $result;
	}

    public function get($where){
        
		$result = $this->db->where($where)->get("iletisim")->row();
        
        return $result;
	}
    
    public function delete($where){
		
        $delete = $this->db->where($where)->delete("iletisim");
        return $delete;
	}
}
