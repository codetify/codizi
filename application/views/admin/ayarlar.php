<?php $admin = $this->session->userdata("admin"); ?>
<!DOCTYPE html>
<html lang="tr">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">
<title><?php echo $title; ?></title>
<link href="<?php echo base_url("assets/a/vendor/bootstrap/css/bootstrap.min.css"); ?>" rel="stylesheet">
<link href="<?php echo base_url("assets/a/vendor/font-awesome/css/font-awesome.min.css"); ?>" rel="stylesheet" type="text/css">
<link href="<?php echo base_url("assets/a/vendor/datatables/dataTables.bootstrap4.css"); ?>" rel="stylesheet">
<link href="<?php echo base_url("assets/a/css/sb-admin.css"); ?>" rel="stylesheet">
<link href="<?php echo base_url("assets/css/sweetalert2.min.css"); ?>" rel="stylesheet">
</head>
<body class="fixed-nav sticky-footer bg-dark sidenav-toggled" id="page-top">
<?php $this->load->view("admin/menu");?>
<div class="content-wrapper">
<div class="container-fluid">
<ol class="breadcrumb">
<li class="breadcrumb-item">
<a href="<?php echo base_url("admin"); ?>">Panel</a>
</li>
<li class="breadcrumb-item active">Genel Ayarlar</li>
</ol>
<h4>Genel Ayarlar</h4>
<hr>
<form action="<?php echo base_url("admin/ayarlar/update"); ?>" method="post" enctype="multipart/form-data">
<input type="hidden" name="yazar" value="<?php $user = $this->session->userdata("user"); echo $user["id"]; ?>">
<?php foreach ($genel_ayarlar as $row) { ?>
<div class="col-md-12">
<div class="input-group">
<div class="input-group-prepend">
<span class="input-group-text">Sitenin Başlığı</span>
</div>
<input type="text" class="form-control" name="baslik" value="<?php echo $row->site_baslik; ?>">
</div>
<br>
<div class="input-group">
<div class="input-group-prepend">
<span class="input-group-text">Sitenin Adı (Title)</span>
</div>
<input type="text" class="form-control" name="title" value="<?php echo $row->site_title; ?>">
</div>
<br>
<div class="input-group">
<div class="input-group-prepend">
<span class="input-group-text">Açıklama (Description)</span>
</div>
<input type="text" class="form-control" name="description" value="<?php echo $row->site_description; ?>">
</div>
<br>
<div class="input-group">
<div class="input-group-prepend">
<span class="input-group-text">Anahtar Kelimeler (Keywords)</span>
</div>
<input type="text" class="form-control" name="keywords" value="<?php echo $row->site_keywords; ?>">
</div>
<br>
<div class="input-group">
<div class="input-group-prepend">
<span class="input-group-text">Site OG Twitter Kullanıcı Adı (@den sonrası)</span>
</div>
<input type="text" class="form-control" name="site_og_twitter" value="<?php echo $row->site_og_twitter; ?>">
</div>
<br>
<div class="input-group">
<div class="input-group-prepend">
<span class="input-group-text">Site Seo Resmi (OG:İmage)</span>
</div>
<input type="file" class="form-control" name="site_logo">
</div>
<br>
<div class="input-group">
<img src="<?php echo base_url("uploads/$row->site_logo"); ?>" width="200">
</div>
<br>
<div class="input-group">
<div class="input-group-prepend">
<span class="input-group-text">Favicon</span>
</div>
<input type="file" class="form-control" name="site_favicon" width="200">
</div>
<br>
<div class="input-group">
<img src="<?php echo base_url("uploads/$row->site_favicon"); ?>">
</div>
<br>
<div class="input-group">
<div class="input-group-prepend">
<span class="input-group-text">Dizi botu için TMDB API Anahtarı (<a href="https://developers.themoviedb.org/3/getting-started/introduction" target="blank">almak için tıklayın</a>)</span>
</div>
<input type="text" class="form-control" name="tmdb" value="<?php echo $row->site_tmdb_api; ?>">
</div>
<br>
<div class="input-group">
<div class="input-group-prepend">
<span class="input-group-text">Anasayfada görünecek olan ve daha fazla yükleme kısmında gelecek olan bölüm sayısı</span>
</div>
<input type="text" class="form-control" name="anasayfa_bolum_sayisi" value="<?php echo $row->anasayfa_bolum_sayisi; ?>">
</div>
<br>
<div class="input-group">
<div class="input-group-prepend">
<span class="input-group-text">Anasayfada görünecek olan dizi sayısı</span>
</div>
<input type="text" class="form-control" name="anasayfa_dizi" value="<?php echo $row->anasayfa_dizi_sayisi; ?>">
</div>
<br>
<div class="input-group">
<div class="input-group-prepend">
<span class="input-group-text">Anasayfada görünecek olan en çok izlenen dizi sayısı</span>
</div>
<input type="text" class="form-control" name="encokizlenen_dizi" value="<?php echo $row->enckizlenen_dizi_sayisi; ?>">
</div>
<br>
<div class="input-group">
<div class="input-group-prepend">
<span class="input-group-text">Kategori listeleme sayfasında görünecek olan dizi sayısı</span>
</div>
<input type="text" class="form-control" name="anasayfa_kategori" value="<?php echo $row->anasayfa_kategori_sayisi; ?>">
</div>
<br>
<div class="input-group">
<div class="input-group-prepend">
<span class="input-group-text">Etiket listeleme sayfasında görünecek olan dizi sayısı</span>
</div>
<input type="text" class="form-control" name="anasayfa_etiket" value="<?php echo $row->anasayfa_etiket_sayisi; ?>">
</div>
<br>
<div class="input-group">
<div class="input-group-prepend">
<span class="input-group-text">Arama sayfasında görünecek olan dizi sayısı</span>
</div>
<input type="text" class="form-control" name="arama_dizi" value="<?php echo $row->arama_dizi_sayisi; ?>">
</div>
</div>
<br>
<h4>Sosyal Medya Ayarları</h4>
<hr>
<div class="col-md-12">
<div class="input-group">
<div class="input-group-prepend">
<span class="input-group-text">Facebook</span>
</div>
<input type="text" class="form-control" name="facebook" value="<?php echo $row->site_facebook; ?>">
</div>
<br>
<div class="input-group">
<div class="input-group-prepend">
<span class="input-group-text">Twitter</span>
</div>
<input type="text" class="form-control" name="twitter" value="<?php echo $row->site_twitter; ?>">
</div>
<br>
<div class="input-group">
<div class="input-group-prepend">
<span class="input-group-text">Instagram</span>
</div>
<input type="text" class="form-control" name="instagram" value="<?php echo $row->site_instagram; ?>">
</div>
<br>
<div class="input-group">
<div class="input-group-prepend">
<span class="input-group-text">Youtube</span>
</div>
<input type="text" class="form-control" name="youtube" value="<?php echo $row->site_youtube; ?>">
</div>
<br>
<div class="input-group">
<div class="input-group-prepend">
<span class="input-group-text">Google Plus</span>
</div>
<input type="text" class="form-control" name="google_plus" value="<?php echo $row->site_google_plus; ?>">
</div>
</div>
<br>
<div class="col-12"><button type="submit" class="btn btn-primary">Ayarları Kaydet</button></div>
<br>
<?php } ?>
</form>
</div>
<footer class="sticky-footer">
<div class="container">
<div class="text-center">
<small>Copyright © Codetify 2021</small>
</div>
</div>
</footer>
<a class="scroll-to-top rounded" href="#page-top">
<i class="fa fa-angle-up"></i>
</a>
<?php $this->load->view("admin/cikis_yap");?>
</div>
</body>
<script src="<?php echo base_url("assets/a/vendor/jquery/jquery.min.js"); ?>"></script>
<script src="<?php echo base_url("assets/a/vendor/bootstrap/js/bootstrap.bundle.min.js"); ?>"></script>
<script src="<?php echo base_url("assets/a/vendor/jquery-easing/jquery.easing.min.js"); ?>"></script>
<script src="<?php echo base_url("assets/a/vendor/datatables/jquery.dataTables.js"); ?>"></script>
<script src="<?php echo base_url("assets/a/vendor/datatables/dataTables.bootstrap4.js"); ?>"></script>
<script src="<?php echo base_url("assets/a/js/sb-admin.js"); ?>"></script>
<script src="<?php echo base_url("assets/a/js/sb-admin-datatables.min.js"); ?>"></script>
<script src="<?php echo base_url("assets/js/sweetalert2.all.js"); ?>"></script>
<?php $this->load->view("admin/alert"); ?>
</html>