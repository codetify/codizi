<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Admin_model extends CI_Model {
    
    public function get($where = array()){
		$row = $this->db->where($where)->get("uyeler")->row();
        return $row;
	}
    
    function istatistikler(){
        $data['dizi_sayisi'] = $this->db->count_all('diziler');
        $data['bolum_sayisi'] = $this->db->count_all('dizi_bolum');
        $data['yorum_sayisi'] = $this->db->count_all('yorumlar');
        $data['ziyaretci_sayisi'] = $this->db->count_all('diziler');
        $data['iletisim_mesaj_sayisi'] = $this->db->count_all('iletisim');
        ## Toplam Görüntülenme Sayısı ##
        $this->db->select_sum('dizi_goruntulenme');
        $result = $this->db->get('diziler')->row();
        $data['dizi_goruntulenme'] =  $result->dizi_goruntulenme;
        ## Toplam Görüntülenme Sayısı ##

        return $data;
        
        
        
    }
}
