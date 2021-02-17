<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Yorumlar extends CI_Controller {

    public function __construct(){
         parent::__construct();
        
         
        $user = $this->session->userdata("user");
        if(!$user){
        redirect(base_url("admin"));
        }    
     }
    
	public function index(){

        $list = $this->yorumlar_model->get_all();
        
        $viewData["list"] = $list;

        $data = array(
        'list' => $list,
        'title' => "Yorumlar | Admin Paneli",
        );
        $this->load->view("admin/yorumlar",  $data);
	}    
    
    public function update_form($id){
        
        $where = array(
            "id" => $id
        );

        $yorumlar = $this->yorumlar_model->get($where);
        $data = array(
        'yorumlar' => $yorumlar,
        'title' => "Yorum Düzenle | Admin Paneli"
        );

        $data['yorum'] = $this->yorumlar_model->get($where);
        if (is_null($data['yorum']->yorum_durum) || ($id == '')) {
            redirect(base_url("admin/yorumlar"));
        }


        $this->load->view("admin/yorum_duzenle", $data);
    }
    
    public function update($id){
        
        $data = array(
            "yorum_ad_soyad"   => $this->input->post("yorum_ad_soyad"),
            "yorum_email"   => $this->input->post("yorum_email"),
            "yorum_icerik"   => $this->input->post("yorum_icerik"),
            "yorum_durum"   => $this->input->post("yorum_durum"),
            "updatedAt" => date("Y-m-d H:i:s")
            );
        $where = array(
            "id" => $id,
        );
        
        $update = $this->yorumlar_model->update($where, $data);
        
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
        redirect(base_url("admin/yorumlar"));
    }
    
    public function delete($id){
        
        $where = array(
            "id" => $id
        );
        
        $delete = $this->yorumlar_model->delete($where);
        
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
        redirect(base_url("admin/yorumlar"));
    }

}