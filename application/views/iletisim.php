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
<ul class="navbar-nav ml-auto"><?php $this->load->view("menu"); ?></ul>
</div>
</div>
</nav>
<div class="container">
<br>
<div class="row">
<div class="col-lg-12">
<div class="card mb-4">
<div class="card-header">
İletişim Formu <strong class="iletisim_pass" style="float:right"><a href="<?php echo strip_tags($ayarlar->site_facebook); ?>" target="_blank"><i class="fa fa-facebook"></i></a> | <a href="<?php echo strip_tags($ayarlar->site_twitter); ?>" target="_blank"><i class="fa fa-twitter"></i></a> | <a href="<?php echo strip_tags($ayarlar->site_instagram); ?>" target="_blank"><i class="fa fa-instagram"></i></a> | <a href="<?php echo strip_tags($ayarlar->site_youtube); ?>" target="_blank"><i class="fa fa-youtube"></i></a> | <a href="<?php echo strip_tags($ayarlar->site_google_plus); ?>" target="_blank"><i class="fa fa-google-plus"></i></a></strong>
</div>
<div class="card-body">
<form action="<?php echo base_url("iletisim/gonder"); ?>" method="post">
<div class="form-group">
<label for="adsoyad">Adınız & Soyadınız</label>
<input type="text" name="adsoyad" class="form-control" id="adsoyad">
</div>
<div class="form-group">
<label for="email">E-Mail Adresiniz</label>
<input type="email" name="email" class="form-control" id="email">
<small class="form-text text-muted">Yazmış olduğunuz e-mail üzerinden iletişime geçilecektir.</small>
</div>
<div class="form-group">
<label for="konu">Konu</label>
<input type="text" name="konu" class="form-control" id="konu">
</div>
<div class="form-group">
<label for="mesaj">Mesajınız</label>
<textarea class="form-control" name="mesaj" id="mesaj" rows="5"></textarea>
</div>
<button type="submit" class="btn btn-primary">Gönder</button>
</form>
</div>
</div>
</div>
</div>
</div>
<footer class="footer bg-dark">
<div class="container">
<p class="m-2 text-center text-white" <?php if(empty($sayfalar)) { ?>style="line-height: 60px;height: 70px;bottom: 0;"><?php } ?>Copyright &copy; 2019 - <u><a target="_blank" class="text-white" href="https://desponres.ml/">Burak Dündar</a></u> tarafından ıssız gecelerde kodlanmıştır :)</p>
<?php if(!empty($sayfalar)) { ?>
<hr>
<div class="m-2 text-center text-white footer-nav">
<?php foreach($sayfalar as $syf) { ?>
| <a href="<?php echo base_url("sayfa/$syf->sayfa_url"); ?>" class="text-white"><?php echo $syf->sayfa_baslik; ?></a> |
<?php } ?>
</div>
<?php } ?>
</div>
</footer>
<?php $this->load->view("include/footer.php"); ?>
</body>
</html>