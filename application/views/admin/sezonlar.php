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
<li class="breadcrumb-item active">Sezonlar</li>
</ol>
<div class="card mb-3">
<div class="card-header">
<i class="fa fa-sticky-note"></i> <?php echo $dizi->dizi_baslik; ?> isimli diziye ait sezonlar
<a class="btn btn-sm btn-outline-primary" href="<?php echo base_url("admin/diziler/sezonlar/ekle/$dizi->id"); ?>" style="float:right;text-decoration: none;"><i class="fa fa-plus-circle"></i> Yeni Sezon Ekle</a>
<a class="btn btn-sm btn-outline-dark mr-1" href="<?php echo base_url("admin/diziler/sezonlar/$dizi->id/bot"); ?>" style="float:right;text-decoration: none;">Sezonları Çek</a>
</div>
<div class="card-body">
<div class="table-responsive">
<table class="table table-hover table-striped table-bordered content-container" width="100%" cellspacing="0">
<thead>
<tr>
<th class="order"><i class="fa fa-reorder"></i></th>
<th>Dizi Adı</th>
<th>Sezon Adı</th>
<th>Sezon Tarihi</th>
<th>Durum</th>
<th>Eklenme T.</th>
<th>İşlemler</th>
</tr>
</thead>
<tfoot>
<tr>
<th class="order"><i class="fa fa-reorder"></i></th>
<th>Dizi Adı</th>
<th>Sezon Adı</th>
<th>Sezon Tarihi</th>
<th>Durum</th>
<th>Eklenme T.</th>
<th>İşlemler</th>
</tr>
</tfoot>
<tbody class="sortable" data-url="<?php echo base_url("admin/diziler/sezonlar/sirala"); ?>">
<?php foreach ($list as $row) { ?>
<tr id="ord-<?php echo $row->sezon_id; ?>">
<td class="order"><i class="fa fa-reorder"></i></td>
<td><?php echo $dizi->dizi_baslik; ?></td>
<td><span class="badge badge-info"><?php echo $row->sezon_baslik; ?></span></td>
<td><span class="badge badge-info"><?php echo $row->sezon_tarih; ?></span></td>
<td><?php if($row->sezon_durum=="1") {echo "<span style='color:green;'>Aktif</span>";} else{echo "<span style='color:red;'>Aktif Değil</span>";} ?></td>
<td><?php echo $row->createdAt; ?></td>
<td><a href="<?php echo base_url("admin/diziler/bolumler/$row->sezon_id"); ?>" class="btn btn-sm btn-info">Bölümler</a> <a href="<?php echo base_url("admin/diziler/sezonlar/duzenle/$row->sezon_id"); ?>" class="btn btn-sm btn-secondary">Düzenle</a> <a href="<?php echo base_url("admin/diziler/sezon-sil/$row->sezon_id"); ?>" class="btn btn-sm btn-danger">Sil</a></td>
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
<script src="<?php echo base_url("assets/a/vendor/jquery/jquery.min.js"); ?>"></script>
<script src="<?php echo base_url("assets/a/js/jquery-ui.min.js"); ?>"></script>
<script src="<?php echo base_url("assets/a/vendor/bootstrap/js/bootstrap.bundle.min.js"); ?>"></script>
<script src="<?php echo base_url("assets/a/vendor/jquery-easing/jquery.easing.min.js"); ?>"></script>
<script src="<?php echo base_url("assets/a/vendor/datatables/jquery.dataTables.js"); ?>"></script>
<script src="<?php echo base_url("assets/a/vendor/datatables/dataTables.bootstrap4.js"); ?>"></script>
<script src="<?php echo base_url("assets/a/js/sb-admin.js"); ?>"></script>
<script src="<?php echo base_url("assets/a/js/sb-admin-datatables.min.js"); ?>"></script>
<script src="<?php echo base_url("assets/js/sweetalert2.all.js"); ?>"></script>
<?php $this->load->view("admin/alert"); ?>
<script src="<?php echo base_url("assets/a/js/sort-main.js"); ?>"></script>
</div>
</body>
</html>