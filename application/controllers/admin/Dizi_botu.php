<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Dizi_botu extends Genel_MY_Controller {

public function __construct(){
     parent::__construct();

    $user = $this->session->userdata("user");

    if(!$user){
        redirect(base_url("admin"));
    }
}

public function index(){

    $list = $this->diziler_model->get_all();

    $viewData["list"] = $list;

    $data = array(
    'list' => $list,
    'title' => "Dizi Botu | Admin Paneli",
    );
    $this->load->view("admin/dizi_botu", $data);
}

public function getir()
{

    if (isset($_POST["getir"])) {

        $ayarlar =$this->ayarlar_model->ayarlari_getir();

        $curl = curl_init();
        $dizi_id = $this->input->post("tmdb");
        $curl_url = "http://api.themoviedb.org/3/tv/$dizi_id?api_key=$ayarlar->site_tmdb_api&language=tr-TR";

        curl_setopt_array($curl, array(
            CURLOPT_URL => $curl_url,
            CURLOPT_RETURNTRANSFER => true,
            CURLOPT_ENCODING => "",
            CURLOPT_MAXREDIRS => 10,
            CURLOPT_TIMEOUT => 30,
            CURLOPT_HTTP_VERSION => CURL_HTTP_VERSION_1_1,
            CURLOPT_CUSTOMREQUEST => "GET",
            //CURLOPT_POSTFIELDS => "{}",
            //CURLOPT_CAINFO => dirname(__FILE__).'/cacert.pem'
        ));

        $response = curl_exec($curl);
        $err = curl_error($curl);

        curl_close($curl);

        if ($err) {
            echo "cURL Error #:" . $err;
        } else {
            $data = json_decode($response, true);
        }
       $dizi_turleri = array($data["genres"]);
        foreach ($dizi_turleri as $d) {
            if (is_array($d)) {
                foreach ($d as $dizi_turu) {
                    $dizi_turu["name"] . " ";
                }

            } else {
                print_r("dizi hatası");
            }
        }

        $list = $this->diziler_model->kategoriler_v2();
        $viewData["list"] = $list;
        $data = array(
            'title' => "TMDb Dizi Botu ile Dizi Ekle | Admin Paneli",
            'list' => $list,
            'tmdb_id' => $data["id"],
            'dizi_baslik' => $data["original_name"],
            'dizi_tur' => $dizi_turu["name"],
            'dizi_aciklama' => $data["overview"],
            'dizi_poster' => $data["poster_path"],
            'dizi_tarih' => $data["first_air_date"],
            'dizi_sure' => $data["episode_run_time"][0],
            'dizi_tmdb_puan' => $data["vote_average"]
        );

        $this->load->view("admin/dizi_botu_ekle", $data);
    } else {
        echo "Hata!";
    }
}



    public function insert(){

        if(isset($_POST["ekle"])) {

            function poster_indir($link,$name=null){
            $link_info = pathinfo($link);
            $uzanti = strtolower($link_info['extension']); 
            $file = ($name) ? $name.'.'.$uzanti : $link_info['basename'];
            $yol = "uploads/".$file;
            
            $curl = curl_init($link);
            $fopen = fopen($yol,'w');
            
            curl_setopt($curl, CURLOPT_HEADER,0);
            curl_setopt($curl, CURLOPT_RETURNTRANSFER,1);
            curl_setopt($curl, CURLOPT_HTTP_VERSION,CURL_HTTP_VERSION_1_0);
            curl_setopt($curl, CURLOPT_FILE, $fopen);
            
            curl_exec($curl);
            curl_close($curl);
            fclose($fopen);
            }

            $tmdb_id = $this->input->post("tmdb");
            $dizi_baslik = $this->input->post("baslik");
            $kategori_id = $this->input->post("kategori");
            $yazar_id = $this->input->post("yazar");
            $dizi_icerik = $this->input->post("icerik");
            $dizi_yil = $this->input->post("yil");
            $dizi_dk = $this->input->post("dk");
            $dizi_tmdb = $this->input->post("tmdb_puan");
            $dizi_poster = $this->input->post("poster");
            if ($this->input->post("url") == '') {
                $dizi_url = str_slug($this->input->post("baslik"));
            } else {
                $dizi_url = $this->input->post("url");
            }
            $dizi_durum = $this->input->post("durum");
            $createdAt = date("Y-m-d H:i:s");

            $poster_adi = $dizi_url."-".rand(1,999999);
            poster_indir($dizi_poster,$poster_adi);


            if ($dizi_baslik && $kategori_id && $yazar_id && $dizi_icerik) {

                    $data = array(
                        "tmdb_id" => $tmdb_id,
                        "dizi_baslik" => $dizi_baslik,
                        "kategori_id" => $kategori_id,
                        "yazar_id" => $yazar_id,
                        "dizi_icerik" => $dizi_icerik,
                        "dizi_resim" => $poster_adi.".jpg",
                        "dizi_url" => $dizi_url,
                        "dizi_yil" => $dizi_yil,
                        "dizi_dk" => $dizi_dk,
                        "dizi_tmdb" => $dizi_tmdb,
                        "dizi_durum" => $dizi_durum,
                        "createdAt" => $createdAt
                    );

                    $insert = $this->diziler_model->insert($data);

                    if ($insert) {
                        $alert = array(
                            "title" => "İşlem Başarılıdır",
                            "text" => "Ekleme işlemi başarılıdır...",
                            "type" => "success"
                        );
                        $last_id = $this->db->insert_id();
                        $this->etiketler_model->dizi_etiket_ekle($last_id);
                    } else {
                        $alert = array(
                            "title" => "İşlem Başarısızdır!!",
                            "text" => "Ekleme işlemi başarısızdır...",
                            "type" => "error"
                        );
                    }



            } else {

                $alert = array(
                    "title" => "İşlem Başarısızdır!!",
                    "text" => "Lütfen boş alan bırakmayınız...",
                    "type" => "error"
                );
            }
        }


        $this->session->set_flashdata("alert", $alert);
        redirect(base_url("admin/diziler"));


    }


}
