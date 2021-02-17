<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Sayfalar extends CI_Controller {

    public function __construct(){
         parent::__construct();
         
        $user = $this->session->userdata("user");
        if(!$user){
        redirect(base_url("admin"));
        }
        
      
     }
    
	public function index(){

        $list = $this->sayfalar_model->get_all();
        $viewData["list"] = $list;
        $data = array(
        'list' => $list,
        'title' => "Sayfalar | Admin Paneli",
        );
        $this->load->view("admin/sayfalar",  $data);
        
	} 
    
    public function insert_form(){

        $data = array(
        'title' => "Sayfa Ekle | Admin Paneli",
        );
        $this->load->view("admin/sayfa_ekle", $data);
    }
    public function insert(){        
        $sayfa_baslik = $this->input->post("sayfa_baslik");
        if($this->input->post("sayfa_url") == '') {
            $sayfa_url = str_slug($this->input->post("sayfa_baslik"));
        } else {
            $sayfa_url = $this->input->post("sayfa_url");
        }
        $sayfa_icerik    = $this->input->post("sayfa_icerik");
        $sayfa_durum = $this->input->post("sayfa_durum");
        $yazar_id = $this->input->post("yazar_id");
        $createdAt   = date("Y-m-d H:i:s");
        
        if($sayfa_baslik && $sayfa_icerik && $sayfa_durum && $yazar_id){
            
            $data = array(
                "sayfa_baslik"   => $sayfa_baslik,
                "sayfa_url"   => $sayfa_url,
                "sayfa_icerik"   => $sayfa_icerik,
                "sayfa_durum"   => $sayfa_durum,
                "yazar_id"   => $yazar_id,
                "createdAt"     => $createdAt
            );
            $insert = $this->sayfalar_model->insert($data);
                        
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
        redirect(base_url("admin/sayfalar"));
        

    }
    
    public function update_form($id){
        
        $where = array(
            "id" => $id
        );
        
        $sayfalar = $this->sayfalar_model->get($where);


        $data = array(
        'sayfalar' => $sayfalar,
        'title' => "Sayfa Düzenle | Admin Paneli"
        );

        $data['sayfalar'] = $this->sayfalar_model->get($where);
        if (is_null($data['sayfalar']->sayfa_durum) || ($id == '')) {
            redirect(base_url("admin/sayfalar"));
        }

        $this->load->view("admin/sayfa_duzenle", $data);
    }
    
    public function update($id){

        if($this->input->post("sayfa_url") == '') {
            $sayfa_url = str_slug($this->input->post("sayfa_baslik"));
        } else {
            $sayfa_url = $this->input->post("sayfa_url");
        }

        $data = array(
                "sayfa_baslik"   => $this->input->post("sayfa_baslik"),
                "sayfa_url"   => $sayfa_url,
                "sayfa_icerik"   => $this->input->post("sayfa_icerik"),
                "sayfa_durum"   => $this->input->post("sayfa_durum"),
                "yazar_id"      => $this->input->post("yazar_id"),
                "updatedAt"     => $this->input->post("updatedAt")
        );

        $where = array(
            "id" => $id,
        );
        
        $update = $this->sayfalar_model->update($where, $data);
        
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
        redirect(base_url("admin/sayfalar"));
    }
    
    public function delete($id){
        
        $where = array(
            "id" => $id
        );
        
        $delete = $this->sayfalar_model->delete($where);
        
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
        redirect(base_url("admin/sayfalar"));
    }
    

}