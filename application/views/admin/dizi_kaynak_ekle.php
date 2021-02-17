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
<script>var api = '<?php echo base_url('admin/dizi-kaynak'); ?>';</script>
</head>
<body class="fixed-nav sticky-footer bg-dark sidenav-toggled" id="page-top">
<?php $this->load->view("admin/menu");?>
<div class="content-wrapper">
<div class="container-fluid">
<ol class="breadcrumb">
<li class="breadcrumb-item">
<a href="<?php echo base_url("yonetim/anasayfa"); ?>">Panel</a>
</li>
<li class="breadcrumb-item active">Dizi Kaynağı Ekle</li>
</ol>
<div class="card mb-3">
<div class="card-header">
<i class="fa fa-sticky-note"></i> Dizi Kaynağı Ekle</div>
<div class="card-body">
<form action="<?php echo base_url("admin/dizi-kaynak/ekle/insert"); ?>" method="post">
<div class="form-group">
<label for="baslik">Kaynak Adı</label>
<input type="text" class="form-control" id="baslik" name="baslik">
</div>
<div class="form-group">
<label for="dizi">Dizi Seçiniz</label>
<select class="form-control" id="dizi" name="dizi">
<?php foreach ($diziler as $row) { ?>
<option value="<?php echo $row->id; ?>"><?php echo $row->dizi_baslik; ?></option>
<?php } ?>
</select>
</div>
<div class="form-group">
<label for="sezon">Sezon Seçiniz</label>
<select class="form-control" id="sezon" name="sezon">
<option value="">Sezon Seçiniz</option>
</select>
</div>
<div class="form-group">
<label for="bolum">Bölüm Seçiniz</label>
<select class="form-control" id="bolum" name="bolum">
<option value="">Bölüm Seçiniz</option>
</select>
</div>
<div class="form-group">
<label for="icerik">Kaynak Kodu (Embed Linki örn: https://www.youtube.com/embed/v0671zC2a3A)</label>
<textarea rows="5" class="form-control" id="icerik" name="icerik"></textarea>
</div>
<div class="form-group">
<label for="durum">Onaylı mı?</label>
<select class="form-control" id="durum" name="durum">
<option value="1">Onaylı</option>
<option value="0">Onaysız</option>
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
<script src="<?php echo base_url("assets/a/vendor/jquery/jquery.min.js"); ?>"></script>
<script src="<?php echo base_url("assets/a/vendor/bootstrap/js/bootstrap.bundle.min.js"); ?>"></script>
<script src="<?php echo base_url("assets/a/vendor/jquery-easing/jquery.easing.min.js"); ?>"></script>
<script src="<?php echo base_url("assets/a/vendor/datatables/jquery.dataTables.js"); ?>"></script>
<script src="<?php echo base_url("assets/a/vendor/datatables/dataTables.bootstrap4.js"); ?>"></script>
<script src="<?php echo base_url("assets/a/js/sb-admin.js"); ?>"></script>
<script src="<?php echo base_url("assets/a/js/sb-admin-datatables.min.js"); ?>"></script>
<script src="<?php echo base_url("assets/js/sweetalert2.all.js"); ?>"></script>
<?php $this->load->view("admin/alert"); ?>
<script src="<?php echo base_url("assets/a/js/main.js"); ?>"></script>
</div>
</body>
</html>