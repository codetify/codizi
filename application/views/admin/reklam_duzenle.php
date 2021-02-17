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
<link href="<?php echo base_url("assets/plugins/jquery-ui-1.12.1.custom/jquery-ui.min.css"); ?>" rel="stylesheet">
<link href="<?php echo base_url("assets/plugins/datetimepicker/jquery-ui-timepicker-addon.min.css"); ?>" rel="stylesheet">
</head>
<body class="fixed-nav sticky-footer bg-dark sidenav-toggled" id="page-top">
<?php $this->load->view("admin/menu");?>
<div class="content-wrapper">
<div class="container-fluid">
<ol class="breadcrumb">
<li class="breadcrumb-item">
<a href="<?php echo base_url("yonetim/anasayfa"); ?>">Panel</a>
</li>
<li class="breadcrumb-item active">Reklam Düzenle</li>
</ol>
<div class="card mb-3">
<div class="card-header">
<i class="fa fa-credit-card"></i> Reklam Düzenle</div>
<div class="card-body">
<form action="<?php echo base_url("admin/reklamlar/duzenle/update/$reklamlar->reklam_tipi"); ?>" method="post">
<div class="form-group">
<label for="reklam_tipi">Reklam Tipi</label>
<input type="text" class="form-control" id="reklam_tipi" name="reklam_tipi"
value="<?php
if($reklamlar->reklam_tipi=='video_onu'){$reklam_tipi='Video Önü Reklam';}
elseif($reklamlar->reklam_tipi=='video_alt'){$reklam_tipi='Video Altı Reklam';}
elseif($reklamlar->reklam_tipi=='sag_blok_423_250'){$reklam_tipi='Sağ Blok 423 * 250 Reklam';}
elseif($reklamlar->reklam_tipi=='alt_sabit_728_90'){$reklam_tipi='Alt Sabit 728 * 90 Reklam';}
else{$reklam_tipi='Seçilmemiş';}
echo $reklam_tipi;
?>" disabled>
</div>
<div class="form-group">
<label for="reklam_kodu">Reklam Kodu</label>
<textarea rows="5" class="form-control" id="reklam_kodu" name="reklam_kodu"><?php echo $reklamlar->reklam_kodu; ?></textarea>
</div>
<div class="form-group">
<label for="reklam_durum">Onaylı mı?</label>
<select class="form-control" id="reklam_durum" name="reklam_durum">
<option value="1" <?php if($reklamlar->reklam_durum=="1"){echo "selected";}; ?>>Onaylı</option>
<option value="0" <?php if($reklamlar->reklam_durum=="0"){echo "selected";}; ?>>Onaysız</option>
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
<script src="<?php echo base_url("assets/plugins/jquery-ui-1.12.1.custom/jquery-ui.min.js"); ?>"></script>
<script src="<?php echo base_url("assets/a/vendor/bootstrap/js/bootstrap.bundle.min.js"); ?>"></script>
<script src="<?php echo base_url("assets/a/vendor/jquery-easing/jquery.easing.min.js"); ?>"></script>
<script src="<?php echo base_url("assets/a/vendor/datatables/jquery.dataTables.js"); ?>"></script>
<script src="<?php echo base_url("assets/a/vendor/datatables/dataTables.bootstrap4.js"); ?>"></script>
<script src="<?php echo base_url("assets/a/js/sb-admin.js"); ?>"></script>
<script src="<?php echo base_url("assets/a/js/sb-admin-datatables.min.js"); ?>"></script>
<script src="<?php echo base_url("assets/js/sweetalert2.all.js"); ?>"></script>
<?php $this->load->view("admin/alert"); ?>
<script src="<?php echo base_url("assets/plugins/datetimepicker/jquery-ui-timepicker-addon.min.js"); ?>"></script>
<script type="text/javascript">
$(document).ready(function() {
$('#reklam_baslangic_tarihi').datetimepicker();
$('#reklam_bitis_tarihi').datetimepicker();
});
</script>
</html>