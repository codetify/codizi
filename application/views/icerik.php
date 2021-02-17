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
<div class="col-lg-8">
<br>
<div id="like-msg" style="display: none"></div>
<div class="card">
<div class="card-header">
<form onsubmit="return false;" id="like-form" data-id="<?php echo $dizi_icerik->id; ?>"></form>
<strong><?php echo $dizi_icerik->dizi_baslik; ?> <a onclick="like('#like-form')"><i style="color:black;" class="float-right fa fa-heart"> <?php print_r($begeni_sayisi); ?></i></a> <i class="float-right fa fa-eye mr-2"> <?php echo $dizi_icerik->dizi_goruntulenme; ?></i></strong>
</div>
<div class="card-body">
<div class="dizi-ack row">
<div class="dizi-ack-sol col-md-3">
<img class="img-responsive" width="100%" src="<?php echo base_url("uploads/$dizi_icerik->dizi_resim"); ?>" alt="<?php echo $dizi_icerik->dizi_baslik; ?>">
</div>
<div class="dizi-ack-sag col-md-9">
<strong class="card-text" style="font-weight:normal;"><?php echo $dizi_icerik->dizi_icerik; ?></strong>

<div class="alert alert-primary mt-2" role="alert">
<strong>Dizi Yılı:</strong> <?php echo $dizi_icerik->dizi_yil; ?>
</div>
<div class="alert alert-primary" role="alert">
<strong>Kategori:</strong> <a style="text-decoration: none;" href="<?php echo base_url("kategori/".strip_tags($dizi_icerik->kategori_url)); ?>"><?php echo strip_tags($dizi_icerik->kategori_adi); ?></a>
</div>
<?php if(empty(!$dizi_etiketler)) { ?>
<div class="alert alert-primary" role="alert">
<strong>Etiketler:</strong>
<?php foreach ($dizi_etiketler as $etiket) : ?>
<a href="<?php echo base_url() . 'etiket/' . strip_tags($etiket->etiket_url); ?>">
<?php echo strip_tags($etiket->etiket); ?>
</a>
<?php endforeach; ?>
<div class="temizle"></div>
</div>
<?php } ?>
<div class="alert alert-primary" role="alert">
<strong>Dizinin Süresi:</strong> <?php echo $dizi_icerik->dizi_dk; ?> Dk.
</div>
<div class="alert alert-primary" role="alert">
<strong>TMDb Puanı:</strong> <?php echo $dizi_icerik->dizi_tmdb; ?>/10
</div>

</div>
</div>
<hr>
<p align="center"><?php if($video_alt_reklam->reklam_durum == '1'){echo $video_alt_reklam->reklam_kodu;}; ?></p>
<hr>
<?php
if(!empty($yorumlar)){ ?>
<h4><strong>"<?php echo $dizi_icerik->dizi_baslik; ?>" için yapılan yorumlar</strong></h4>
<hr>
<?php } else { ?>
<h4><strong>Bu dizi için henüz yorum yazılmamış, ilk yorumu sen yaz :)<br>Unutma! Yorumun dizi ile ilgili önemli bir detay içeriyorsa spoiler butonunu kullan!</strong></h4>
<hr>
<?php }
foreach ($yorumlar as $yorum) : ?>
<div class="yorum media mb-4">
<img class="d-flex mr-3 rounded-circle" src="<?php echo base_url("assets/images/user.png"); ?>" width="50" height="50">
<div class="media-body">
<h5 class="mt-0"><?php echo strip_tags($yorum->yorum_ad_soyad); ?></h5>
<?php if($yorum->yorum_spoiler == '1'){ ?>
<a href="#yrm_gizle" class="yrm_gizle btn btn-primary" id="yrm_gizle">Spoiler içeren yorumu görüntüle</a>
<a href="#yrm_goster" class="yrm_goster btn btn-primary" id="yrm_goster">Spoiler içeren yorumu gizle</a>
<div class="spoiler">
<p class="spoiler_yorum"><?php echo $yorum->yorum_icerik; ?></p>
</div>
<?php } else { echo $yorum->yorum_icerik; } ?>
</div>
</div>
<hr>
<?php endforeach; ?>
<div class="card my-4">
<h5 class="card-header">Yorum yaz: <small>(Unutma! Yorumun dizi ile ilgili önemli bir detay içeriyorsa spoiler butonunu kullan!)</small></h5>
<div class="card-body">
<form method="post" action="<?php echo base_url("yorum-ekle"); ?>">
<input type="hidden" name="i" value="<?php echo $dizi_icerik->id; ?>">
<input type="hidden" name="b" value="0">
<input type="hidden" name="s" value="0">
<input type="hidden" name="u" value="<?php echo $dizi_icerik->dizi_url; ?>">
<div class="form-group">
<input name="ad_soyad" type="text" class="form-control" placeholder="Ad & Soyad">
</div>
<div class="form-group">
<input name="email" type="text" class="form-control" placeholder="E-Mail Adresiniz">
<small class="form-text text-muted">E-Mail adresiniz yorumda gözükmeyecektir.</small>
</div>
<div class="form-group">
<input type="checkbox" class="form-control-input" id="spoiler" name="spoiler" value="1">
<label class="form-control-label" for="spoiler">Spoiler Butonu</label>
</div>
<div class="form-group">
<textarea name="icerik" class="form-control" rows="4" placeholder="Yorumunuz"></textarea>
</div>
<button type="submit" class="btn btn-primary">Gönder</button>
</form>
</div>
</div>
</div>
</div>
</div>
<div class="col-md-4">
<div class="card my-4">
<h5 class="card-header">Dizinin Bölümleri</h5>
<div class="card-body">
<div class="accordion" id="sezonlar">
<?php if($sezonlar){ ?>
<?php foreach($sezonlar as $sezon){ ?>
<div class="card">
<button class="btn btn-dark" type="button" data-toggle="collapse" data-target="#collapse<?php echo $sezon->sezon_id; ?>" aria-expanded="true" aria-controls="collapse<?php echo $sezon->sezon_id; ?>"><?php echo $sezon->sezon_baslik; ?></button>
    <div id="heading<?php echo $sezon->sezon_id; ?>">
        
        <div id="collapse<?php echo $sezon->sezon_id; ?>" class="collapse" aria-labelledby="heading<?php echo $sezon->sezon_id; ?>" data-parent="#sezonlar">
            <div class="card-body">
                <ul class="list-group">
                <?php 
                $bolumler = $this->bolumler_model->get_all(array("sezon_id" => $sezon->sezon_id));
                foreach($bolumler as $bolum){ ?>
                    <li class="list-group-item"><a href="<?php echo base_url("dizi/".$dizi_icerik->dizi_url."/izle/".$sezon->sezon_kod."/".$bolum->bolum_kod); ?>" style="color:#242424;text-decoration:none;"><?php echo $bolum->bolum_adi; ?> (<?php echo $bolum->bolum_baslik; ?>)</a></li>
                <?php } ?>
                </ul>
            </div>
        </div>
    </div>
</div>
<?php } ?>
<?php } else { ?>
<div class="alert alert-info">Henüz sezon eklenmemiş...</div>
<?php } ?>
</div>
</div>
</div>
<?php if($sag_blok_423_250->reklam_durum == '1'){ ?>
<div class="card my-4">
<?php echo $sag_blok_423_250->reklam_kodu; ?>
</div>
<?php } ?>
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
<?php $this->load->view("include/icerik_footer.php"); ?>
</body>
</html>
