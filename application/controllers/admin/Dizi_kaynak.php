<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Dizi_kaynak extends CI_Controller {

public function __construct(){
     parent::__construct();

    $user = $this->session->userdata("user");

    if(!$user){
        redirect(base_url("admin"));
    }
}

public function index(){

    $list = $this->dizi_kaynak_model->get_all();
    $viewData["list"] = $list;

    $data = array(
    'list' => $list,
    'title' => "Dizi Kaynakları | Admin Paneli"
    );
    $this->load->view("admin/dizi_kaynak", $data);
}

public function update_form($kaynak_id){
    $where = array(
        "kaynak_id" => $kaynak_id
    );

    $dizi_kaynaklar = $this->dizi_kaynak_model->get($where);
    $diziler = $this->dizi_kaynak_model->diziler();
    $sezonlar = $this->sezonlar_model->get_all(array("dizi_id" => $dizi_kaynaklar->dizi_id));

    $data = array(
    'dizi_kaynaklar' => $dizi_kaynaklar,
    'diziler' => $diziler,
    'sezonlar' => $sezonlar,
    'title' => "Dizi Kaynağı Düzenle | Admin Paneli"
    );
    $data['dizi_kaynak'] = $this->dizi_kaynak_model->get($where);
    if (is_null($data['dizi_kaynak']->kaynak_durum) || ($kaynak_id == '')) {
        redirect(base_url("admin/diziler"));
    }

    $this->load->view("admin/dizi_kaynak_duzenle", $data);
}

public function update($kaynak_id){

        $data = array(
            "dizi_id" => $this->input->post("dizi"),
            "sezon_id" => $this->input->post("sezon"),
            "bolum_id" => $this->input->post("bolum"),
            "kaynak_adi" => $this->input->post("baslik"),
            "kaynak_icerik" => $this->input->post("icerik"),
            "kaynak_durum" => $this->input->post("durum"),
            "updatedAt" => date("Y-m-d H:i:s")
        );

    $where = array(
        "kaynak_id" => $kaynak_id,
    );

    $update = $this->dizi_kaynak_model->update($where, $data);

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
    redirect(base_url("admin/dizi-kaynak"));
}

public function insert_form(){

    $diziler = $this->dizi_kaynak_model->diziler();
    $viewData["list"] = $diziler;
    $data = array(
        'diziler' => $diziler,
        'title' => "Dizi Kaynağı Ekle | Admin Paneli"
    );

    $this->load->view("admin/dizi_kaynak_ekle", $data);
}

public function insert(){

        $kaynak_adi = $this->input->post("baslik");
        $dizi_id = $this->input->post("dizi");
        $sezon_id = $this->input->post("sezon");
        $bolum_id = $this->input->post("bolum");
        $kaynak_icerik = $this->input->post("icerik");
        $kaynak_durum  = $this->input->post("durum");
        $createdAt   = date("Y-m-d H:i:s");

        if($kaynak_adi && $dizi_id && $kaynak_icerik){

            $data = array(
                    "kaynak_adi"   => $kaynak_adi,
                    "dizi_id"   => $dizi_id,
                    "sezon_id"   => $sezon_id,
                    "bolum_id"   => $bolum_id,
                    "kaynak_icerik"      => $kaynak_icerik,
                    "kaynak_durum"   => $kaynak_durum,
                    "createdAt"     => $createdAt
                );

                $insert = $this->dizi_kaynak_model->insert($data);

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
        redirect(base_url("admin/dizi-kaynak"));


    }

public function delete($kaynak_id){

    $where = array(
        "kaynak_id" => $kaynak_id
    );

    $delete = $this->dizi_kaynak_model->delete($where);

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
    redirect(base_url("admin/dizi-kaynak"));
}


public function diziSec(){
    if(!empty($_POST['diziID'])){
        $query = $this->db->query("select * from dizi_sezon where dizi_id=".$_POST['diziID']."")->result();
        if($query){
            echo '<option value="">Sezon Seçiniz...</option>';
            foreach($query as $row){
                echo '<option value="'.$row->sezon_id.'">'.$row->sezon_baslik.'</option>';
            }
        }
    }

    if(!empty($_POST['sezonID'])){
        $query = $this->db->query("select * from dizi_bolum where sezon_id=".$_POST['sezonID']."")->result();
        if($query){
            echo '<option value="">Bölüm Seçiniz...</option>';
            foreach($query as $row){
                echo '<option value="'.$row->bolum_id.'">'.$row->bolum_adi.'</option>';
            }
        }
    }
}

}