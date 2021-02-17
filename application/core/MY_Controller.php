<?php defined('BASEPATH') OR exit('No direct script access allowed');

class MY_Controller extends CI_Controller
{
    public function __construct()
    {
        parent::__construct();
        $this->load->model('admin/ayarlar_model');
        $this->load->model('admin/reklamlar_model');
    }
}

class Genel_MY_Controller extends MY_Controller
{
    public function __construct()
    {
        parent::__construct();

        $global_data['ayarlar'] = $this->ayarlar_model->ayarlari_getir();
        $this->ayarlar = $global_data['ayarlar'];

        $video_onu_reklam = "video_onu";
        $global_data['video_onu_reklam'] = $this->reklamlar_model->reklam_getir($video_onu_reklam);

        $video_alt_reklam = "video_alt";
        $global_data['video_alt_reklam'] = $this->reklamlar_model->reklam_getir($video_alt_reklam);

        $sag_blok_423_250 = "sag_blok_423_250";
        $global_data['sag_blok_423_250'] = $this->reklamlar_model->reklam_getir($sag_blok_423_250);

        $alt_sabit_728_90 = "alt_sabit_728_90";
        $global_data['alt_sabit_728_90'] = $this->reklamlar_model->reklam_getir($alt_sabit_728_90);


        $this->video_onu_reklam = $global_data['video_onu_reklam'];
        $this->video_alt_reklam = $global_data['video_alt_reklam'];
        $this->sag_blok_423_250 = $global_data['sag_blok_423_250'];
        $this->alt_sabit_728_90 = $global_data['alt_sabit_728_90'];

        $this->load->vars($global_data);

        function GetIP(){
            if(getenv("HTTP_CLIENT_IP")) {
                $ip = getenv("HTTP_CLIENT_IP");
            } elseif(getenv("HTTP_X_FORWARDED_FOR")) {
                $ip = getenv("HTTP_X_FORWARDED_FOR");
                if (strstr($ip, ',')) {
                    $tmp = explode (',', $ip);
                    $ip = trim($tmp[0]);
                }
            } else {
                $ip = getenv("REMOTE_ADDR");
            }
            return $ip;
        }
    }
}