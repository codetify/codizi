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
<li class="breadcrumb-item active">Yönetici Ekle</li>
</ol>
<div class="card mb-3">
<div class="card-header">
<i class="fa fa-users"></i> Yönetici Ekle</div>
<div class="card-body">
<form action="<?php echo base_url("admin/yoneticiler/ekle/insert"); ?>" method="post">
<input type="hidden" name="ekleyen_id" value="<?php $user = $this->session->userdata("user"); echo $user["id"]; ?>">
<div class="form-group">
<label for="ad_soyad">Ad & Soyad</label>
<input type="text" class="form-control" id="ad_soyad" name="ad_soyad">
</div>
<div class="form-group">
<label for="email">E-Posta Adresi</label>
<input type="text" class="form-control" id="email" name="email">
</div>
<div class="form-group">
<label for="sifre">Şifre</label>
<input type="text" class="form-control" id="sifre" name="sifre">
</div>
<div class="form-group">
<label for="telefon">Telefon Numarası (Zorunlu Değil)</label>
<input type="text" class="form-control" id="telefon" name="telefon">
</div>
<div class="form-group">
<label for="cinsiyet">Cinsiyet</label>
<select class="form-control" id="cinsiyet" name="cinsiyet">
<option value="1" selected>Erkek</option>
<option value="2">Kadın</option>
</select>
</div>
<div class="form-group">
<label for="isActive">Onaylı mı?</label>
<select class="form-control" id="isActive" name="isActive">
<option value="1" selected>Onaylı</option>
<option value="0">Onaysız</option>
</select>
</div>
<div class="form-group">
<label for="user_role">Kullanıcı Rolü</label>
<select class="form-control" id="user_role" name="user_role">
<option value="4" selected>Admin</option>
<option value="3">Moderatör</option>
<option value="2">Editör</option>
<option value="1">Üye</option>
<option value="0">Yasaklı</option>
</select>
</div>
<div class="form-group">
<button type="submit" class="btn btn-primary">Kaydet</button>
</div>
</form>
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