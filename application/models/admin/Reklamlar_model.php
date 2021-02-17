<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Reklamlar_model extends CI_Model {

	public function get_all(){

	    $result = $this->db->get("reklamlar")->result();
        return $result;
	}

    public function get($where){
        
		$result = $this->db->where($where)->get("reklamlar")->row();
        return $result;
	}

    public function update($where, $data){
		
        $update = $this->db->where($where)->update("reklamlar", $data);
        return $update;
	}

	public function reklam_getir($where){
        $this->db->select('reklamlar.*');
        $this->db->where('reklamlar.reklam_tipi', $where);
        $query = $this->db->get('reklamlar')->row();
        return $query;
    }

}
