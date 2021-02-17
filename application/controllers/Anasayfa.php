<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Anasayfa extends Genel_MY_Controller {

    public function __construct()
    {
        parent::__construct();
        $this->load->library('fonksiyonlar');
    }

    public function index(){

        $sayfa = $this->security->xss_clean($this->input->get('sayfa'));
        if (empty($sayfa)) {
            $sayfa = 0;
        }

        if ($sayfa != 0) {
            $sayfa = $sayfa - 1;
        }
        $config['base_url'] = base_url();
        $config['total_rows'] = $this->anasayfa_model->dizi_sayisi();
        $config['per_page'] = $this->ayarlar->anasayfa_dizi_sayisi;
        $this->pagination->initialize($config);

        $genel_ayarlar = $this->ayarlar_model->ayarlari_getir();
        $dizi_listesi = $this->anasayfa_model->sayfalama_dizileri($config['per_page'], $sayfa * $config['per_page']);

        $ktg_list = $this->diziler_model->kategoriler_v2();
        $viewData["list"] = $ktg_list;

        $syf_list = $this->sayfalar_model->get_aktif();
        $viewData["list"] = $syf_list;
        
        $bolumler = $this->bolumler_model->get_all_limit_home(array("bolum_durum" => 1), "createdAt DESC", array("count" => $genel_ayarlar->anasayfa_bolum_sayisi, "start" => 0));
        $bolum_toplam = $this->bolumler_model->get_all_count(array("bolum_durum" => 1));

        $data = array(
            'kategoriler' => $ktg_list,
            'dizi_listesi' => $dizi_listesi,
            'genel_ayarlar' => $genel_ayarlar,
            'sayfalar' => $syf_list,
            'bolumler' => $bolumler,
            'bolum_toplam' => $bolum_toplam,
            'seo_title' => $genel_ayarlar->site_title,
            'seo_description' => $genel_ayarlar->site_description,
            'seo_keywords' => $genel_ayarlar->site_keywords,
            'seo_url' => base_url(),
            'seo_image' => base_url("uploads/$genel_ayarlar->site_logo")
        );
        $this->load->view("anasayfa", $data);

    }

    public function dizi_icerik($url){

        $data["kategoriler"] = $this->diziler_model->kategoriler_v2();

        $dizi_url_v2 = $this->security->xss_clean($url);
        $data['dizi_icerik'] = $this->anasayfa_model->anasayfa_dizi_icerik($dizi_url_v2);

        $id = $data['dizi_icerik']->id;
        $data['yorumlar'] = $this->anasayfa_model->dizi_yorumlari($id);

        $data['sayfalar'] = $this->sayfalar_model->get_aktif();

        $data['begeni_sayisi'] = $this->anasayfa_model->begenileri($id);

        $url = $data['dizi_icerik']->dizi_url;

        if (empty($data['dizi_icerik']->dizi_durum) || ($url == '')) {
            redirect(base_url());
        }

        $data['dizi_etiketler'] = $this->etiketler_model->dizi_etiketleri($id);

        $this->load->helper('cookie');

        $this->anasayfa_model->dizi_sayaci($id);

        $genel_ayarlar = $this->ayarlar_model->ayarlari_getir();
        $seo_image = $data["dizi_icerik"]->dizi_resim;

        $data['sezonlar'] = $this->sezonlar_model->get_all(array("dizi_id" => $id));

        $data['seo_title'] = $data['dizi_icerik']->dizi_baslik." | ".$genel_ayarlar->site_title;
        $data['seo_description'] = $data['dizi_icerik']->dizi_icerik;
        $data['seo_keywords'] = $genel_ayarlar->site_keywords;
        $data['seo_url'] = base_url();
        $data['seo_image'] = base_url("uploads/$seo_image");

        $this->load->view("icerik", $data);
    }

    public function dizi_izle($url, $sezon_kod, $bolum_kod){

        $data["kategoriler"] = $this->diziler_model->kategoriler_v2();

        $dizi_url_v2 = $this->security->xss_clean($url);
        $data['dizi_icerik'] = $this->anasayfa_model->anasayfa_dizi_icerik($dizi_url_v2);

        $id = $data['dizi_icerik']->id;

        $data['sayfalar'] = $this->sayfalar_model->get_aktif();

        $data['begeni_sayisi'] = $this->anasayfa_model->begenileri($id);

        $url = $data['dizi_icerik']->dizi_url;

        if (empty($data['dizi_icerik']->dizi_durum) || ($url == '')) {
            redirect(base_url());
        }

        $data['dizi_etiketler'] = $this->etiketler_model->dizi_etiketleri($id);


        $this->load->helper('cookie');

        $this->anasayfa_model->dizi_sayaci($id);

        $genel_ayarlar = $this->ayarlar_model->ayarlari_getir();
        $seo_image = $data["dizi_icerik"]->dizi_resim;

        $data['sezonlar'] = $this->sezonlar_model->get_all(array("dizi_id" => $id));

        $data['seo_title'] = $data['dizi_icerik']->dizi_baslik." | ".$genel_ayarlar->site_title;
        $data['seo_description'] = $data['dizi_icerik']->dizi_icerik;
        $data['seo_keywords'] = $genel_ayarlar->site_keywords;
        $data['seo_url'] = base_url();
        $data['seo_image'] = base_url("uploads/$seo_image");

        $sezon = $this->sezonlar_model->get(array("dizi_id" => $data['dizi_icerik']->id, "sezon_kod" => $sezon_kod));
        $bolum = $this->bolumler_model->get(array("sezon_id" => $sezon->sezon_id, "bolum_kod" => $bolum_kod));
        $dizi_kaynak = $this->dizi_kaynak_model->dizi_kynk_gtr($data['dizi_icerik']->id, $sezon->sezon_id, $bolum->bolum_id);
        $data['yorumlar'] = $this->anasayfa_model->bolum_yorumlari($id, $sezon->sezon_id, $bolum->bolum_id);

        $data['sezon_kod'] = $sezon_kod;
        $data['bolum_kod'] = $bolum_kod;

        $data['sezon'] = $sezon;
        $data['bolum'] = $bolum;
        $data['dizi_kaynak'] = $dizi_kaynak;

        $this->load->view("bolum_izle", $data);
    }

    public function yorum_ekle(){

        $dizi_id = $this->input->post("i");
        $sezon_id = $this->input->post("s");
        $bolum_id = $this->input->post("b");
        $dizi_url = $this->input->post("u");
        $yorum_ad_soyad = $this->input->post("ad_soyad");
        $yorum_email    = $this->input->post("email");
        $yorum_icerik = $this->input->post("icerik");
        $yorum_spoiler = $this->input->post("spoiler");
        $createdAt   = date("Y-m-d H:i:s");

        if($yorum_ad_soyad && $yorum_email && $yorum_icerik){

            $data = array(
                "dizi_id"   => $dizi_id,
                "sezon_id"   => $sezon_id,
                "bolum_id"   => $bolum_id,
                "yorum_ad_soyad"   => $yorum_ad_soyad,
                "yorum_email"   => $yorum_email,
                "yorum_icerik"   => $yorum_icerik,
                "yorum_spoiler"   => $yorum_spoiler,
                "createdAt"     => $createdAt
            );
            $insert = $this->yorumlar_model->yorum_ekle($data);

            if($insert){
                $alert = array(
                    "title" => "",
                    "text" => "Yorum ekleme işlemi başarılıdır, yorumunuzun görünmesi için yönetici onayı gereklidir.",
                    "type" => "success"
                );
            }
            else{
                $alert = array(
                    "title" => "",
                    "text" => "Yorum ekleme işlemi başarısızdır, lütfen tekrar deneyin.",
                    "type" => "error"
                );
            }
        } else{

            $alert = array(
                "title" => "",
                "text" => "Lütfen boş alan bırakmayınız...",
                "type" => "error"
            );
        }


        $this->session->set_flashdata("alert", $alert);
        redirect(base_url("dizi/".$dizi_url));

    }

    public function kategori($kategori_url){

        $kategori_url = $this->security->xss_clean($kategori_url);

        $data['kategori'] = $this->kategoriler_model->kategori_getir($kategori_url);

        if (empty($data['kategori'])) {
            redirect(base_url());
        }

        $kategori_id = $data['kategori']->id;

        $data["kategoriler"] = $this->diziler_model->kategoriler_v2();

        $data['kategori_title'] = html_escape('"'.$data['kategori']->kategori_adi).'"'.' kategorisine ait diziler';
        $data['kategori_url'] = $data['kategori']->kategori_url;
        $sayfa = $this->security->xss_clean($this->input->get('sayfa'));
        if (empty($sayfa)) {
            $sayfa = 0;
        }

        if ($sayfa != 0) {
            $sayfa = $sayfa - 1;
        }

        $config['base_url'] = base_url() . '/kategori/' . $kategori_url;
        $config['total_rows'] = $this->anasayfa_model->kategori_dizi_sayisi($kategori_id);
        $config['per_page'] = $this->ayarlar->anasayfa_kategori_sayisi;
        $this->pagination->initialize($config);

        $data['diziler'] = $this->anasayfa_model->sayfalama_kategorileri($kategori_id, $config['per_page'], $sayfa * $config['per_page']);

        $data['sayfalar'] = $this->sayfalar_model->get_aktif();

        $genel_ayarlar = $this->ayarlar_model->ayarlari_getir();

        $data['seo_title'] = $data['kategori']->kategori_adi." kategorisine ait diziler | ".$genel_ayarlar->site_title;
        $data['seo_description'] = $genel_ayarlar->site_description;
        $data['seo_keywords'] = $genel_ayarlar->site_keywords;
        $data['seo_url'] = base_url("kategori/$kategori_url");
        $data['seo_image'] = base_url("uploads/$genel_ayarlar->site_logo");

        $this->load->view('kategori', $data);

    }

    public function etiket($etiket_url){

        $etiket_url = $this->security->xss_clean($etiket_url);

        $data["kategoriler"] = $this->diziler_model->kategoriler_v2();
        $data['etiket'] = $this->etiketler_model->etiket_getir($etiket_url);

        if (empty($data['etiket'])) {
            redirect(base_url());
        }

        $etiket_id = $data['etiket']->id;

        $data['etikets'] = html_escape('"'.$data['etiket']->etiket).'"'.' etiketine ait diziler';

        $sayfa = $this->security->xss_clean($this->input->get('sayfa'));
        if (empty($sayfa)) {
            $sayfa = 0;
        }

        if ($sayfa != 0) {
            $sayfa = $sayfa - 1;
        }

        $config['base_url'] = base_url() . '/etiket/' . $etiket_url;
        $config['total_rows'] = $this->anasayfa_model->etikete_ait_dizi_sayisi($etiket_url);
        $config['per_page'] = $this->ayarlar->anasayfa_etiket_sayisi;
        $this->pagination->initialize($config);
        $data['etiket_urlsi'] =  base_url() . 'etiket/' . $etiket_url;
        $data['diziler'] = $this->anasayfa_model->etikete_ait_diziler_sayfalama($etiket_url, $config['per_page'], $sayfa * $config['per_page']);


        $data['sayfalar'] = $this->sayfalar_model->get_aktif();

        $genel_ayarlar = $this->ayarlar_model->ayarlari_getir();

        $data['seo_title'] = $data['etiket']->etiket." etiketine ait diziler | ".$genel_ayarlar->site_title;
        $data['seo_description'] = $genel_ayarlar->site_description;
        $data['seo_keywords'] = $data['etiket']->etiket_url.", ".$genel_ayarlar->site_keywords;
        $data['seo_url'] = base_url("etiket/$etiket_url");
        $data['seo_image'] = base_url("uploads/$genel_ayarlar->site_logo");

        $this->load->view('etiket', $data);
    }

    public function sayfa($sayfa_url){

        $sayfa_url = $this->security->xss_clean($sayfa_url);

        if (empty($sayfa_url)) {
            redirect(base_url());
        }

        $data['sayfalar'] = $this->sayfalar_model->get_aktif();


        $data["kategoriler"] = $this->diziler_model->kategoriler_v2();
        $data['sayfa'] = $this->anasayfa_model->sayfa($sayfa_url);

        if ($data['sayfa']->sayfa_durum == 0 || $data['sayfa']->sayfa_url == '') {
            redirect(base_url());
        } else {
            $genel_ayarlar = $this->ayarlar_model->ayarlari_getir();
            $data['sayfa_title'] = $data['sayfa']->sayfa_baslik;
            $data['sayfa_icerik'] = $data['sayfa']->sayfa_icerik;
            $data['sayfa_url'] = $data['sayfa']->sayfa_url;
            $data['seo_title'] = $data['sayfa']->sayfa_baslik." | ".$genel_ayarlar->site_title;
            $data['seo_description'] = $data['sayfa']->sayfa_icerik;
            $data['seo_keywords'] = $genel_ayarlar->site_keywords;
            $data['seo_url'] = base_url("sayfa/$sayfa_url");
            $data['seo_image'] = base_url("uploads/$genel_ayarlar->site_logo");
            $this->load->view('sayfa', $data);

        }
    }

    public function arama(){

        $q = $this->input->get('q', TRUE);

        $data['q'] = $q;
        $data['arama_title'] = "'".$q. "' ". html_escape("için arama sonuçları");
        $data['arama_description'] = "'".$q. "' ". html_escape("için arama sonuçları");

        $data["kategoriler"] = $this->diziler_model->kategoriler_v2();

        $sayfa = $this->security->xss_clean($this->input->get('sayfa'));
        if (empty($sayfa)) {
            $sayfa = 0;
        }

        if ($sayfa != 0) {
            $sayfa = $sayfa - 1;
        }
        $data['arama_dizi_sayisi'] = $this->anasayfa_model->arama_dizi_sayisi($q);

        $config['base_url'] = base_url() . '/arama?q=' . $q;
        $config['total_rows'] = $data['arama_dizi_sayisi'];
        $config['per_page'] = $this->ayarlar->arama_dizi_sayisi;
        $this->pagination->initialize($config);

        $data['diziler'] = $this->anasayfa_model->sayfalama_aramalari($q, $config['per_page'], $sayfa * $config['per_page']);

        $data['sayfalar'] = $this->sayfalar_model->get_aktif();

        $genel_ayarlar = $this->ayarlar_model->ayarlari_getir();

        $data['seo_title'] = $q." aramasına ait spnuçlar | ".$genel_ayarlar->site_title;
        $data['seo_description'] = $genel_ayarlar->site_description;
        $data['seo_keywords'] = $genel_ayarlar->site_keywords;
        $data['seo_url'] = base_url("arama?q=$q");
        $data['seo_image'] = base_url("uploads/$genel_ayarlar->site_logo");

        $this->load->view('arama', $data);
    }

    public function en_cok_izlenenler(){

        $sayfa = $this->security->xss_clean($this->input->get('sayfa'));
        if (empty($sayfa)) {
            $sayfa = 0;
        }

        if ($sayfa != 0) {
            $sayfa = $sayfa - 1;
        }
        $config['base_url'] = base_url();
        $config['total_rows'] = $this->anasayfa_model->dizi_sayisi();
        $config['per_page'] = $this->ayarlar->anasayfa_dizi_sayisi;
        $this->pagination->initialize($config);

        $genel_ayarlar = $this->ayarlar_model->ayarlari_getir();
        $dizi_listesi = $this->anasayfa_model->sayfalama_encokizlenen_dizileri($config['per_page'], $sayfa * $config['per_page']);

        $ktg_list = $this->diziler_model->kategoriler_v2();
        $viewData["list"] = $ktg_list;

        $syf_list = $this->sayfalar_model->get_aktif();
        $viewData["list"] = $syf_list;

        $data = array(
            'kategoriler' => $ktg_list,
            'dizi_listesi' => $dizi_listesi,
            'genel_ayarlar' => $genel_ayarlar,
            'sayfalar' => $syf_list,
            'seo_title' => "En Çok İzlenenler | ".$genel_ayarlar->site_title,
            'seo_description' => $genel_ayarlar->site_description,
            'seo_keywords' => $genel_ayarlar->site_keywords,
            'seo_url' => base_url("en-cok-izlenenler"),
            'seo_image' => base_url("assets/images/bd.png")
        );
        $this->load->view("encokizlenenler_sayfa", $data);

    }

    public function en_cok_begenilenler(){

        $sayfa = $this->security->xss_clean($this->input->get('sayfa'));
        if (empty($sayfa)) {
            $sayfa = 0;
        }

        if ($sayfa != 0) {
            $sayfa = $sayfa - 1;
        }
        $config['base_url'] = base_url();
        $config['total_rows'] = $this->anasayfa_model->dizi_sayisi();
        $config['per_page'] = $this->ayarlar->anasayfa_dizi_sayisi;
        $this->pagination->initialize($config);

        $genel_ayarlar = $this->ayarlar_model->ayarlari_getir();
        $dizi_listesi = $this->anasayfa_model->sayfalama_begenilen_dizileri($config['per_page'], $sayfa * $config['per_page']);

        $ktg_list = $this->diziler_model->kategoriler_v2();
        $viewData["list"] = $ktg_list;

        $syf_list = $this->sayfalar_model->get_aktif();
        $viewData["list"] = $syf_list;

        $data = array(
            'kategoriler' => $ktg_list,
            'dizi_listesi' => $dizi_listesi,
            'genel_ayarlar' => $genel_ayarlar,
            'sayfalar' => $syf_list,
            'seo_title' => "En Çok Beğenilenler | ".$genel_ayarlar->site_title,
            'seo_description' => $genel_ayarlar->site_description,
            'seo_keywords' => $genel_ayarlar->site_keywords,
            'seo_url' => base_url("en-cok-begenilenler"),
            'seo_image' => base_url("assets/images/bd.png")
        );
        $this->load->view("encokbegenilenler_sayfa", $data);

    }

    public function oylama(){

        if(isset($_GET["like"])){

            $id = $_GET["like"];
            $ip_adresi = GetIP();

            if(!empty($this->anasayfa_model->begeni_varmi($id,$ip_adresi))){
                $json['error'] = 'Zaten bu diziyi beğenmişsin. Daha fazla beğeni gönderemezsin, başka dizilere gönder...';
                echo json_encode($json);
            } else {
            $data = array(
                "ip_adresi"   => $ip_adresi,
                "begeni_dizi_id"   => $id
            );

            $json = ["begeni_dizi_id" => "$id", "success" => "Beğeni başarıyla gönderildi..."];
            echo json_encode($json);

            $this->diziler_model->begeni_ekle($data);

            }

        } else {

            $json = ["error" => "Beğeni gönderilirken bir hata oluştu..."];
            echo json_encode($json);
        }
    }

    public function diziLoadMore(){
        $html = '';
        $genel_ayarlar = $this->ayarlar_model->ayarlari_getir();
        $bolum_toplam = $this->bolumler_model->get_all_count(array("bolum_durum" => 1));
        $limit = $this->input->post("getresult");
        $per_page = $genel_ayarlar->anasayfa_bolum_sayisi;
        $bolumler = $this->bolumler_model->get_all_limit_home(array("bolum_durum" => 1), "createdAt DESC", array("count" => $per_page, "start" => $limit));
        foreach($bolumler as $bolum){
            $sezon = $this->sezonlar_model->get(array("sezon_id" => $bolum->sezon_id)); $dizi = $this->diziler_model->get(array("id" => $bolum->dizi_id));
            $html .= '<div class="soneklenenbolumler col-sm-6 col-md-4 col-xs-6 col-xl-3 mb-3" id="blm'.$bolum->bolum_id.'">';
            $html .= '<a href="'.base_url("dizi/$dizi->dizi_url/izle/$sezon->sezon_kod/$bolum->bolum_kod").'" style="text-decoration:none;">';
            $html .= '<div class="card">';
            $html .= '<div class="row no-gutters">';
            $html .= '<img width="75" height="75" src="'.base_url("uploads/$dizi->dizi_resim").'" alt="'.$dizi->dizi_baslik.'">';
            $html .= '<div class="card-footer">';
            $html .= '<span id="span" style="font-size:14px;">'.$dizi->dizi_baslik.'<br>'.$sezon->sezon_kod.".Sezon ".$bolum->bolum_kod.".Bölüm".'(<small>'.get_readable_date($bolum->bolum_tarih).'</small>)</span>';
            $html .= '</div>';
            $html .= '</div>';
            $html .= '</div>';
            $html .= '</a>';
            $html .= '</div>';
        }
        echo $html;
    }
}