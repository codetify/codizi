<?php
defined('BASEPATH') OR exit('No direct script access allowed');


class Sitemap extends CI_Controller {

    public function index()
    {
        $this->load->database();
        
        //Diziler
        $query = $this->db->get("diziler");
        $data['items'] = $query->result();
        
        //Sayfalar
        $query = $this->db->get("sayfalar");
        $data['sayfas'] = $query->result();
        
        //Kategoriler
        $query = $this->db->get("kategoriler");
        $data['kategoris'] = $query->result();
		
        $this->load->view('sitemap', $data);
    }
}