<?php
defined('BASEPATH') OR exit('No direct script access allowed');

$route['404_override'] = '';
$route['translate_uri_dashes'] = FALSE;

//
$route['api/oylama'] = "Anasayfa/oylama";
//
//
$route['sitemap\.xml'] = "Sitemap/index";
//
$route['admin'] = 'admin/Admin/index';
$route['admin/index'] = 'admin/Admin/index';
$route['admin/giris'] = 'admin/Admin/giris_yap';
$route['admin/cikis'] = 'admin/Admin/cikis_yap';
//
$route['default_controller'] = 'Anasayfa';
$route['anasayfa'] = 'Anasayfa/index';
$route['arama'] = 'Anasayfa/arama';
$route['yorum-ekle'] = 'Anasayfa/yorum_ekle/insert';
$route['iletisim'] = 'Piletisim/index';
$route['iletisim/gonder'] = 'Piletisim/form_gonder';
$route['dizi/(:any)'] = 'Anasayfa/dizi_icerik/$1';
$route['arama'] = 'Anasayfa/arama';
$route['kategori/(:any)'] = 'Anasayfa/kategori/$1';
$route['etiket/(:any)'] = 'Anasayfa/etiket/$1';
$route['sayfa/(:any)'] = 'Anasayfa/sayfa/$1';
$route['en-cok-izlenenler'] = 'Anasayfa/en_cok_izlenenler';
$route['en-cok-begenilenler'] = 'Anasayfa/en_cok_begenilenler';
$route['dizi/(:any)/izle/(:num)/(:num)'] = 'Anasayfa/dizi_izle/$1/$2/$3';
$route['dahafazla'] = 'Anasayfa/diziLoadMore';
//
$route['admin/diziler'] = 'admin/diziler/index';
$route['admin/diziler/ekle'] = 'admin/diziler/insert_form';
$route['admin/diziler/ekle/insert'] = 'admin/diziler/insert';
$route['admin/diziler/duzenle'] = 'admin/diziler/update_form';
$route['admin/diziler/duzenle/(:any)'] = 'admin/diziler/update_form/$1';
$route['admin/diziler/duzenle/update/(:any)'] = 'admin/diziler/update/$1';
$route['admin/diziler/sil/(:any)'] = 'admin/diziler/delete/$1';
//
$route['admin/diziler/sezonlar/ekle/(:num)'] = 'admin/diziler/sezon_ekle_form/$1';
$route['admin/diziler/sezon-ekle/(:num)'] = 'admin/diziler/sezon_ekle/$1';
$route['admin/diziler/sezonlar/duzenle/(:num)'] = 'admin/diziler/sezon_duzenle_form/$1';
$route['admin/diziler/sezon-duzenle/(:num)'] = 'admin/diziler/sezon_duzenle/$1';
$route['admin/diziler/sezon-sil/(:any)'] = 'admin/diziler/sezondelete/$1';
$route['admin/diziler/sezonlar/sirala'] = 'admin/diziler/sezonRankSetter';
//
$route['admin/diziler/bolumler/ekle/(:num)'] = 'admin/diziler/bolum_ekle_form/$1';
$route['admin/diziler/bolum-ekle/(:num)'] = 'admin/diziler/bolum_ekle/$1';
$route['admin/diziler/bolumler/duzenle/(:num)'] = 'admin/diziler/bolum_duzenle_form/$1';
$route['admin/diziler/bolum-duzenle/(:num)'] = 'admin/diziler/bolum_duzenle/$1';
$route['admin/diziler/bolum-sil/(:num)'] = 'admin/diziler/bolumdelete/$1';
$route['admin/diziler/bolumler/sirala'] = 'admin/diziler/bolumRankSetter';
//
$route['admin/dizi-kaynak'] = 'admin/dizi_kaynak/index';
$route['admin/dizi-kaynak/ekle'] = 'admin/dizi_kaynak/insert_form';
$route['admin/dizi-kaynak/ekle/insert'] = 'admin/dizi_kaynak/insert';
$route['admin/dizi-kaynak/duzenle'] = 'admin/dizi_kaynak/update_form';
$route['admin/dizi-kaynak/duzenle/(:any)'] = 'admin/dizi_kaynak/update_form/$1';
$route['admin/dizi-kaynak/duzenle/update/(:any)'] = 'admin/dizi_kaynak/update/$1';
$route['admin/dizi-kaynak/sil/(:any)'] = 'admin/dizi_kaynak/delete/$1';
$route["admin/dizi-kaynak/diziSec"] = "admin/dizi_kaynak/diziSec";
//
$route['admin/yoneticiler'] = 'admin/yoneticiler/index';
$route['admin/yoneticiler/ekle'] = 'admin/yoneticiler/insert_form';
$route['admin/yoneticiler/ekle/insert'] = 'admin/yoneticiler/insert';
$route['admin/yoneticiler/duzenle'] = 'admin/yoneticiler/update_form';
$route['admin/yoneticiler/duzenle/(:any)'] = 'admin/yoneticiler/update_form/$1';
$route['admin/yoneticiler/duzenle/update/(:any)'] = 'admin/yoneticiler/update/$1';
$route['admin/yoneticiler/sil/(:any)'] = 'admin/yoneticiler/delete/$1';
//
$route['admin/yorumlar'] = 'admin/yorumlar/index';
$route['admin/yorumlar/duzenle'] = 'admin/yorumlar/update_form';
$route['admin/yorumlar/duzenle/(:any)'] = 'admin/yorumlar/update_form/$1';
$route['admin/yorumlar/duzenle/update/(:any)'] = 'admin/yorumlar/update/$1';
$route['admin/yorumlar/sil/(:any)'] = 'admin/yorumlar/delete/$1';
//
$route['admin/ayarlar'] = 'admin/ayarlar/index';
$route['admin/ayarlar/update'] = 'admin/ayarlar/update';

//
$route['admin/iletisim'] = 'admin/piletisim/index';
$route['admin/iletisim/(:num)'] = 'admin/piletisim/iletisim_icerik/$1';
$route['admin/iletisim/sil/(:any)'] = 'admin/piletisim/delete/$1';

//Kategoriler
$route['admin/kategoriler'] = 'admin/kategoriler/index';
$route['admin/kategoriler/ekle'] = 'admin/kategoriler/insert_form';
$route['admin/kategoriler/ekle/insert'] = 'admin/kategoriler/insert';
$route['admin/kategoriler/duzenle'] = 'admin/kategoriler/update_form';
$route['admin/kategoriler/duzenle/(:any)'] = 'admin/kategoriler/update_form/$1';
$route['admin/kategoriler/duzenle/update/(:any)'] = 'admin/kategoriler/update/$1';
$route['admin/kategoriler/sil/(:any)'] = 'admin/kategoriler/delete/$1';
//Kategoriler

//Sayfalar
$route['admin/sayfalar'] = 'admin/sayfalar/index';
$route['admin/sayfalar/ekle'] = 'admin/sayfalar/insert_form';
$route['admin/sayfalar/ekle/insert'] = 'admin/sayfalar/insert';
$route['admin/sayfalar/duzenle'] = 'admin/sayfalar/update_form';
$route['admin/sayfalar/duzenle/(:any)'] = 'admin/sayfalar/update_form/$1';
$route['admin/sayfalar/duzenle/update/(:any)'] = 'admin/sayfalar/update/$1';
$route['admin/sayfalar/sil/(:any)'] = 'admin/sayfalar/delete/$1';
//Sayfalar

//Reklamlar
$route['admin/reklamlar'] = 'admin/reklamlar/index';
$route['admin/reklamlar/duzenle'] = 'admin/reklamlar/update_form';
$route['admin/reklamlar/duzenle/(:any)'] = 'admin/reklamlar/update_form/$1';
$route['admin/reklamlar/duzenle/update/(:any)'] = 'admin/reklamlar/update/$1';
$route['admin/reklamlar/sil/(:any)'] = 'admin/reklamlar/delete/$1';
//Reklamlar

//dizi Botu
$route['admin/dizi-botu'] = 'admin/dizi_botu/index';
$route['admin/dizi-botu/getir'] = 'admin/dizi_botu/getir';
$route['admin/dizi-botu/ekle'] = 'admin/dizi_botu/insert';
$route['admin/diziler/sezonlar/(:num)/bot'] = 'admin/diziler/sezon_bot/$1';
$route['admin/diziler/bolumler/(:num)/bot'] = 'admin/diziler/bolum_bot/$1';
//dizi Botu
