<!DOCTYPE html>
<html lang="tr">
<head>
<?php $this->load->view("include/header.php"); ?>
</head>
<body>
<nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top">
<div class="container-fluid">
<a class="navbar-brand" href="<?php echo base_url();?>"><?php echo strip_tags($ayarlar->site_title); ?></a>
<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
<span class="navbar-toggler-icon"></span>
</button>
<div class="collapse navbar-collapse" id="navbarResponsive">
<ul class="navbar-nav ml-auto">
<?php $this->load->view("menu"); ?>
</ul>
</div>
</div>
</nav>
<div class="container-fluid">
<div class="row">
<div class="col-md-8">
<h3 class="my-4"></h3>
<div class="card">
<div class="card-header"><?php echo $sayfa_title; ?></div>
<div class="card-body">
<?php echo $sayfa_icerik; ?>
</div>
</div>
</div>
<div class="col-md-4">
<div class="card my-4">
<h5 class="card-header">Film Ara</h5>
<div class="card-body">
<form action="<?php echo base_url("arama"); ?>">
<div class="input-group">
<input type="text" class="form-control" name="q" placeholder="Film adı veya TMDb id ile ara..." required>
<button class="btnara btn btn-secondary" type="submit">Ara!</button>
</div>
</form>
</div>
</div>
<?php if($sag_blok_423_250->reklam_durum == '1'){ ?>
<div class="card my-4">
<?php echo $sag_blok_423_250->reklam_kodu; ?>
</div>
<?php } ?>
<div class="card my-4">
<h5 class="card-header">Kategoriler</h5>
<div class="card-body">
<div class="row">
<div class="ktgrlg col-lg-6">
<ul class="ktgr list-unstyled mb-0">
<?php foreach($kategoriler as $ktg) { ?>
<li><i class="fa fa-angle-double-right"></i> <a href="<?php echo base_url("kategori/$ktg->kategori_url"); ?>"><?php echo $ktg->kategori_adi; ?></a></li>
<?php } ?>
</ul>
</div>
</div>
</div>
</div>
<?php $this->load->view("enckizlenenler"); ?>
</div>
</div>
</div>
<?php $this->load->view("include/footer.php"); ?>
</body>
</html>