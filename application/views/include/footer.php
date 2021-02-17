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
<script src="<?php echo base_url("assets/js/sweetalert2.all.js"); ?>"></script>
<?php $this->load->view("admin/alert"); ?>
<script src="<?php echo base_url("assets/js/app.js"); ?>"></script>