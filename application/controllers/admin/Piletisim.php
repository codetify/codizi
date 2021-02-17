<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Piletisim extends CI_Controller {

public function __construct(){
     parent::__construct();

    $user = $this->session->userdata("user");

    if(!$user){
        redirect(base_url("admin"));
    }
}

public function index(){

    $list = $this->adminpiletisim_model->get_all();

    $viewData["list"] = $list;

    $data = array(
    'list' => $list,
    'title' => "İletişim Mesajları | Admin Paneli",
    );
    $this->load->view("admin/iletisim", $data);
}


public function iletisim_icerik($id){


    $where = array(
        "id" => $id
    );

    $iletisim_mesajlari = $this->adminpiletisim_model->get($where);

    $data = array(
    'iletisim_mesajlari' => $iletisim_mesajlari,
    'title' => "Mesajı Görüntüle | Admin Paneli"
    );

    $data['iletisim'] = $this->adminpiletisim_model->get($where);
    if (is_null($data['iletisim']->iletisim_durum) || ($id == '')) {
        redirect(base_url("admin/iletisim"));
    }

    $this->load->view("admin/iletisim_goruntule", $data);
}

public function delete($id){

    $where = array(
        "id" => $id
    );

    $delete = $this->adminpiletisim_model->delete($where);

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
    redirect(base_url("admin/iletisim"));
}


}