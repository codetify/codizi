<meta charset="utf-8">
<meta http-equiv="x-ua-compatible" content="ie=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title><?php echo strip_tags($seo_title); ?></title>
<meta name="author" content="<?php echo $ayarlar->site_baslik; ?>" />
<meta name="robots" content="all"/>
<meta name="description" content="<?php echo strip_tags($seo_description); ?>">
<meta name="keywords" content="<?php echo strip_tags($seo_keywords); ?>">
<meta name="owner" content="<?php echo $ayarlar->site_baslik; ?>" />
<meta name="copyright" content="Copyright <?php echo $ayarlar->site_baslik; ?> - Tüm Hakları Saklıdır." />
<meta name="twitter:card" content="summary"/>
<meta name="twitter:site" content="@<?php echo $ayarlar->site_og_twitter; ?>"/>
<meta name="twitter:url" content="<?php echo $seo_url; ?>">
<meta name="twitter:title" content="<?php echo strip_tags($seo_title); ?>">
<meta name="twitter:description" content="<?php echo strip_tags($seo_description); ?>">
<meta name="twitter:image" content="<?php echo $seo_image; ?>">
<meta property="og:locale" content="tr_TR">
<meta property="og:title" content="<?php echo strip_tags($seo_title); ?>">
<meta property="og:site_name" content="<?php echo strip_tags($seo_title); ?>">
<meta property="og:url" content="<?php echo $seo_url; ?>">
<meta property="og:image" content="<?php echo $seo_image; ?>">
<meta property="og:image:width" content="150">
<meta property="og:image:height" content="150">
<meta property="og:description" content="<?php echo strip_tags($seo_description); ?>">
<link href="<?php echo base_url("assets/vendor/bootstrap/css/bootstrap.min.css"); ?>" rel="stylesheet">
<link href="<?php echo base_url("assets/css/blg.css"); ?>" rel="stylesheet">
<link href="<?php echo base_url("assets/css/imagehover.min.css"); ?>" rel="stylesheet">
<link href="<?php echo base_url("assets/css/font-awesome.min.css"); ?>" rel="stylesheet">
<link rel="icon" href="<?php echo base_url("uploads/$ayarlar->site_favicon"); ?>" type="image/x-icon" />
<script>var api_url = '<?php echo base_url('api'); ?>'; var bolumadet = <?php echo $ayarlar->anasayfa_bolum_sayisi; ?>; </script>