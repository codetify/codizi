<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Diziler extends CI_Controller {

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
    'title' => "Diziler | Admin Paneli",
    );
    $this->load->view("admin/diziler", $data);
}

public function update_form($id){
    $etikets = "";
    $count = 0;
    $etikets_array = $this->etiketler_model->dizi_etiketleri($id);
    foreach ($etikets_array as $item) {
        if ($count > 0) {
            $etikets .= ",";
        }
        $etikets .= $item->etiket;
        $count++;
    }

    $where = array(
        "id" => $id
    );

    $list = $this->diziler_model->kategoriler_v2();
    $viewData["list"] = $list;
    $diziler = $this->diziler_model->get($where);


    $data = array(
    'diziler' => $diziler,
    'list' => $list,
    'etikets' => $etikets,
    'title' => "Dizi Düzenle | Admin Paneli"
    );
    $data['dizi_icerik'] = $this->diziler_model->get($where);
    if (is_null($data['dizi_icerik']->dizi_durum) || ($id == '')) {
        redirect(base_url("admin/diziler"));
    }

    $this->load->view("admin/dizi_duzenle", $data);
}

public function update($id){

    $img = $_FILES["resim"]["name"];

    if($img){

        $config["upload_path"]   = "uploads/";
        $config["allowed_types"] = "gif|jpg|png";

        $this->load->library("upload", $config);

        $upload = $this->upload->do_upload("resim");

        if($upload){

            if($this->input->post("url") == '') {
                $dizi_url2 = str_slug($this->input->post("baslik"));
            } else {
                $dizi_url2 = $this->input->post("url");
            }

            $data = array(
                "dizi_baslik" => $this->input->post("baslik"),
                "kategori_id" => $this->input->post("kategori"),
                "yazar_id" => $this->input->post("yazar"),
                "dizi_resim" => $this->upload->data("file_name"),
                "dizi_icerik" => $this->input->post("icerik"),
                "dizi_yil" => $this->input->post("yil"),
                "dizi_dk" => $this->input->post("dk"),
                "dizi_tmdb" => $this->input->post("tmdb"),
                "dizi_url" => $dizi_url2,
                "dizi_durum" => $this->input->post("durum"),
                "updatedAt" => date("Y-m-d H:i:s")
            );
        } else {

            $alert = array(
                "title" => "İşlem Başarısızdır!!",
                "text" => "Resim Upload işlemi sırasında bir hata oluştu...",
                "type" => "error"
            );
        }



    } else {
        if($this->input->post("url") == '') {
            $dizi_url2 = str_slug($this->input->post("baslik"));
        } else {
            $dizi_url2 = $this->input->post("url");
        }
        $data = array(
            "dizi_baslik" => $this->input->post("baslik"),
            "kategori_id" => $this->input->post("kategori"),
            "yazar_id" => $this->input->post("yazar"),
            "dizi_icerik" => $this->input->post("icerik"),
            "dizi_yil" => $this->input->post("yil"),
            "dizi_dk" => $this->input->post("dk"),
            "dizi_tmdb" => $this->input->post("tmdb"),
            "dizi_url" => $dizi_url2,
            "dizi_durum" => $this->input->post("durum"),
            "updatedAt" => date("Y-m-d H:i:s")
        );

    }
    $where = array(
        "id" => $id,
    );

    $this->etiketler_model->dizi_etiket_guncelle($id);
    $update = $this->diziler_model->update($where, $data);

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
    redirect(base_url("admin/diziler"));
}

public function insert_form(){

    $list = $this->diziler_model->kategoriler_v2();
    $viewData["list"] = $list;
    $data = array(
        'list' => $list,
        'title' => "Dizi Ekle | Admin Paneli"
    );

    $this->load->view("admin/dizi_ekle", $data);
}

public function insert(){

    if(isset($_POST["ekle"])) {

        $dizi_baslik = $this->input->post("baslik");
        $kategori_id = $this->input->post("kategori");
        $yazar_id = $this->input->post("yazar");
        $dizi_icerik = $this->input->post("icerik");
        $dizi_yil = $this->input->post("yil");
        $dizi_dk = $this->input->post("dk");
        $dizi_tmdb = $this->input->post("tmdb");
        if ($this->input->post("url") == '') {
            $dizi_url = str_slug($this->input->post("baslik"));
        } else {
            $dizi_url = $this->input->post("url");
        }
        $dizi_durum = $this->input->post("durum");
        $createdAt = date("Y-m-d H:i:s");
        $img = $_FILES["resim"]["name"];

        if ($dizi_baslik && $kategori_id && $yazar_id && $dizi_icerik) {

            if ($img) {

                $config["upload_path"] = "uploads/";
                $config["allowed_types"] = "gif|jpg|png";

                $this->load->library("upload", $config);

                if ($this->upload->do_upload("resim")) {

                    $dizi_resim = $this->upload->data("file_name");

                    $data = array(
                        "dizi_baslik" => $dizi_baslik,
                        "kategori_id" => $kategori_id,
                        "yazar_id" => $yazar_id,
                        "dizi_resim" => $dizi_resim,
                        "dizi_icerik" => $dizi_icerik,
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
                        "text" => "Resim yükleme işlemi başarısızdır...",
                        "type" => "error"
                    );
                }
            } else {

                $data = array(
                    "dizi_baslik" => $dizi_baslik,
                    "kategori_id" => $kategori_id,
                    "yazar_id" => $yazar_id,
                    "dizi_icerik" => $dizi_icerik,
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

    public function delete($id){

        $where = array(
            "id" => $id
        );

        $delete = $this->diziler_model->delete($where);

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
        redirect(base_url("admin/diziler"));
    }

    public function sezonlar($dizi_id){

        $list = $this->sezonlar_model->get_all(array("dizi_id" => $dizi_id), "rank ASC");
        $dizi = $this->diziler_model->get(array("id" => $dizi_id));
    
        $data = array(
            'list' => $list,
            'dizi' => $dizi,
            'title' => $dizi->dizi_baslik." sezonları | Admin Paneli",
        );
        $this->load->view("admin/sezonlar", $data);
    }

    public function sezon_ekle_form($dizi_id){

        $list = $this->diziler_model->get(array("id" => $dizi_id));
        $viewData["list"] = $list;
        $data = array(
            'list' => $list,
            'title' => "Sezon Ekle | Admin Paneli"
        );
    
        $this->load->view("admin/sezon_ekle", $data);
    }
    
    public function sezon_ekle($dizi_id){
    
        $baslik = $this->input->post("baslik");
        $skodu = $this->input->post("skodu");
        $tarih = $this->input->post("tarih");
        $durum = $this->input->post("durum");

        if ($baslik && $tarih && $durum) {

            $data = array(
                "sezon_baslik" => $baslik,
                "sezon_kod" => $skodu,
                "dizi_id" => $dizi_id,
                "sezon_tarih" => $tarih,
                "sezon_durum" => $durum
            );

            $insert = $this->sezonlar_model->insert($data);

            if ($insert) {
                $alert = array(
                    "title" => "İşlem Başarılıdır",
                    "text" => "Ekleme işlemi başarılıdır...",
                    "type" => "success"
                );
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

        $this->session->set_flashdata("alert", $alert);
        redirect(base_url("admin/diziler/sezonlar/$dizi_id"));
    }

    public function sezon_duzenle_form($sezon_id){
        $sezon = $this->sezonlar_model->get(array("sezon_id" => $sezon_id));
        $dizi = $this->diziler_model->get(array("id" => $sezon->dizi_id));
        $data = array(
        'sezon' => $sezon,
        'dizi' => $dizi,
        'title' => "Sezon Düzenle | Admin Paneli"
        );
    
        $this->load->view("admin/sezon_duzenle", $data);
    }
    
    public function sezon_duzenle($sezon_id){

        $sezon = $this->sezonlar_model->get(array("sezon_id" => $sezon_id));
        $dizi = $this->diziler_model->get(array("id" => $sezon->dizi_id));
    
        $data = array(
            "sezon_baslik" => $this->input->post("baslik"),
            "sezon_kod" =>  $this->input->post("skodu"),
            "sezon_tarih" => $this->input->post("tarih"),
            "sezon_durum" => $this->input->post("durum"),
            "updatedAt" => date("Y-m-d H:i:s")
        );

        $where = array(
            "sezon_id" => $sezon_id,
        );
    
        $update = $this->sezonlar_model->update($where, $data);
    
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
        redirect(base_url("admin/diziler/sezonlar/$dizi->id"));
    }
    
    public function sezondelete($id){

        $where = array(
            "sezon_id" => $id
        );
        $sezon = $this->sezonlar_model->get(array("sezon_id" => $id));

        $delete = $this->sezonlar_model->delete($where);

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
        redirect(base_url("admin/diziler/sezonlar/$sezon->dizi_id"));
    }

    public function bolumler($sezon_id){

        $list = $this->bolumler_model->get_all(array("sezon_id" => $sezon_id), "rank ASC");
    
        $data = array(
            'list' => $list,
            'sezon_id' => $sezon_id,
            'title' => "Bölümler | Admin Paneli",
        );

        $this->load->view("admin/bolumler", $data);
    }

    public function bolum_ekle_form($sezon_id){

        $list = $this->sezonlar_model->get(array("sezon_id" => $sezon_id));
        $dizi = $this->diziler_model->get(array("id" => $list->dizi_id));
        $data = array(
            'list' => $list,
            'dizi' => $dizi,
            'title' => "Bölüm Ekle | Admin Paneli"
        );
        $this->load->view("admin/bolum_ekle", $data);
    }
    
    public function bolum_ekle($sezon_id){
    
        $badi = $this->input->post("badi");
        $bkodu = $this->input->post("bkodu");
        $baslik = $this->input->post("baslik");
        $ozet = $this->input->post("ozet");
        $tarih = $this->input->post("tarih");
        $durum = $this->input->post("durum");
        $dizi_id = $this->input->post("d");

        if ($baslik && $ozet && $durum && $tarih) {

            $data = array(
                "dizi_id" => $dizi_id,
                "sezon_id" => $sezon_id,
                "bolum_baslik" => $baslik,
                "bolum_adi" => $badi,
                "bolum_kod" => $bkodu,
                "bolum_tarih" => $tarih,
                "bolum_ozet" => $ozet,
                "bolum_durum" => $durum
            );

            $insert = $this->bolumler_model->insert($data);

            if ($insert) {
                $alert = array(
                    "title" => "İşlem Başarılıdır",
                    "text" => "Ekleme işlemi başarılıdır...",
                    "type" => "success"
                );
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

        $this->session->set_flashdata("alert", $alert);
        redirect(base_url("admin/diziler/bolumler/$sezon_id"));
    }

    public function bolum_duzenle_form($bolum_id){
        $bolum = $this->bolumler_model->get(array("bolum_id" => $bolum_id));
        $sezon = $this->sezonlar_model->get(array("sezon_id" => $bolum->sezon_id));
        $dizi = $this->diziler_model->get(array("id" => $sezon->dizi_id));
        $data = array(
        'sezon' => $sezon,
        'dizi' => $dizi,
        'bolum' => $bolum,
        'title' => "Sezon Düzenle | Admin Paneli"
        );
    
        $this->load->view("admin/bolum_duzenle", $data);
    }
    
    public function bolum_duzenle($bolum_id){

        $bolum = $this->bolumler_model->get(array("bolum_id" => $bolum_id));
        $sezon = $this->sezonlar_model->get(array("sezon_id" => $bolum->sezon_id));
        $dizi = $this->diziler_model->get(array("id" => $sezon->dizi_id));

        $data = array(
            "bolum_baslik" => $this->input->post("baslik"),
            "bolum_adi" => $this->input->post("badi"),
            "bolum_kod" => $this->input->post("bkodu"),
            "bolum_tarih" => $this->input->post("tarih"),
            "bolum_ozet" => $this->input->post("ozet"),
            "bolum_durum" => $this->input->post("durum"),
            "updatedAt" => date("Y-m-d H:i:s")
        );

        $where = array(
            "bolum_id" => $bolum_id,
        );
    
        $update = $this->bolumler_model->update($where, $data);
    
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
        redirect(base_url("admin/diziler/bolumler/$sezon->sezon_id"));
    }
    
    public function bolumdelete($bolum_id){

        $where = array(
            "bolum_id" => $bolum_id
        );

        $bolum = $this->bolumler_model->get(array("bolum_id" => $bolum_id));

        $delete = $this->bolumler_model->delete($where);

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
        redirect(base_url("admin/diziler/bolumler/$bolum->sezon_id"));
    }

    //SEZON BOTU
    public function sezon_bot($dizi_id){

        $dizi = $this->diziler_model->get(array("id" => $dizi_id));

        $ayarlar = $this->ayarlar_model->ayarlari_getir();

        $curl = curl_init();
        $curl_url = "http://api.themoviedb.org/3/tv/$dizi->tmdb_id?api_key=$ayarlar->site_tmdb_api&language=tr-TR";

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
        $sezonlar = array($data["seasons"]);
        foreach($sezonlar as $sezon){
            if (is_array($sezon)) {
                foreach ($sezon as $sezon) {
                    if($sezon["air_date"] == NULL){
                        $sezon_tarih = date("Y-m-d");
                    } else {
                        $sezon_tarih = $sezon["air_date"];
                    }
                    $data = array(
                        'dizi_id' => $dizi_id,
                        'sezon_tarih' => $sezon_tarih,
                        'sezon_baslik' => $sezon["name"],
                        'sezon_kod' => $sezon["season_number"],
                        'sezon_durum' => 1
                    );
                    $insert = $this->sezonlar_model->insert($data);
                }
            }
        }

        if ($insert) {
            $alert = array(
                "title" => "İşlem Başarılıdır",
                "text" => "Sezonlar başarılı bir şekilde eklendi...",
                "type" => "success"
            );
        } else {
            $alert = array(
                "title" => "İşlem Başarısızdır!!",
                "text" => "Sezonları eklerken bir hata oluştu...",
                "type" => "error"
            );
        }
        $this->session->set_flashdata("alert", $alert);
        redirect(base_url("admin/diziler/sezonlar/$dizi_id"));
    }

    //BÖLÜM BOTU
    public function bolum_bot($sezon_id){

        $sezon = $this->sezonlar_model->get(array("sezon_id" => $sezon_id));
        $dizi = $this->diziler_model->get(array("id" => $sezon->dizi_id));

        $ayarlar = $this->ayarlar_model->ayarlari_getir();

        $curl = curl_init();
        $curl_url = "http://api.themoviedb.org/3/tv/$dizi->tmdb_id/season/$sezon->sezon_kod?api_key=$ayarlar->site_tmdb_api&language=tr-TR";

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
        $bolumler = array($data["episodes"]);
        foreach($bolumler as $bolum){
            if (is_array($bolum)) {
                foreach ($bolum as $bolum) {
                    $data = array(
                        'dizi_id' => $dizi->id,
                        'sezon_id' => $sezon_id,
                        'bolum_tarih' => $bolum["air_date"],
                        'bolum_kod' => $bolum["episode_number"],
                        'bolum_adi' => $bolum["episode_number"].".Bölüm",
                        'bolum_baslik' => $bolum["name"],
                        'bolum_ozet' => $bolum["overview"],
                        'bolum_durum' => 1
                    );
                    $insert = $this->bolumler_model->insert($data);
                }
            }
        }

        if ($insert) {
            $alert = array(
                "title" => "İşlem Başarılıdır",
                "text" => "Bölümler başarılı bir şekilde eklendi...",
                "type" => "success"
            );
        } else {
            $alert = array(
                "title" => "İşlem Başarısızdır!!",
                "text" => "Bölümleri eklerken bir hata oluştu...",
                "type" => "error"
            );
        }
        $this->session->set_flashdata("alert", $alert);
        redirect(base_url("admin/diziler/bolumler/$sezon_id"));
    }

    public function sezonRankSetter(){

        $data = $this->input->post("data");

        parse_str($data, $order);

        $items = $order["ord"];

        foreach ($items as $rank => $id){

            $this->sezonlar_model->update(
                array(
                    "sezon_id"        => $id,
                    "rank !="   => $rank
                ),
                array(
                    "rank"      => $rank
                )
            );

        }

    }

    public function bolumRankSetter(){

        $data = $this->input->post("data");

        parse_str($data, $order);

        $items = $order["ord"];

        foreach ($items as $rank => $id){

            $this->bolumler_model->update(
                array(
                    "bolum_id"        => $id,
                    "rank !="   => $rank
                ),
                array(
                    "rank"      => $rank
                )
            );

        }

    }

}