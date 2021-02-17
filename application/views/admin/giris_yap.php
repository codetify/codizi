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
<link href="<?php echo base_url("assets/a/css/sb-admin.css"); ?>" rel="stylesheet">
<link href="<?php echo base_url("assets/css/sweetalert2.min.css"); ?>" rel="stylesheet">
</head>
<body class="bg-dark">
<div class="container">
<div class="card card-login mx-auto mt-5">
<div class="card-header">Giriş yap</div>
<div class="card-body">
<form action="<?php echo base_url("admin/giris"); ?>" method="post">
<div class="form-group">
<label for="email">E-Posta Adresiniz</label>
<input class="form-control" type="email" id="email" name="email" value="<?php echo (isset($member)) ? $member->email : ""; ?>" placeholder="E-Posta adresinizi giriniz">
</div>
<div class="form-group">
<label for="sifre">Şifreniz</label>
<input class="form-control" id="sifre" type="password" name="sifre" value="<?php echo (isset($member)) ? $member->password : ""; ?>" placeholder="Şifrenizi giriniz">
</div>
<button type="submit" class="btn btn-primary btn-block">Giriş yap</button>
</form>
</div>
</div>
</div>
<script src="<?php echo base_url("assets/a/vendor/jquery/jquery.min.js"); ?>"></script>
<script src="<?php echo base_url("assets/a/vendor/bootstrap/js/bootstrap.bundle.min.js"); ?>"></script>
<script src="<?php echo base_url("assets/a/vendor/jquery-easing/jquery.easing.min.js"); ?>"></script>
<script src="<?php echo base_url("assets/js/sweetalert2.all.js"); ?>"></script>
<?php $this->load->view("admin/alert"); ?>
</body>
</html>