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
<div class="container-fluid">
<p class="alert alert-info"><?php echo $kategori_title; ?></p></div>
<?php foreach ($diziler as $row) { ?>
<?php
$metin = $row->dizi_baslik;
$uzunluk = strlen($metin);
$sinir = 25;
if ($uzunluk> $sinir) {
$dizi_baslik_v2 = substr($metin,0,$sinir)."...";
}
else if($uzunluk<$sinir){
$dizi_baslik_v2 = $metin;
}
?>
<div class="dizi-listesi col-sm-4 col-md-4 col-xs-6 col-xl-3 col-lg-4 mb-3">
<div style="height:450px;" class="card">
<?php if($row->dizi_resim){  ?>
<figure class="imghvr-zoom-in">
<figcaption style="background:#343a40;">
<strong style="font-size:14px;"><?php echo $dizi_baslik_v2; ?></strong>
<hr>
<p style="font-size:14px;"><?php echo strip_tags($row->kategori_adi); ?></p>
<hr>
<p style="font-size:14px;"><?php echo $row->dizi_tmdb; ?>/10</p>
<hr>
<p style="font-size:14px;"><?php echo $row->dizi_goruntulenme; ?> izlenme</p>
</figcaption>
<img class="card-img-top" height="310" src="<?php echo base_url("uploads/$row->dizi_resim"); ?>" alt="<?php echo $dizi_baslik_v2; ?>...">
<a href="<?php echo base_url("dizi/".$row->dizi_url); ?>"></a>
</figure>
<?php } ?>
<div class="card-body">
<strong class="card-title" style="float:left;position:relative;font-size:14px;font-weight:bold;"><?php echo $dizi_baslik_v2; ?></strong>
</div>
<div class="card-footer"><a href="<?php echo base_url("dizi/".$row->dizi_url); ?>" class="btn btn-primary" style="width:100%;">Dizi izle</a></div>
</div>
</div>
<?php } ?>
<div class="temizle"></div>
<nav>
<?php echo $this->pagination->create_links(); ?>
</nav>
</div>
<div class="col-md-4">
<div class="card my-4">
<h5 class="card-header">Dizi Ara</h5>
<div class="card-body">
<form action="<?php echo base_url("arama"); ?>">
<div class="input-group">
<input type="text" class="form-control" name="q" placeholder="Dizi adı veya TMDb id ile ara..." required>
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
<h5 class="card-header">Dizi Türleri</h5>
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
