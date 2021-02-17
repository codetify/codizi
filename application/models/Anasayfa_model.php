<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Anasayfa_model extends CI_Model {

    public function anasayfa_son_diziler(){
        $this->db->join('kategoriler', 'diziler.kategori_id = kategoriler.id');
        $this->db->select('diziler.*, kategoriler.kategori_adi as kategori_adi, kategoriler.kategori_url, uyeler.ad_soyad as uye_ad_soyad');
        $this->db->where('diziler.dizi_durum', 1);
        $query = $this->db->get('diziler')->result();
        return $query;
    }
    public function anasayfa_dizi_icerik($url){
        $this->db->join('uyeler', 'diziler.yazar_id = uyeler.id');
        $this->db->join('kategoriler', 'diziler.kategori_id = kategoriler.id');
        $this->db->select('diziler.* , kategoriler.kategori_adi as kategori_adi, kategoriler.kategori_url as kategori_url, uyeler.ad_soyad as uye_ad_soyad');
        $this->db->where('diziler.dizi_durum', 1);
        $this->db->where('diziler.dizi_url', $url);
        $query = $this->db->get('diziler');
        return $query->row();
    }

    public function anasayfa_dizi($id){
        $this->db->where('diziler.id', $id);
        $query = $this->db->get('diziler');
        return $query->row();
    }

    public function dizi_sayaci($id){
        $diziler = $this->anasayfa_model->anasayfa_dizi($id);

        if (get_cookie('dizi_goruntulenme_' . $id) != 1) {
            set_cookie('dizi_goruntulenme_' . $id, '1');
            $data = array(
                'dizi_goruntulenme' => $diziler->dizi_goruntulenme + 1
            );

            $this->db->where('id', $id);
            $this->db->update('diziler', $data);
        }

    }

    public function dizi_sayisi(){
        $this->db->select('diziler.*');
        $this->db->where('diziler.dizi_durum', 1);
        $this->db->order_by('diziler.id', 'DESC');
        $query = $this->db->get('diziler');
        return $query->num_rows();
    }

    public function sayfalama_dizileri($per_page, $offset){
        $this->db->join('kategoriler', 'diziler.kategori_id = kategoriler.id');
        $this->db->select('diziler.*, kategoriler.kategori_adi as kategori_adi, kategoriler.kategori_url, uyeler.ad_soyad as uye_ad_soyad');
        $this->db->join('uyeler', 'diziler.yazar_id = uyeler.id');
        $this->db->where('diziler.dizi_durum', 1);
        $this->db->order_by('diziler.id', 'DESC');
        $this->db->limit($per_page, $offset);
        $query = $this->db->get('diziler');
        return $query->result();
    }

    public function insert($data){

        $insert = $this->db->insert("diziler", $data);
        return $insert;

    }

    public function dizi_yorumlari($id){
        $this->db->join('diziler', 'yorumlar.dizi_id = diziler.id');
        $this->db->where('diziler.id', $id);
        $this->db->where('yorumlar.sezon_id', 0);
        $this->db->where('yorumlar.bolum_id', 0);
        $this->db->where('yorumlar.yorum_durum', 1);
        $this->db->select('yorumlar.*');
        $this->db->order_by('yorumlar.id', 'DESC');
        $query = $this->db->get('yorumlar');
        return $query->result();
    }

    public function bolum_yorumlari($id, $sezon_id, $bolum_id){
        $this->db->join('diziler', 'yorumlar.dizi_id = diziler.id');
        $this->db->join('dizi_sezon', 'yorumlar.sezon_id = dizi_sezon.sezon_id');
        $this->db->join('dizi_bolum', 'yorumlar.bolum_id = dizi_bolum.bolum_id');
        $this->db->where('diziler.id', $id);
        $this->db->where('dizi_sezon.sezon_id', $sezon_id);
        $this->db->where('dizi_bolum.bolum_id', $bolum_id);
        $this->db->where('yorumlar.yorum_durum', 1);
        $this->db->select('yorumlar.*');
        $this->db->order_by('yorumlar.id', 'DESC');
        $query = $this->db->get('yorumlar');
        return $query->result();
    }

    public function etikete_ait_dizi_sayisi($etiket_url){
        $this->db->join('uyeler', 'diziler.yazar_id = uyeler.id');
        $this->db->join('etiketler', 'diziler.id = etiketler.dizi_id');
        $this->db->join('kategoriler', 'diziler.kategori_id = kategoriler.id');
        $this->db->select('diziler.* , kategoriler.kategori_adi as kategori_adi, kategoriler.kategori_url, etiketler.id as etiket_id,uyeler.ad_soyad as uye_ad_soyad');
        $this->db->where('diziler.dizi_durum', 1);
        $this->db->where('etiketler.etiket_url', $etiket_url);
        $query = $this->db->get('diziler');
        return $query->num_rows();
    }

    public function etikete_ait_diziler_sayfalama($etiket_url, $per_page, $offset){
        $this->db->join('uyeler', 'diziler.yazar_id = uyeler.id');
        $this->db->join('etiketler', 'diziler.id = etiketler.dizi_id');
        $this->db->join('kategoriler', 'diziler.kategori_id = kategoriler.id');
        $this->db->select('diziler.* , kategoriler.kategori_adi as kategori_adi, kategoriler.kategori_url, etiketler.id as etiket_id,uyeler.ad_soyad as uye_ad_soyad');
        $this->db->where('diziler.dizi_durum', 1);
        $this->db->where('etiketler.etiket_url', $etiket_url);
        $this->db->order_by('diziler.id', 'DESC');
        $this->db->limit($per_page, $offset);
        $query = $this->db->get('diziler');
        return $query->result();
    }

    public function sayfalama_kategorileri($kategori_id, $per_page, $offset){
        $this->db->join('uyeler', 'diziler.yazar_id = uyeler.id');
        $this->db->join('kategoriler', 'diziler.kategori_id = kategoriler.id');
        $this->db->select('diziler.*, kategoriler.kategori_adi as kategori_adi, kategoriler.kategori_url, uyeler.ad_soyad as uye_ad_soyad');
        $this->db->where('diziler.dizi_durum', 1);
        $this->db->where('kategori_id', $kategori_id);
        $this->db->order_by('diziler.id', 'DESC');
        $this->db->limit($per_page, $offset);
        $query = $this->db->get('diziler');
        return $query->result();
    }
    public function kategori_dizi_sayisi($kategori_id){
        $this->db->join('uyeler', 'diziler.yazar_id = uyeler.id');
        $this->db->join('kategoriler', 'diziler.kategori_id = kategoriler.id');
        $this->db->select('diziler.* , kategoriler.kategori_adi as kategori_adi, kategoriler.kategori_url, uyeler.ad_soyad as uye_ad_soyad');
        $this->db->where('diziler.dizi_durum', 1);
        $this->db->where('diziler.kategori_id', $kategori_id);
        $query = $this->db->get('diziler');
        return $query->num_rows();
    }

    public function menu_sayfalar(){
        $result = $this->db->get("sayfalar")->result();
        return $result;
    }

    public function enckizlenenler(){
        $this->db->join('kategoriler', 'diziler.kategori_id = kategoriler.id');
        $this->db->select('diziler.*, kategoriler.kategori_adi as kategori_adi, kategoriler.kategori_url,');
        $this->db->where('diziler.dizi_durum', 1);
        $this->db->order_by('diziler.dizi_goruntulenme', 'DESC');
        $this->db->limit($this->ayarlar->enckizlenen_dizi_sayisi);
        $query = $this->db->get('diziler');
        return $query->result();
    }

    public function sayfa($sayfa_url)
    {
        $this->db->where('sayfa_url', $sayfa_url);
        $query = $this->db->get('sayfalar');
        return $query->row();
    }

    public function sayfalama_aramalari($q, $per_page, $offset){
        $this->db->join('uyeler', 'diziler.yazar_id = uyeler.id');
        $this->db->join('kategoriler', 'diziler.kategori_id = kategoriler.id');
        $this->db->select('diziler.*, kategoriler.kategori_adi as kategori_adi, kategoriler.kategori_url, uyeler.ad_soyad as uye_ad_soyad');
        $this->db->where('diziler.dizi_durum', 1);
        $this->db->like('diziler.dizi_baslik', $q);
        $this->db->or_like('diziler.tmdb_id', $q);
        $this->db->or_like('diziler.dizi_icerik', $q);
        $this->db->order_by('diziler.id', 'DESC');
        $this->db->limit($per_page, $offset);
        $query = $this->db->get('diziler');
        return $query->result();
    }
    public function arama_dizi_sayisi($q){
        $this->db->join('uyeler', 'diziler.yazar_id = uyeler.id');
        $this->db->join('kategoriler', 'diziler.kategori_id = kategoriler.id');
        $this->db->select('diziler.*, kategoriler.kategori_adi as kategori_adi, kategoriler.kategori_url, uyeler.ad_soyad as uye_ad_soyad');
        $this->db->where('diziler.dizi_durum', 1);
        $this->db->like('diziler.dizi_baslik', $q);
        $this->db->or_like('diziler.dizi_icerik', $q);
        $this->db->order_by('diziler.id', 'DESC');
        $query = $this->db->get('diziler');
        return $query->num_rows();
    }

    public function sayfalama_encokizlenen_dizileri($per_page, $offset){
        $this->db->join('kategoriler', 'diziler.kategori_id = kategoriler.id');
        $this->db->select('diziler.*, kategoriler.kategori_adi as kategori_adi, kategoriler.kategori_url, uyeler.ad_soyad as uye_ad_soyad');
        $this->db->join('uyeler', 'diziler.yazar_id = uyeler.id');
        $this->db->where('diziler.dizi_durum', 1);
        $this->db->order_by('diziler.dizi_goruntulenme', 'DESC');
        $this->db->limit($per_page, $offset);
        $query = $this->db->get('diziler');
        return $query->result();
    }

    public function sayfalama_begenilen_dizileri($per_page, $offset){
        $this->db->join('kategoriler', 'diziler.kategori_id = kategoriler.id');
        $this->db->select('diziler.*, kategoriler.kategori_adi as kategori_adi, kategoriler.kategori_url, uyeler.ad_soyad as uye_ad_soyad');
        $this->db->join('uyeler', 'diziler.yazar_id = uyeler.id');
        $this->db->join('begeniler', 'diziler.id = begeniler.begeni_dizi_id');
        $this->db->where('diziler.dizi_durum', 1);
        $this->db->group_by('begeniler.begeni_dizi_id');
        $this->db->order_by('count(begeniler.begeni_dizi_id)', 'DESC');
        $this->db->limit($per_page, $offset);
        $query = $this->db->get('diziler');
        return $query->result();
    }

    public function begenileri($id){
        $this->db->join('diziler', 'begeniler.begeni_dizi_id = diziler.id');
        $this->db->where('diziler.id', $id);
        $this->db->select('begeniler.*');
        $query = $this->db->get('begeniler');
        return $query->num_rows();
    }

    public function begeni_varmi($begeni_dizi_id="", $ip_adresi=""){
        $this->db->select('begeniler.*');
        $this->db->where('begeniler.begeni_dizi_id', $begeni_dizi_id);
        $this->db->where('begeniler.ip_adresi', $ip_adresi);
        $query = $this->db->get('begeniler');
        return $query->result();
    }


}