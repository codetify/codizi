<li class="nav-item dropdown">
<a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
Türler
</a>
<div class="full-drop dropdown-menu" aria-labelledby="navbarDropdown">
<?php foreach($kategoriler as $ktg) { ?>
<div class="col-6 float-left">
<a class="dropdown-item" href="<?php echo base_url("kategori/$ktg->kategori_url"); ?>"><?php echo $ktg->kategori_adi; ?></a>
</div>
<?php } ?>
<div class="temizle"></div>
</div>
</li>
<li class="nav-item"><a class="nav-link" href="<?php echo base_url("en-cok-izlenenler");?>">En Çok İzlenenler</a></li>
<li class="nav-item"><a class="nav-link" href="<?php echo base_url("en-cok-begenilenler");?>"">En Çok Beğenilenler</a></li>
<li class="nav-item"><a class="nav-link" href="<?php echo base_url("iletisim");?>">İletişim</a></li>