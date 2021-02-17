<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Etiketler_model extends CI_Model {

   public function dizi_etiket_ekle($dizi_id){
        //etiket
        $etikets = trim($this->input->post('etiket', true));

        $etiket_array = explode(",", $etikets);
        foreach ($etiket_array as $etiket) {
            $etiket = trim($etiket);
            if (strlen($etiket) > 1) {
                $data = array(
                    'dizi_id' => $dizi_id,
                    'etiket' => trim($etiket),
                    'etiket_url' => str_slug($etiket),
                    'createdAt' => date("Y-m-d H:i:s")
                );
                //etiket ekle
                $this->db->insert('etiketler', $data);
            }
        }
    }
    public function dizi_etiket_guncelle($dizi_id){
        //eski etiketleri sil
        $this->etiketler_model->dizi_etiket_sil($dizi_id);

        $etikets = trim($this->input->post('etiket', true));

        $etikets_array = explode(",", $etikets);
        foreach ($etikets_array as $etiket) {
            $etiket = trim($etiket);
            if (strlen($etiket) > 1) {
                $data = array(
                    'dizi_id' => $dizi_id,
                    'etiket' => trim($etiket),
                    'etiket_url' => str_slug($etiket),
                    'updatedAt' => date("Y-m-d H:i:s")
                );
                //insert tag
                $this->db->insert('etiketler', $data);
            }
        }
    }
    
    public function etiket_getir($etiket_url)
    {
        $this->db->where('etiket_url', $etiket_url);
        $query = $this->db->get('etiketler');
        return $query->row();
    }

    public function dizi_etiketleri($dizi_id){
        $this->db->where('dizi_id', $dizi_id);
        $query = $this->db->get('etiketler');
        return $query->result();
    }
    public function dizi_etiket_sil($dizi_id){
        //etiket ara
        $etikets = $this->etiketler_model->dizi_etiketleri($dizi_id);

        foreach ($etikets as $etiket) {
            //sil
            $this->db->where('id', $etiket->id);
            $this->db->delete('etiketler');
        }
    }

}
