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
<li class="breadcrumb-item active">Yorum Düzenle</li>
</ol>
<div class="card mb-3">
<div class="card-header">
<i class="fa fa-list"></i> Yorum Düzenle</div>
<div class="card-body">
<form action="<?php echo base_url("admin/yorumlar/duzenle/update/$yorumlar->id"); ?>" method="post">
<input type="hidden" name="dizi_id" value="<?php echo $yorumlar->dizi_id; ?>">
<input type="hidden" name="id" value="<?php echo $yorumlar->id; ?>">
<div class="form-group">
<label for="yorum_ad_soyad">Rumuz</label>
<input type="text" class="form-control" id="yorum_ad_soyad" name="yorum_ad_soyad" value="<?php echo $yorumlar->yorum_ad_soyad; ?>">
</div>
<div class="form-group">
<label for="yorum_email">E-Posta Adresi</label>
<input type="text" class="form-control" id="yorum_email" name="yorum_email" value="<?php echo $yorumlar->yorum_email; ?>">
</div>
<div class="form-group">
<label for="yorum_icerik">Yorum</label>
<textarea class="form-control" id="yorum_icerik" rows="5" name="yorum_icerik"><?php echo html_escape($yorumlar->yorum_icerik); ?></textarea>
</div>
<div class="form-group">
<label for="yorum_durum">Onaylı mı?</label>
<select class="form-control" id="yorum_durum" name="yorum_durum">
<option value="1" <?php if($yorumlar->yorum_durum=="1"){echo "selected";}; ?>>Onaylı</option>
<option value="0" <?php if($yorumlar->yorum_durum=="0"){echo "selected";}; ?>>Onaysız</option>
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