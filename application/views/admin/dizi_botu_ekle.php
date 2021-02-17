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
<li class="breadcrumb-item active">TMDb Dizi Botu ile Dizi Ekle</li>
</ol>
<div class="card mb-3">
<div class="card-header">
<i class="fa fa-sticky-note"></i> TMDb Dizi Botu ile Dizi Ekle
<a class="btn btn-sm btn-outline-primary" href="<?php echo base_url("admin/diziler/ekle"); ?>" style="float:right;text-decoration: none;"><i class="fa fa-plus-circle"></i> Yeni Ekle</a>
<a class="btn btn-sm btn-outline-success" href="<?php echo base_url("admin/dizi-botu"); ?>" style="position:relative;right:5px;float:right;text-decoration: none;">Dizi Botu</a>
</div>
<div class="card-body">
<form action="<?php echo base_url("admin/dizi-botu/ekle"); ?>" method="post" enctype="multipart/form-data">
<input type="hidden" name="yazar" value="<?php $user = $this->session->userdata("user"); echo $user["id"]; ?>">
<div class="form-group">
<label for="baslik">Dizi Adı</label>
<input type="text" class="form-control" id="baslik" name="baslik" value="<?php echo $dizi_baslik; ?>">
</div>
<div class="form-group">
<label for="tmdb">TMDb ID</label>
<input type="text" class="form-control" id="tmdb" name="tmdb" value="<?php echo $tmdb_id; ?>">
</div>
<div class="form-group">
<label for="url">Kısa URL (Boş bırakırsanız, otomatik olarak oluşturulur)</label>
<input type="text" class="form-control" id="url" name="url">
</div>
<div class="form-row">
<div class="form-group col-md-4">
<label for="yil">Dizinin Yılı</label>
<select class="form-control" id="yil" name="yil">
<?php $dizi_tarih_ex = explode ("-",$dizi_tarih); ?>
<option value="<?php print_r($dizi_tarih_ex[0]); ?>"><?php print_r($dizi_tarih_ex[0]); ?></option>
</select>
</div>
<div class="form-group col-md-4">
<label for="dk">Dizi Kaç Dakika?</label>
<input type="text" class="form-control" id="dk" name="dk" value="<?php echo $dizi_sure; ?>">
</div>
<div class="form-group col-md-4">
<label for="tmdb_puan">TMDb Puanı</label>
<input type="text" class="form-control" id="tmdb_puan" name="tmdb_puan" value="<?php echo $dizi_tmdb_puan; ?>">
</div>
</div>
<div class="form-group">
<label for="kategori">Dizi Kategorisi (Burada yazılı olan kategorilerden yalnızca 1 tanesini aşağıdaki seçeneklerden seçiniz)</label>
<input type="text" value="<?php print_r($dizi_tur); ?>" class="form-control" disabled>
</div>
<div class="form-group">
<label for="kategori">Kategori Seçiniz</label>
<select class="form-control" id="kategori" name="kategori">
<?php foreach ($list as $row) { ?>
<option value="<?php echo $row->id; ?>"><?php echo $row->kategori_adi; ?></option>
<?php } ?>
</select>
</div>
<div class="form-group">
<label for="etiket">Etiketler (Etiketi giriniz ve virgüle basınız)</label>
<input type="text" class="form-control" id="etiket" name="etiket">
</div>
<div class="form-group">
<img width="250" height="300" src="http://image.tmdb.org/t/p/w600_and_h900_bestv2<?php echo $dizi_poster; ?>">
<input type="hidden" name="poster" value="http://image.tmdb.org/t/p/w600_and_h900_bestv2<?php echo $dizi_poster; ?>">
</div>
<div class="form-group">
<label for="icerik">Dizi Hakkında Bilgi</label>
<textarea rows="5" class="form-control" id="icerik" name="icerik"><?php echo $dizi_aciklama; ?></textarea>
</div>
<div class="form-group">
<label for="durum">Onaylı mı?</label>
<select class="form-control" id="durum" name="durum">
<option value="1">Onaylı</option>
<option value="0">Onaysız</option>
</select>
</div>
<div class="form-group">
<button type="submit" name="ekle" class="btn btn-primary">Kaydet</button>
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