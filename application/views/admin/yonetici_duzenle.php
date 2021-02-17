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
<li class="breadcrumb-item active">Yönetici Düzenle</li>
</ol>
<div class="card mb-3">
<div class="card-header">
<i class="fa fa-users"></i> Yönetici Düzenle</div>
<div class="card-body">
<form action="<?php echo base_url("admin/yoneticiler/duzenle/update/$yoneticiler->id"); ?>" method="post">
<input type="hidden" name="ekleyen_id" value="<?php $user = $this->session->userdata("user"); echo $user["id"]; ?>">
<div class="form-group">
<label for="ad_soyad">Ad & Soyad</label>
<input type="text" class="form-control" id="ad_soyad" name="ad_soyad" value="<?php echo $yoneticiler->ad_soyad; ?>">
</div>
<div class="form-group">
<label for="email">E-Posta Adresi</label>
<input type="text" class="form-control" id="email" name="email" value="<?php echo $yoneticiler->email; ?>">
</div>
<div class="form-group">
<label for="sifre">Şifre (Değiştirmeyecekseniz boş bırakın)</label>
<input type="password" class="form-control" id="sifre" name="sifre">
</div>
<div class="form-group">
<label for="telefon">Telefon Numarası (Zorunlu Değil)</label>
<input type="text" class="form-control" id="telefon" name="telefon" value="<?php echo $yoneticiler->telefon; ?>">
</div>
<div class="form-group">
<label for="cinsiyet">Cinsiyet</label>
<select class="form-control" id="cinsiyet" name="cinsiyet">
<option value="1" <?php if($yoneticiler->cinsiyet=="e"){echo "selected";}; ?>>Erkek</option>
<option value="2" <?php if($yoneticiler->cinsiyet=="k"){echo "selected";}; ?>>Kadın</option>
</select>
</div>
<div class="form-group">
<label for="isActive">Onaylı mı?</label>
<select class="form-control" id="isActive" name="isActive">
<option value="1" <?php if($yoneticiler->isActive=="1"){echo "selected";}; ?>>Onaylı</option>
<option value="0" <?php if($yoneticiler->isActive=="0"){echo "selected";}; ?>>Onaysız</option>
</select>
</div>
<div class="form-group">
<label for="user_role">Kullanıcı Rolü</label>
<select class="form-control" id="user_role" name="user_role">
<option value="4" <?php if($yoneticiler->user_role=="4"){echo "selected";}; ?>>Admin</option>
<option value="3" <?php if($yoneticiler->user_role=="3"){echo "selected";}; ?>>Moderatör</option>
<option value="2" <?php if($yoneticiler->user_role=="2"){echo "selected";}; ?>>Editör</option>
<option value="1" <?php if($yoneticiler->user_role=="1"){echo "selected";}; ?>>Üye</option>
<option value="0" <?php if($yoneticiler->user_role=="0"){echo "selected";}; ?>>Yasaklı</option>
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