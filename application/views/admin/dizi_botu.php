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
<li class="breadcrumb-item active">Dizi Botu</li>
</ol>
<div class="card mb-3">
<div class="card-header">Dizi bilgilerini bot ile getir (TMDB veritabanında bulunmayan dizilerde bilgileri lütfen el ile giriniz)
<a class="btn btn-sm btn-outline-primary" href="<?php echo base_url("admin/diziler/ekle"); ?>" style="float:right;text-decoration: none;"><i class="fa fa-plus-circle"></i> Yeni Ekle</a>
<a class="btn btn-sm btn-outline-success" href="<?php echo base_url("admin/dizi-botu"); ?>" style="position:relative;right:5px;float:right;text-decoration: none;">Dizi Botu</a>
</div>
<div class="card-body">
<form action="<?php echo base_url("admin/dizi-botu/getir"); ?>" method="post">
<div class="form-group input-group mb-1">
<input type="text" class="form-control" name="tmdb" placeholder="TMDB Dizi ID giriniz" aria-label="TMDB Dizi ID giriniz" aria-describedby="basic-addon2">
<div class="input-group-append">
<button name="getir" class="btn btn-sm btn-primary">Dizi bilgilerini getir</button>
</div>
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
<script src="<?php echo base_url("assets/a/vendor/jquery/jquery.min.js"); ?>"></script>
<script src="<?php echo base_url("assets/a/vendor/bootstrap/js/bootstrap.bundle.min.js"); ?>"></script>
<script src="<?php echo base_url("assets/a/vendor/jquery-easing/jquery.easing.min.js"); ?>"></script>
<script src="<?php echo base_url("assets/a/vendor/datatables/jquery.dataTables.js"); ?>"></script>
<script src="<?php echo base_url("assets/a/vendor/datatables/dataTables.bootstrap4.js"); ?>"></script>
<script src="<?php echo base_url("assets/a/js/sb-admin.js"); ?>"></script>
<script src="<?php echo base_url("assets/a/js/sb-admin-datatables.min.js"); ?>"></script>
<script src="<?php echo base_url("assets/js/sweetalert2.all.js"); ?>"></script>
<?php $this->load->view("admin/alert"); ?>
<script>
CKEDITOR.replace('yorum_icerik', {
extraPlugins: 'syntaxhighlight'
});
</script>
</div>
</body>
</html>