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
<li class="breadcrumb-item active">Reklamlar</li>
</ol>
<div class="card mb-3">
<div class="card-header">
<i class="fa fa-credit-card"></i> Reklamlar</div>
<div class="card-body">
<div class="table-responsive">
<table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
<thead>
<tr>
<th>Reklam Türü</th>
<th>Durum</th>

<th>İşlemler</th>
</tr>
</thead>
<tfoot>
<tr>
<th>Reklam Türü</th>
<th>Durum</th>
<th>İşlemler</th>
</tr>
</tfoot>
<tbody>
<?php foreach ($list as $row) { ?>
<tr>
<td>
<?php
if($row->reklam_tipi=='video_onu'){$reklam_tipi='Video Önü Reklam';}
elseif($row->reklam_tipi=='video_alt'){$reklam_tipi='Video Altı Reklam';}
elseif($row->reklam_tipi=='sag_blok_423_250'){$reklam_tipi='Sağ Blok 423 * 250 Reklam';}
elseif($row->reklam_tipi=='alt_sabit_728_90'){$reklam_tipi='Alt Sabit 728 * 90 Reklam';}
else{$reklam_tipi='Seçilmemiş';}
echo $reklam_tipi;
?>
</td>
<td><?php if($row->reklam_durum=="1") {echo "<span style='color:green;'>Aktif</span>";} else{echo "<span style='color:red;'>Aktif Değil</span>";} ?></td>
<td><a href="<?php echo base_url("admin/reklamlar/duzenle/$row->reklam_tipi"); ?>" class="btn btn-sm btn-secondary">Düzenle</a></td>
</tr>
<?php } ?>
</tbody>
</table>
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