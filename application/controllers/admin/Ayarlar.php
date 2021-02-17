<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Ayarlar extends CI_Controller {

    public function __construct(){
         parent::__construct();

        $user = $this->session->userdata("user");

        if(!$user){
            redirect(base_url("admin"));
        }
    }
    
	public function index(){
        
        $genel_ayarlar = $this->ayarlar_model->get_all();
        
        $data = array(
        'genel_ayarlar' => $genel_ayarlar,
        'title' => "Genel Ayarlar | Admin Paneli",
        );
        $this->load->view("admin/ayarlar", $data);
	}

    
    public function update(){


        if ($this->input->post("title") && $this->input->post("baslik") && $this->input->post("description") && $this->input->post("keywords") && $this->input->post("anasayfa_dizi") && $this->input->post("anasayfa_kategori") && $this->input->post("anasayfa_etiket") && $this->input->post("arama_dizi") && $this->input->post("encokizlenen_dizi")) {
            
            $data = array(
                "site_title" => $this->input->post("title"),
                "site_baslik" => $this->input->post("baslik"),
                "site_description" => $this->input->post("description"),
                "site_keywords" => $this->input->post("keywords"),
                "site_og_twitter" => $this->input->post("site_og_twitter"),
                "anasayfa_dizi_sayisi" => $this->input->post("anasayfa_dizi"),
                "anasayfa_bolum_sayisi" => $this->input->post("anasayfa_bolum_sayisi"),
                "anasayfa_kategori_sayisi" => $this->input->post("anasayfa_kategori"),
                "anasayfa_etiket_sayisi" => $this->input->post("anasayfa_etiket"),
                "arama_dizi_sayisi" => $this->input->post("arama_dizi"),
                "enckizlenen_dizi_sayisi" => $this->input->post("encokizlenen_dizi"),
                "site_facebook" => $this->input->post("facebook"),
                "site_twitter" => $this->input->post("twitter"),
                "site_instagram" => $this->input->post("instagram"),
                "site_youtube" => $this->input->post("youtube"),
                "site_google_plus" => $this->input->post("google_plus"),
                "site_tmdb_api" => $this->input->post("tmdb"),
                "guncelleyen_id" => $this->input->post("yazar"),
                "updatedAt" => date("Y-m-d H:i:s")
            );

            //Seo image
            if ($_FILES["site_logo"]["name"] !== "") {
                
                $sifrele = uniqid();
                $site_logo = $sifrele.$this->input->post("baslik") . "." . pathinfo($_FILES["site_logo"]["name"], PATHINFO_EXTENSION);
                $config["allowed_types"] = "png|jpg|jpeg";
                $config["upload_path"]   = "uploads/";
                $config["file_name"] = $site_logo;
        
                $this->load->library("upload", $config);
        
                if ($this->upload->do_upload("site_logo")) {

                    $data["site_logo"] = $site_logo;

                } else {

                    $alert = array(
                        "title" => "İşlem Başarısız",
                        "text" => "Görsel yüklenirken bir problem oluştu",
                        "type" => "error"
                    );

                    $this->session->set_flashdata("alert", $alert);

                    redirect(base_url("admin/ayarlar"));

                    die();
                }

            }

            // Favicon için Upload Süreci...
            if ($_FILES["site_favicon"]["name"] !== "") {
                
                $sifrele = uniqid();
                $favicon = $sifrele.$this->input->post("baslik") . "." . pathinfo($_FILES["site_favicon"]["name"], PATHINFO_EXTENSION);
                $config["allowed_types"] = "png|jpg|jpeg";
                $config["upload_path"]   = "uploads/";
                $config["file_name"] = $favicon;
        
                $this->load->library("upload", $config);
        
                if ($this->upload->do_upload("site_favicon")) {

                    $data["site_favicon"] = $favicon;

                } else {

                    $alert = array(
                        "title" => "İşlem Başarısız",
                        "text" => "Görsel yüklenirken bir problem oluştu",
                        "type" => "error"
                    );

                    $this->session->set_flashdata("alert", $alert);

                    redirect(base_url("admin/ayarlar"));

                    die();
                }

            }
            
            $update = $this->ayarlar_model->update($data);
            
            if($update){
                
                $alert = array(
                    "title" => "İşlem Başarılıdır",
                    "text" => "Güncelleme işlemi başarılıdır...",
                    "type" => "success"
                );
            }
            else{
                $alert = array(
                    "title" => "İşlem Başarısızdır!!",
                    "text" => "Güncelleme işlemi başarısızdır...",
                    "type" => "error"
                );
            }
            
            $this->session->set_flashdata("alert", $alert);
            redirect(base_url("admin/ayarlar"));
        } else {

            $alert = array(
                "title" => "İşlem Başarısızdır!!",
                "text" => "Lütfen boş alan bırakmayınız...",
                "type" => "error"
            );
        
            $this->session->set_flashdata("alert", $alert);
            redirect(base_url("admin/ayarlar"));
        }
    }
        

}