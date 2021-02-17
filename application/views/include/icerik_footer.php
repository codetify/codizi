<?php if($alt_sabit_728_90->reklam_durum == '1'){ ?>
<!-- footer reklam -->
<div class="iframekapat" id="footer_728_reklam" style="position:fixed; bottom:0; color=#fff;z-index: 9999;margin-left: 90px;display:none;">
<a href="#" class="reklami_kapat" style="color:#FFFFFF;background: #000;">Reklamı Kapat</a>
<div id="clearfix"></div>
<?php echo $alt_sabit_728_90->reklam_kodu; ?></div>
<!-- footer reklam -->
<?php } ?>
<!-- Footer -->
<footer class="footer bg-dark">
<div class="container">
<p class="m-2 text-center text-white" <?php if(empty($sayfalar)) { ?>style="line-height: 60px;height: 70px;bottom: 0;"<?php } ?>>Copyright 2019 - <?php echo date("Y")?> | Yazılım: <a target="_blank" class="text-white" href="https://codetify.com.tr/">Codetify</a></p>
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
<script src="<?php echo base_url("assets/vendor/jquery/jquery.min.js"); ?>"></script>
<script src="<?php echo base_url("assets/vendor/bootstrap/js/bootstrap.bundle.min.js"); ?>"></script>
<script src="<?php echo base_url("assets/js/app.js"); ?>"></script>
<script type="text/javascript">
$(function(){
var saniye = 10;
$.geriyeSay = function(){
if (saniye > 1){
saniye--;
$("#kalansure").text(saniye);
} else {
$("#dizi-tab .tab-reklam").hide();
$("#dizi-tab .tab-embed").show();
}
}
$("#kalansure").text(saniye);
setInterval("$.geriyeSay()", 1000);

$('.rkapat').click(function(){
$("#dizi-tab .tab-reklam").hide();
$("#dizi-tab .tab-embed").show();
});
});
</script>
<script type="text/javascript">
$(document).ready(function(){
<?php foreach($dizi_kaynak as $dizi_kynk){ ?>
$("#kynk_<?php echo $dizi_kynk->kaynak_id; ?>").click(function(){
var alert=$("#kynk_<?php echo $dizi_kynk->kaynak_id; ?>").html();
$("#dizi_alert").html(alert);
});
<?php } ?>
});
</script>
<script src="<?php echo base_url("assets/js/sweetalert2.all.js"); ?>"></script>
<?php $this->load->view("admin/alert"); ?>
<script>
jQuery(".reklami_kapat").click(function(e){
e.preventDefault();
jQuery("#footer_728_reklam").css("display","none");
});
</script>
<script type="text/javascript">
var iframekapat=false;
if(iframekapat){
jQuery(".iframekapat").remove();
}else{
jQuery(".iframekapat").css('display','');
}
</script>