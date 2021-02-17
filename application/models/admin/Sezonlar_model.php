<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Sezonlar_model extends CI_Model {

	public function get_all($where, $order = "rank ASC"){
		
        $result = $this->db->where($where)->order_by($order)->get("dizi_sezon")->result();
        
        return $result;
	}

    public function get($where){
        
		$result = $this->db->where($where)->get("dizi_sezon")->row();
        
        return $result;
	}

    public function insert($data){

        $insert = $this->db->insert("dizi_sezon", $data);
        return $insert;

    }
    
    public function update($where, $data){
		
        $update = $this->db->where($where)->update("dizi_sezon", $data);
        return $update;
	}
    
    public function delete($where){
		
        $delete = $this->db->where($where)->delete("dizi_sezon");
        return $delete;
	}
}
