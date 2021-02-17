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
<li class="breadcrumb-item active"><?php echo $dizi->dizi_baslik; ?> isimli dizinin  <?php echo $sezon->sezon_baslik; ?>unu düzenle</li>
</ol>
<div class="card mb-3">
<div class="card-header">
<i class="fa fa-file"></i> <?php echo $dizi->dizi_baslik; ?> isimli dizinin  <?php echo $sezon->sezon_baslik; ?>unu düzenle</div>
<div class="card-body">
<form action="<?php echo base_url("admin/diziler/sezon-duzenle/$sezon->sezon_id"); ?>" method="post">
<div class="form-group">
<label for="baslik">Sezon Adı</label>
<input type="text" class="form-control" id="baslik" name="baslik" value="<?php echo $sezon->sezon_baslik; ?>">
</div>
<div class="form-group">
<label for="skodu">Sezon Kodu (Örn: 1)</label>
<input type="text" class="form-control" id="skodu" name="skodu" value="<?php echo $sezon->sezon_kod; ?>">
</div>
<div class="form-group">
<label for="tarih">Sezon Tarih</label>
<input type="text" class="form-control" id="tarih" name="tarih" value="<?php echo $sezon->sezon_tarih; ?>">
</div>
<div class="form-group">
<label for="durum">Onaylı mı?</label>
<select class="form-control" id="durum" name="durum">
<option value="1" <?php if($sezon->sezon_durum=="1"){echo "selected";}; ?>>Onaylı</option>
<option value="0" <?php if($sezon->sezon_durum=="0"){echo "selected";}; ?>>Onaysız</option>
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
<script src="<?php echo base_url("assets/plugins/ckeditor/ckeditor.js"); ?>"></script>
<script>
CKEDITOR.replace('sayfa_icerik', {
extraPlugins: 'syntaxhighlight'
});
</script>
</html>