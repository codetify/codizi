<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Bolumler_model extends CI_Model {

	public function get_all($where, $order = "rank ASC"){
		
        $result = $this->db->where($where)->order_by($order)->get("dizi_bolum")->result();
        
        return $result;
	}

    public function get_all_limit_home($where, $order = "rank ASC", $limit = array("count" => 20, "start" => 0)){
		
        $result = $this->db->where($where)->order_by($order)->limit($limit["count"], $limit["start"])->get("dizi_bolum")->result();
        
        return $result;
	}

    public function get_all_count($where){
		
        $result = $this->db->where($where)->count_all_results("dizi_bolum");
        
        return $result;
	}

    public function get($where){
        
		$result = $this->db->where($where)->get("dizi_bolum")->row();
        
        return $result;
	}

    public function insert($data){

        $insert = $this->db->insert("dizi_bolum", $data);
        return $insert;

    }
    
    public function update($where, $data){
		
        $update = $this->db->where($where)->update("dizi_bolum", $data);
        return $update;
	}
    
    public function delete($where){
		
        $delete = $this->db->where($where)->delete("dizi_bolum");
        return $delete;
	}
}
