<?php

?>
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
<div class="card">
<div class="card-header">
<strong><a href="<?php echo base_url("dizi/$dizi_icerik->dizi_url"); ?>" style="text-decoration:none;color:#424242;"><?php echo $dizi_icerik->dizi_baslik; ?></a> - <?php echo $sezon_kod; ?>.Sezon <?php echo $bolum_kod; ?>.Bölüm izle</strong>
</div>
<div class="card-body">
<?php echo $bolum->bolum_ozet; ?>
<hr>
<?php foreach($dizi_kaynak as $dizi_kynk){ ?>
<a target="dizi_vd" id="kynk_<?php echo $dizi_kynk->kaynak_id; ?>" href="<?php echo $dizi_kynk->kaynak_icerik; ?>" class="btn btn-outline-success"><?php echo $dizi_kynk->kaynak_adi; ?></a>
<?php } ?>
<hr>
<div class="alert alert-primary"><?php if(!empty($dizi_kaynak)){ ?> Şuan <strong id="dizi_alert"><?php echo $dizi_kaynak[0]->kaynak_adi; ?></strong> kaynağından izlemektesiniz.<?php } else { echo "Henüz hiç bir kaynak eklenmemiş veya kaynaklar uçup gitmiş. En kısa zamanda güncellenecektir."; }?></div>
<?php if($video_onu_reklam->reklam_durum == '1'){?>
<div id="dizi-tab">
<div id="video" class="tab-icerik">
<div class="tab-reklam">
<div class="tab-reklam-yoksa">
<div class="reklam-logo" <?php if($video_onu_reklam->reklam_durum == '0'){?>style="background:url(<?php echo base_url("assets/images/rek.png"); ?>) no-repeat center transparent;"<?php } ?>><p align="center"><?php if($video_onu_reklam->reklam_durum == '1'){echo $video_onu_reklam->reklam_kodu;}; ?></p></div>
<div class="yoksa">
<div class="loading">
<span class="sure" id="kalansure"></span>
<span class="rkapat"> Reklamı Geç </span>
</div>
</div>
</div>
</div>
<div class="tab-embed">
<?php if(!empty($dizi_kaynak)){ ?>
<iframe
id="dizi_vd"
name="dizi_vd"
width="100%"
height="500"
src="<?php echo $dizi_kaynak[0]->kaynak_icerik; ?>"
frameborder="0"
></iframe>
<?php } ?>
</div>
</div>
<div class="temiz"></div>
</div>
<?php } else { ?>
<?php if(!empty($dizi_kaynak)){ ?>
<iframe
id="dizi_vd"
name="dizi_vd"
width="100%"
height="500"
src="<?php echo $dizi_kaynak[0]->kaynak_icerik; ?>"
frameborder="0"
></iframe>
<?php } } ?>
<hr>
<p align="center"><?php if($video_alt_reklam->reklam_durum == '1'){echo $video_alt_reklam->reklam_kodu;}; ?></p>
<hr>
<?php
if(!empty($yorumlar)){ ?>
<h4><strong>"<a href="<?php echo base_url("dizi/$dizi_icerik->dizi_url"); ?>" style="text-decoration:none;color:#424242;"><?php echo $dizi_icerik->dizi_baslik; ?></a> - <?php echo $sezon_kod; ?>.Sezon <?php echo $bolum_kod; ?>.Bölüm" için yapılan yorumlar</strong></h4>
<hr>
<?php } else { ?>
<h4><strong>Bu bölüm için henüz yorum yazılmamış, ilk yorumu sen yaz :)<br>Unutma! Yorumun bölüm ile ilgili önemli bir detay içeriyorsa spoiler butonunu kullanmayı unutma :)</strong></h4>
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
<h5 class="card-header">Yorum yaz:</h5>
<div class="card-body">
<form method="post" action="<?php echo base_url("yorum-ekle"); ?>">
<input type="hidden" name="i" value="<?php echo $dizi_icerik->id; ?>">
<input type="hidden" name="b" value="<?php echo $bolum->bolum_id; ?>">
<input type="hidden" name="s" value="<?php echo $sezon->sezon_id; ?>">
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
<label class="form-control-label" for="spoiler">Yorumunuz spoiler içeriyorsa buraya tıklatın :)</label>
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
<?php foreach($sezonlar as $sezon){ ?>
<div class="card">
<button class="btn btn-dark" type="button" data-toggle="collapse" data-target="#collapse<?php echo $sezon->sezon_id; ?>" aria-expanded="true" aria-controls="collapse<?php echo $sezon->sezon_id; ?>"><?php echo $sezon->sezon_baslik; ?></button>
    <div id="heading<?php echo $sezon->sezon_id; ?>">
        <div id="collapse<?php echo $sezon->sezon_id; ?>" class="collapse<?php if($sezon->sezon_kod == $sezon_kod){ echo " show"; } ?>" aria-labelledby="heading<?php echo $sezon->sezon_id; ?>" data-parent="#sezonlar">
            <div class="card-body">
                <ul class="list-group">
                <?php 
                $bolumler = $this->bolumler_model->get_all(array("sezon_id" => $sezon->sezon_id));
                foreach($bolumler as $bolum){ $bolum_ex_code = "S".$sezon->sezon_kod."B".$bolum->bolum_kod; $bolum_ex_codev2 = "S".$sezon_kod."B".$bolum_kod;?>
                    <li class="list-group-item"<?php if($bolum_ex_code == $bolum_ex_codev2){ ?> style="background:#242424;color:#fff;"<?php } ?>><a href="<?php echo base_url("dizi/".$dizi_icerik->dizi_url."/izle/".$sezon->sezon_kod."/".$bolum->bolum_kod); ?>" <?php if($bolum_ex_code == $bolum_ex_codev2){ ?> style="color:#fff;text-decoration:none;"<?php } else { ?> style="color:#242424;text-decoration:none;"<?php } ?>><?php echo $bolum->bolum_adi; ?> (<?php echo $bolum->bolum_baslik; ?>)</a></li>
                <?php } ?>
                </ul>
            </div>
        </div>
    </div>
</div>
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
