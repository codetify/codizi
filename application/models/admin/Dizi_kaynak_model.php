<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Dizi_kaynak_model extends CI_Model {

	public function get_all(){

        $this->db->join('diziler', 'diziler.id = dizi_kaynak.dizi_id');
        $this->db->select('dizi_kaynak.*, diziler.dizi_url as dizi_url');
        $this->db->where('dizi_kaynak.kaynak_durum', 1);
        $query = $this->db->get('dizi_kaynak')->result();
        return $query;
	}

    public function get($where){
        
		$result = $this->db->where($where)->get("dizi_kaynak")->row();
        
        return $result;
	}

    public function insert($data){

        $insert = $this->db->insert("dizi_kaynak", $data);
        return $insert;

    }
    
    public function update($where, $data){
		
        $update = $this->db->where($where)->update("dizi_kaynak", $data);
        return $update;
	}
    
    public function delete($where){
		
        $delete = $this->db->where($where)->delete("dizi_kaynak");
        return $delete;
	}


    public function diziler(){
        $result = $this->db->get("diziler")->result();
        return $result;
    }

    public function dizi_kynk_gtr($dizi_id, $sezon_id, $bolum_id){

	    $this->db->select('dizi_kaynak.*');
        $this->db->where('dizi_kaynak.kaynak_durum', 1);
        $this->db->where('dizi_kaynak.dizi_id', $dizi_id);
        $this->db->where('dizi_kaynak.sezon_id', $sezon_id);
        $this->db->where('dizi_kaynak.bolum_id', $bolum_id);
        $query = $this->db->get('dizi_kaynak')->result();
        return $query;
    }
}
