<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Diziler_model extends CI_Model {

	public function get_all(){
		
        $result = $this->db->get("diziler")->result();
        
        return $result;
	}

    public function get($where){
        
		$result = $this->db->where($where)->get("diziler")->row();
        
        return $result;
	}

    public function insert($data){

        $insert = $this->db->insert("diziler", $data);
        return $insert;

    }
    
    public function update($where, $data){
		
        $update = $this->db->where($where)->update("diziler", $data);
        return $update;
	}
    
    public function delete($where){
		
        $delete = $this->db->where($where)->delete("diziler");
        return $delete;
	}
	
    function update_counter($id) {
    $this->db->where('id', $id);
    $this->db->select('dizi_goruntulenme');
    $count = $this->db->get('diziler')->row();
    $this->db->where('id', $id);
    $this->db->set('dizi_goruntulenme', ($count->dizi_goruntulenme + 1));
    $this->db->update('diziler');
    }

    public function kategoriler_v2(){
        $result = $this->db->get("kategoriler")->result();
        return $result;
    }

    public function admin_son_diziler(){
        $this->db->select('diziler.*');
        $this->db->where('diziler.dizi_durum', 1);
        $query = $this->db->get('diziler')->result();
        return $query;
    }

    public function begeni_ekle($data){

        $insert = $this->db->insert("begeniler", $data);
        return $insert;

    }
}
