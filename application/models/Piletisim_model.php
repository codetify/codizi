<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Piletisim_model extends CI_Model {

    public function insert($data){

        $insert = $this->db->insert("iletisim", $data);
        return $insert;

    }
}