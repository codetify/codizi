<?php
defined('BASEPATH') OR exit('No direct script access allowed');


class Sitemap extends CI_Controller {

    public function index()
    {
        $this->load->database();
        
        //Yazılar
        $query = $this->db->get("brkdndr_filmler");
        $data['items'] = $query->result();
        
        //Sayfalar
        $query = $this->db->get("brkdndr_sayfalar");
        $data['sayfas'] = $query->result();
        
        //Kategoriler
        $query = $this->db->get("brkdndr_kategoriler");
        $data['kategoris'] = $query->result();
		
		//Etiketler
        //$query = $this->db->get("brkdndr_etiketler");
        //$data['etikets'] = $query->result();


        $this->load->view('sitemap', $data);
    }
}