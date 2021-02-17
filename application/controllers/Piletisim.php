<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Piletisim extends Genel_MY_Controller {

    public function __construct()
    {
        parent::__construct();
        $this->load->library('fonksiyonlar');

    }

	public function index()
	{
        $genel_ayarlar = $this->ayarlar_model->ayarlari_getir();

        $ktg_list = $this->diziler_model->kategoriler_v2();
        $viewData["list"] = $ktg_list;

        $syf_list = $this->sayfalar_model->get_aktif();
        $viewData["list"] = $syf_list;

        $data = array(
            'genel_ayarlar' => $genel_ayarlar,
            'sayfalar' => $syf_list,
            'kategoriler' => $ktg_list,
            'seo_title' => "İletişim | ".$genel_ayarlar->site_title,
            'seo_description' => $genel_ayarlar->site_description,
            'seo_keywords' => $genel_ayarlar->site_keywords,
            'seo_url' => base_url("iletisim"),
            'seo_image' => base_url("uploads/$genel_ayarlar->site_logo")
        );
        $this->load->view("iletisim", $data);
	}

    public function form_gonder(){
        $gonderen_ad_soyad = $this->input->post("adsoyad");
        $gonderen_email = $this->input->post("email");
        $konu    = $this->input->post("konu");
        $mesaj    = $this->input->post("mesaj");
        $iletisim_durum    = "1";
        $createdAt   = date("Y-m-d H:i:s");

        if($gonderen_ad_soyad && $gonderen_email && $konu && $mesaj){

            $data = array(
                "gonderen_ad_soyad"   => $gonderen_ad_soyad,
                "gonderen_email"   => $gonderen_email,
                "konu"      => $konu,
                "mesaj"    => $mesaj,
                "iletisim_durum"    => $iletisim_durum,
                "createdAt"     => $createdAt
            );
            $insert = $this->piletisim_model->insert($data);



            if($insert){
                $alert = array(
                    "title" => "",
                    "text" => "Mesajınız başarıyla gönderilmiştir, vermiş olduğunuz email adresi üzerinden iletişime geçilecektir...",
                    "type" => "success"
                );
            }
            else{
                $alert = array(
                    "title" => "",
                    "text" => "Mesajınız gönderilirken bir hata oluştu. Lütfen daha sonra tekrar deneyiniz...",
                    "type" => "error"
                );
            }

        }else{

            $alert = array(
                "title" => "",
                "text" => "Lütfen boş alan bırakmayınız.",
                "type" => "error"
            );
        }


        $this->session->set_flashdata("alert", $alert);
        redirect(base_url("iletisim"));
    }
}
