<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Reklamlar extends CI_Controller {

public function __construct(){
     parent::__construct();

    $user = $this->session->userdata("user");
    if(!$user){
    redirect(base_url("admin"));
    }


 }

public function index(){

    $list = $this->reklamlar_model->get_all();
    $viewData["list"] = $list;
    $data = array(
    'list' => $list,
    'title' => "Reklamlar | Admin Paneli",
    );
    $this->load->view("admin/reklamlar",  $data);

}

public function update_form($reklam_tipi){

    $where = array(
        "reklam_tipi" => $reklam_tipi
    );

    $reklamlar = $this->reklamlar_model->get($where);


    $data = array(
    'reklamlar' => $reklamlar,
    'title' => "Reklam Düzenle | Admin Paneli"
    );

    $data['reklamlar'] = $this->reklamlar_model->get($where);
    if (is_null($data['reklamlar']->reklam_durum) || ($reklam_tipi == '')) {
        redirect(base_url("admin/reklamlar"));
    }

    $this->load->view("admin/reklam_duzenle", $data);
}

public function update($reklam_tipi){

    $data = array(
            "reklam_tipi"   => $reklam_tipi,
            "reklam_kodu"   => $this->input->post("reklam_kodu"),
            "reklam_durum"   => $this->input->post("reklam_durum"),
            "updatedAt"     => $this->input->post("updatedAt")
    );

    $where = array(
        "reklam_tipi" => $reklam_tipi,
    );

    $update = $this->reklamlar_model->update($where, $data);

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
    redirect(base_url("admin/reklamlar"));
}

}