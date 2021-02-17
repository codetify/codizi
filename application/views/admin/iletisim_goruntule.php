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
</head>
<body class="fixed-nav sticky-footer bg-dark sidenav-toggled" id="page-top">
<?php $this->load->view("admin/menu");?>
<div class="content-wrapper">
<div class="container-fluid">
<ol class="breadcrumb">
<li class="breadcrumb-item">
<a href="<?php echo base_url("yonetim/anasayfa"); ?>">Panel</a>
</li>
<li class="breadcrumb-item active">Mesajı Görüntüle</li>
</ol>
<div class="card mb-3">
<div class="card-header">
<i class="fa fa-support"></i> Mesajı Görüntüle</div>
<div class="card-body">
<div class="form-group">
<label for="gonderen_ad_soyad">Ad & Soyad</label>
<input type="text" class="form-control" id="gonderen_ad_soyad" name="gonderen_ad_soyad" value="<?php echo $iletisim_mesajlari->gonderen_ad_soyad; ?>" disabled>
</div>
<div class="form-group">
<label for="gonderen_email">E-Mail Adresi</label>
<input type="email" class="form-control" id="gonderen_email" name="gonderen_email" value="<?php echo $iletisim_mesajlari->gonderen_email; ?>" disabled>
</div>
<div class="form-group">
<label for="konu">Konu</label>
<input type="text" class="form-control" id="konu" name="konu" value="<?php echo $iletisim_mesajlari->konu; ?>" disabled>
</div>
<div class="form-group">
<label for="mesaj">Mesaj İçeriği</label>
<textarea rows="5" class="form-control" id="mesaj" name="mesaj" disabled><?php echo html_escape($iletisim_mesajlari->mesaj); ?></textarea>
</div>
</div>
</div>
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
<script src="<?php echo base_url("assets/a/vendor/jquery/jquery.min.js"); ?>"></script>
<script src="<?php echo base_url("assets/a/vendor/bootstrap/js/bootstrap.bundle.min.js"); ?>"></script>
<script src="<?php echo base_url("assets/a/vendor/jquery-easing/jquery.easing.min.js"); ?>"></script>
<script src="<?php echo base_url("assets/a/vendor/datatables/jquery.dataTables.js"); ?>"></script>
<script src="<?php echo base_url("assets/a/vendor/datatables/dataTables.bootstrap4.js"); ?>"></script>
<script src="<?php echo base_url("assets/a/js/sb-admin.js"); ?>"></script>
<script src="<?php echo base_url("assets/a/js/sb-admin-datatables.min.js"); ?>"></script>
<script src="<?php echo base_url("assets/js/sweetalert2.all.js"); ?>"></script>
<?php $this->load->view("admin/alert"); ?>
</div>
</body>
</html>