<?php
defined('BASEPATH') OR exit('No direct script access allowed');


$config['num_links'] = 4;
$config['use_page_numbers'] = TRUE;
$config['page_query_string'] = TRUE;
$config['query_string_segment'] = 'sayfa';
$config['first_link'] = false;
$config['last_link'] = false;
$config['attributes'] = array('class' => 'page-link');

$config['full_tag_open'] = "<ul class=\"pagination\">";
$config['full_tag_close'] = "</ul>";
$config['num_tag_open'] = "<li class=\"page-item\">";
$config['num_tag_close'] = '</li>';
$config['cur_tag_open'] = "<li class=\"page-item active\"><a href=\"#\" class='page-link'>";
$config['cur_tag_close'] = "</a></li>";

$config['next_link'] = 'Sonraki';
$config['next_tag_open'] = "<li class=\"page-item\">";
$config['next_tagl_close'] = "</li>";

$config['prev_link'] = 'Önceki';
$config['prev_tag_open'] = "<li class=\"page-item\">";
$config['prev_tagl_close'] = "</li>";

$config['first_tag_open'] = "<li class=\"page-item\">";
$config['first_tagl_close'] = "</li>";
$config['last_tag_open'] = "<li class=\"page-item\">";
$config['last_tagl_close'] = "</li>";