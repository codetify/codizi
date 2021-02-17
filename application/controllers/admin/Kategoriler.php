<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Kategoriler extends CI_Controller {

    public function __construct(){
         parent::__construct();
         
        $user = $this->session->userdata("user");
        if(!$user){
        redirect(base_url("admin"));
        }
        
      
     }
    
	public function index(){

        $list = $this->kategoriler_model->get_all();
        $viewData["list"] = $list;
        $data = array(
        'list' => $list,
        'title' => "Kategoriler | Admin Paneli",
        );
        $this->load->view("admin/kategoriler",  $data);
        
	} 
    
    public function insert_form(){

        $data = array(
        'title' => "Kategori Ekle | Admin Paneli",
        );
        $this->load->view("admin/kategori_ekle", $data);
    }
    public function insert(){        
        $kategori_adi = $this->input->post("kategori_adi");
        if($this->input->post("kategori_url") == '') {
            $kategori_url = str_slug($this->input->post("kategori_adi"));
        } else {
            $kategori_url = $this->input->post("kategori_url");
        }
        $kategori_durum = $this->input->post("kategori_durum");
        $yazar_id = $this->input->post("yazar_id");
        $createdAt   = date("Y-m-d H:i:s");
        
        if($kategori_adi && $kategori_durum && $yazar_id){
            
            $data = array(
                "kategori_adi"   => $kategori_adi,
                "kategori_url"   => $kategori_url,
                "kategori_durum"   => $kategori_durum,
                "yazar_id"   => $yazar_id,
                "createdAt"     => $createdAt
            );
            $insert = $this->kategoriler_model->insert($data);
                        
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
        redirect(base_url("admin/kategoriler"));
        

    }
    
    public function update_form($id){
        
        $where = array(
            "id" => $id
        );
        
        $kategoriler = $this->kategoriler_model->get($where);


        $data = array(
        'kategoriler' => $kategoriler,
        'title' => "Kategori Düzenle | Admin Paneli"
        );

        $data['kategoriler'] = $this->kategoriler_model->get($where);
        if (is_null($data['kategoriler']->kategori_durum) || ($id == '')) {
            redirect(base_url("admin/kategoriler"));
        }

        $this->load->view("admin/kategori_duzenle", $data);
    }
    
    public function update($id){

        $kategori_adi = $this->input->post("kategori_adi");
        if($this->input->post("kategori_url") == '') {
            $kategori_url = str_slug($this->input->post("kategori_adi"));
        } else {
            $kategori_url = $this->input->post("kategori_url");
        }
        $kategori_durum = $this->input->post("kategori_durum");
        $yazar_id = $this->input->post("yazar_id");
        $createdAt   = date("Y-m-d H:i:s");

        $data = array(
            "kategori_adi"   => $kategori_adi,
            "kategori_url"   => $kategori_url,
            "kategori_durum"   => $kategori_durum,
            "yazar_id"   => $yazar_id,
            "createdAt"     => $createdAt
        );

        $where = array(
            "id" => $id,
        );
        
        $update = $this->kategoriler_model->update($where, $data);
        
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
        redirect(base_url("admin/kategoriler"));
    }
    
    public function delete($id){
        
        $where = array(
            "id" => $id
        );
        
        $delete = $this->kategoriler_model->delete($where);
        
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
        redirect(base_url("admin/kategoriler"));
    }
    

}