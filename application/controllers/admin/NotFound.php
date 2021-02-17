<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class NotFound extends CI_Controller {
    
    public function __construct(){
         parent::__construct();  
     }
    
	public function index(){
        
        $data['title'] = "Aramaya çalıştığınız sayfa bulunamadı! | Codetify";
        $this->output->set_status_header('404');
        $this->load->view("404/notfound", $data);
	}    

}