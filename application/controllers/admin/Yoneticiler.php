<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Yoneticiler extends CI_Controller {

    public function __construct(){
         parent::__construct();
         
        $user = $this->session->userdata("user");
        if(!$user){
        redirect(base_url("admin"));
        }
        
      
     }
    
	public function index(){

        $list = $this->yoneticiler_model->get_all();
        $viewData["list"] = $list;
        $data = array(
        'list' => $list,
        'title' => "Yöneticiler | Admin Paneli",
        );
        $this->load->view("admin/yoneticiler",  $data);
        
	} 
    
    public function insert_form(){

        $data = array(
        'title' => "Yönetici Ekle | Admin Paneli",
        );
        $this->load->view("admin/yonetici_ekle", $data);
    }
    public function insert(){        
        $ad_soyad = $this->input->post("ad_soyad");
        $email = $this->input->post("email");
        $telefon    = $this->input->post("telefon");
        $cinsiyet = $this->input->post("cinsiyet");
        $isActive = $this->input->post("isActive");
        $user_role = $this->input->post("user_role");
        $sifre = md5($this->input->post("sifre"));
        $ekleyen_id = $this->input->post("ekleyen_id");
        $createdAt   = date("Y-m-d H:i:s");
        
        if($ad_soyad && $email && $sifre && $cinsiyet && $isActive && $user_role && $ekleyen_id){
            
            $data = array(
                "ad_soyad"   => $ad_soyad,
                "email"   => $email,
                "telefon"   => $telefon,
                "cinsiyet"   => $cinsiyet,
                "isActive"   => $isActive,
                "user_role"   => $user_role,
                "sifre"   => $sifre,
                "ekleyen_id"      => $ekleyen_id,
                "createdAt"     => $createdAt
            );
            $insert = $this->yoneticiler_model->insert($data);
                        
            if($insert){
            $alert = array(
                "title" => "İşlem Başarılıdır",
                "text" => "Ekleme işlemi başarılıdır...",
                "type" => "success"
            );
            }
            else{
            $alert = array(
                "title" => "İşlem Başarısızdır!!",
                "text" => "Ekleme işlemi başarısızdır...",
                "type" => "error"
            );
            } 
        }else{
            
            $alert = array(
                "title" => "İşlem Başarısızdır!!",
                "text" => "Lütfen boş alan bırakmayınız...",
                "type" => "error"
            );
        }
        
        
        $this->session->set_flashdata("alert", $alert);
        redirect(base_url("admin/yoneticiler"));
        

    }
    
    public function update_form($id){
        
        $where = array(
            "id" => $id
        );
        
        $yoneticiler = $this->yoneticiler_model->get($where);


        $data = array(
        'yoneticiler' => $yoneticiler,
        'title' => "Yönetici Düzenle | Admin Paneli"
        );

        $data['yonetici'] = $this->yoneticiler_model->get($where);
        if (is_null($data['yonetici']->isActive) || ($id == '')) {
            redirect(base_url("admin/yoneticiler"));
        }

        $this->load->view("admin/yonetici_duzenle", $data);
    }
    
    public function update($id){



        $sifre = $this->input->post("sifre");
        
        if($sifre){
            
        $data = array(
                "ad_soyad"   => $this->input->post("ad_soyad"),
                "email"   => $this->input->post("email"),
                "telefon"   => $this->input->post("telefon"),
                "cinsiyet"   => $this->input->post("cinsiyet"),
                "isActive"   => $this->input->post("isActive"),
                "user_role"   => $this->input->post("user_role"),
                "sifre"   => md5($this->input->post("sifre")),
                "ekleyen_id"      => $this->input->post("ekleyen_id"),
                "updatedAt"     => $this->input->post("updatedAt")
        );
            
        } else {
            
        $data = array(
                "ad_soyad"   => $this->input->post("ad_soyad"),
                "email"   => $this->input->post("email"),
                "telefon"   => $this->input->post("telefon"),
                "cinsiyet"   => $this->input->post("cinsiyet"),
                "isActive"   => $this->input->post("isActive"),
                "user_role"   => $this->input->post("user_role"),
                "ekleyen_id"      => $this->input->post("ekleyen_id"),
                "updatedAt"     => $this->input->post("updatedAt")
        );
        }
        $where = array(
            "id" => $id,
        );
        
        $update = $this->yoneticiler_model->update($where, $data);
        
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
        redirect(base_url("admin/yoneticiler"));
    }
    
    public function delete($id){
        
        $where = array(
            "id" => $id
        );
        
        $delete = $this->yoneticiler_model->delete($where);
        
        if($delete){
            
            $alert = array(
                "title" => "İşlem Başarılıdır!!",
                "text" => "Silme işlemi başarılıdır...",
                "type" => "success"
            );
        }else {
            
            $alert = array(
                "title" => "İşlem Başarısızdır!!",
                "text" => "Silme işlemi başarısızdır...",
                "type" => "error"
            );
        }
        
        $this->session->set_flashdata("alert", $alert);
        redirect(base_url("admin/yoneticiler"));
    }
    

}