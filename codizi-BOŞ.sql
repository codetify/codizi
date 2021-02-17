-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Anamakine: 127.0.0.1:3306
-- Üretim Zamanı: 17 Şub 2021, 15:13:52
-- Sunucu sürümü: 5.7.31
-- PHP Sürümü: 7.3.21

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Veritabanı: `codizi`
--

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `begeniler`
--

DROP TABLE IF EXISTS `begeniler`;
CREATE TABLE IF NOT EXISTS `begeniler` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `begeni_dizi_id` int(11) NOT NULL,
  `ip_adresi` text COLLATE utf8_turkish_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=170 DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;

--
-- Tablo döküm verisi `begeniler`
--

INSERT INTO `begeniler` (`id`, `begeni_dizi_id`, `ip_adresi`) VALUES
(167, 62, '::1'),
(168, 61, '::1'),
(169, 70, '::1');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `diziler`
--

DROP TABLE IF EXISTS `diziler`;
CREATE TABLE IF NOT EXISTS `diziler` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tmdb_id` text COLLATE utf8_turkish_ci NOT NULL,
  `dizi_baslik` varchar(255) COLLATE utf8_turkish_ci DEFAULT NULL,
  `dizi_url` varchar(255) COLLATE utf8_turkish_ci DEFAULT NULL,
  `dizi_icerik` longtext COLLATE utf8_turkish_ci,
  `dizi_resim` varchar(255) COLLATE utf8_turkish_ci DEFAULT NULL,
  `dizi_durum` int(1) DEFAULT NULL,
  `dizi_goruntulenme` int(11) DEFAULT NULL,
  `kategori_id` int(11) DEFAULT NULL,
  `yazar_id` int(11) DEFAULT NULL,
  `dizi_yil` int(11) NOT NULL,
  `dizi_dk` int(11) NOT NULL,
  `dizi_tmdb` varchar(11) COLLATE utf8_turkish_ci NOT NULL,
  `createdAt` datetime DEFAULT NULL,
  `updatedAt` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=72 DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;

--
-- Tablo döküm verisi `diziler`
--

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `dizi_bolum`
--

DROP TABLE IF EXISTS `dizi_bolum`;
CREATE TABLE IF NOT EXISTS `dizi_bolum` (
  `bolum_id` int(11) NOT NULL AUTO_INCREMENT,
  `rank` int(11) NOT NULL,
  `dizi_id` int(11) NOT NULL,
  `sezon_id` int(11) NOT NULL,
  `bolum_kod` int(11) NOT NULL,
  `bolum_adi` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `bolum_baslik` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `bolum_ozet` text COLLATE utf8_unicode_ci NOT NULL,
  `bolum_durum` int(1) NOT NULL,
  `bolum_izlenme_durum` int(1) DEFAULT '0',
  `bolum_tarih` date DEFAULT NULL,
  `createdAt` timestamp DEFAULT CURRENT_TIMESTAMP,
  `updatedAt` datetime DEFAULT NULL,
  PRIMARY KEY (`bolum_id`)
) ENGINE=MyISAM AUTO_INCREMENT=709 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Tablo döküm verisi `dizi_bolum`
--

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `dizi_kaynak`
--

DROP TABLE IF EXISTS `dizi_kaynak`;
CREATE TABLE IF NOT EXISTS `dizi_kaynak` (
  `kaynak_id` int(11) NOT NULL AUTO_INCREMENT,
  `dizi_id` int(11) NOT NULL,
  `sezon_id` int(11) NOT NULL,
  `bolum_id` int(11) NOT NULL,
  `kaynak_adi` varchar(50) COLLATE utf8_turkish_ci NOT NULL,
  `kaynak_icerik` text COLLATE utf8_turkish_ci NOT NULL,
  `kaynak_durum` int(1) NOT NULL,
  `createdAt` datetime DEFAULT NULL,
  `updatedAt` datetime DEFAULT NULL,
  PRIMARY KEY (`kaynak_id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;

--
-- Tablo döküm verisi `dizi_kaynak`
--

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `dizi_sezon`
--

DROP TABLE IF EXISTS `dizi_sezon`;
CREATE TABLE IF NOT EXISTS `dizi_sezon` (
  `sezon_id` int(11) NOT NULL AUTO_INCREMENT,
  `rank` int(11) NOT NULL,
  `dizi_id` int(11) NOT NULL,
  `sezon_kod` int(11) NOT NULL,
  `sezon_baslik` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `sezon_tarih` date DEFAULT NULL,
  `sezon_durum` int(1) NOT NULL,
  `sezon_izlenme_durum` int(1) NOT NULL DEFAULT '0',
  `createdAt` timestamp DEFAULT CURRENT_TIMESTAMP,
  `updatedAt` datetime DEFAULT NULL,
  PRIMARY KEY (`sezon_id`)
) ENGINE=MyISAM AUTO_INCREMENT=91 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Tablo döküm verisi `dizi_sezon`
--

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `etiketler`
--

DROP TABLE IF EXISTS `etiketler`;
CREATE TABLE IF NOT EXISTS `etiketler` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `dizi_id` int(11) NOT NULL,
  `etiket` varchar(255) COLLATE utf8_turkish_ci NOT NULL,
  `etiket_url` varchar(255) COLLATE utf8_turkish_ci NOT NULL,
  `createdAt` datetime DEFAULT NULL,
  `updatedAt` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=349 DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `genel_ayarlar`
--

DROP TABLE IF EXISTS `genel_ayarlar`;
CREATE TABLE IF NOT EXISTS `genel_ayarlar` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `site_title` text COLLATE utf8_turkish_ci NOT NULL,
  `site_baslik` varchar(255) COLLATE utf8_turkish_ci NOT NULL,
  `site_description` text COLLATE utf8_turkish_ci NOT NULL,
  `site_keywords` text COLLATE utf8_turkish_ci NOT NULL,
  `site_og_twitter` varchar(25) COLLATE utf8_turkish_ci NOT NULL,
  `site_logo` varchar(255) COLLATE utf8_turkish_ci NOT NULL,
  `site_favicon` varchar(255) COLLATE utf8_turkish_ci NOT NULL,
  `site_facebook` varchar(255) COLLATE utf8_turkish_ci NOT NULL,
  `site_twitter` varchar(255) COLLATE utf8_turkish_ci NOT NULL,
  `site_instagram` varchar(255) COLLATE utf8_turkish_ci NOT NULL,
  `site_youtube` varchar(255) COLLATE utf8_turkish_ci NOT NULL,
  `site_google_plus` varchar(255) COLLATE utf8_turkish_ci NOT NULL,
  `site_tmdb_api` text COLLATE utf8_turkish_ci NOT NULL,
  `anasayfa_dizi_sayisi` int(11) NOT NULL,
  `anasayfa_bolum_sayisi` int(11) NOT NULL,
  `anasayfa_etiket_sayisi` int(11) NOT NULL,
  `arama_dizi_sayisi` int(11) NOT NULL,
  `enckizlenen_dizi_sayisi` int(11) NOT NULL,
  `anasayfa_kategori_sayisi` int(11) NOT NULL,
  `updatedAt` datetime DEFAULT NULL,
  `guncelleyen_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;

--
-- Tablo döküm verisi `genel_ayarlar`
--

INSERT INTO `genel_ayarlar` (`id`, `site_title`, `site_baslik`, `site_description`, `site_keywords`, `site_og_twitter`, `site_logo`, `site_favicon`, `site_facebook`, `site_twitter`, `site_instagram`, `site_youtube`, `site_google_plus`, `site_tmdb_api`, `anasayfa_dizi_sayisi`, `anasayfa_bolum_sayisi`, `anasayfa_etiket_sayisi`, `arama_dizi_sayisi`, `enckizlenen_dizi_sayisi`, `anasayfa_kategori_sayisi`, `updatedAt`, `guncelleyen_id`) VALUES
(1, 'Codizi - Full HD Dizi İzleme', 'Codizi', 'Full HD Dizi İzle', 'dizi izle, full hd dizi izle, türkçe dublaj, türkçe izle', 'codetify', '602c42f198676Codizi.png', '602c430460986Codizi.png', 'https://www.facebook.com/#', 'https://www.twitter.com/#', 'https://www.instagram.com/#', 'https://www.youtube.com/#', 'https://plus.google.com/#', '', 12, 20, 12, 12, 4, 12, '2021-02-16 22:15:29', 1);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `iletisim`
--

DROP TABLE IF EXISTS `iletisim`;
CREATE TABLE IF NOT EXISTS `iletisim` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `gonderen_ad_soyad` varchar(255) COLLATE utf8_turkish_ci NOT NULL,
  `gonderen_email` varchar(255) COLLATE utf8_turkish_ci NOT NULL,
  `konu` text COLLATE utf8_turkish_ci NOT NULL,
  `mesaj` text COLLATE utf8_turkish_ci NOT NULL,
  `iletisim_durum` int(1) NOT NULL,
  `createdAt` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `kategoriler`
--

DROP TABLE IF EXISTS `kategoriler`;
CREATE TABLE IF NOT EXISTS `kategoriler` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `kategori_adi` varchar(255) COLLATE utf8_turkish_ci NOT NULL,
  `kategori_url` varchar(255) COLLATE utf8_turkish_ci NOT NULL,
  `kategori_durum` varchar(255) COLLATE utf8_turkish_ci NOT NULL,
  `yazar_id` int(11) NOT NULL,
  `createdAt` datetime DEFAULT NULL,
  `updatedAt` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=65 DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;

--
-- Tablo döküm verisi `kategoriler`
--

INSERT INTO `kategoriler` (`id`, `kategori_adi`, `kategori_url`, `kategori_durum`, `yazar_id`, `createdAt`, `updatedAt`) VALUES
(41, 'Aile', 'aile', '1', 1, '2021-02-13 09:01:53', '0000-00-00 00:00:00'),
(42, 'Aksiyon', 'aksiyon', '1', 1, '2021-02-13 09:02:10', '0000-00-00 00:00:00'),
(43, 'Animasyon', 'animasyon', '1', 1, '2021-02-13 09:02:19', '0000-00-00 00:00:00'),
(44, 'Anime', 'anime', '1', 1, '2021-02-13 09:02:25', '0000-00-00 00:00:00'),
(45, 'Belgesel', 'belgesel', '1', 1, '2021-02-13 09:02:30', '0000-00-00 00:00:00'),
(46, 'Bilim Kurgu', 'bilim-kurgu', '1', 1, '2021-02-13 09:02:33', '0000-00-00 00:00:00'),
(47, 'Biyografi', 'biyografi', '1', 1, '2021-02-13 09:02:37', '0000-00-00 00:00:00'),
(48, 'Dram', 'dram', '1', 1, '2021-02-13 09:02:40', '0000-00-00 00:00:00'),
(49, 'Fantastik', 'fantastik', '1', 1, '2021-02-13 09:02:45', '0000-00-00 00:00:00'),
(50, 'Gençlik', 'genclik', '1', 1, '2021-02-13 09:02:48', '0000-00-00 00:00:00'),
(51, 'Gerilim', 'gerilim', '1', 1, '2021-02-13 09:02:52', '0000-00-00 00:00:00'),
(52, 'Gizem', 'gizem', '1', 1, '2021-02-13 09:02:55', '0000-00-00 00:00:00'),
(53, 'Komedi', 'komedi', '1', 1, '2021-02-13 09:03:01', '0000-00-00 00:00:00'),
(54, 'Korku', 'korku', '1', 1, '2021-02-13 09:03:04', '0000-00-00 00:00:00'),
(55, 'Macera', 'macera', '1', 1, '2021-02-13 09:03:07', '0000-00-00 00:00:00'),
(56, 'Mini Dizi', 'mini-dizi', '1', 1, '2021-02-13 09:03:10', '0000-00-00 00:00:00'),
(57, 'Müzikal', 'muzikal', '1', 1, '2021-02-13 09:03:13', '0000-00-00 00:00:00'),
(58, 'Polisiye', 'polisiye', '1', 1, '2021-02-13 09:03:17', '0000-00-00 00:00:00'),
(59, 'Romantik', 'romantik', '1', 1, '2021-02-13 09:03:21', '0000-00-00 00:00:00'),
(60, 'Savaş', 'savas', '1', 1, '2021-02-13 09:03:23', '0000-00-00 00:00:00'),
(61, 'Spor', 'spor', '1', 1, '2021-02-13 09:03:27', '0000-00-00 00:00:00'),
(62, 'Suç', 'suc', '1', 1, '2021-02-13 09:03:30', '0000-00-00 00:00:00'),
(63, 'Tarih', 'tarih', '1', 1, '2021-02-13 09:03:33', '0000-00-00 00:00:00'),
(64, 'Western', 'western', '1', 1, '2021-02-13 09:03:36', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `reklamlar`
--

DROP TABLE IF EXISTS `reklamlar`;
CREATE TABLE IF NOT EXISTS `reklamlar` (
  `reklam_tipi` varchar(50) COLLATE utf8_turkish_ci NOT NULL,
  `reklam_kodu` longtext COLLATE utf8_turkish_ci NOT NULL,
  `reklam_durum` int(1) NOT NULL,
  `createdAt` datetime DEFAULT NULL,
  `updatedAt` datetime DEFAULT NULL,
  PRIMARY KEY (`reklam_tipi`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;

--
-- Tablo döküm verisi `reklamlar`
--

INSERT INTO `reklamlar` (`reklam_tipi`, `reklam_kodu`, `reklam_durum`, `createdAt`, `updatedAt`) VALUES
('alt_sabit_728_90', '<img src=\"https://demo.codetify.net/codizi/assets/images/reklam_728x90.png\">', 0, '2019-03-03 18:20:56', NULL),
('sag_blok_423_250', '<img src=\"https://demo.codetify.net/codizi/assets/images/reklam_423x250.png\">', 0, '2019-03-03 16:13:06', NULL),
('video_alt', '<img src=\"https://demo.codetify.net/codizi/assets/images/reklam_728x90.png\">', 1, '2019-03-03 14:22:51', NULL),
('video_onu', '<img src=\"https://demo.codetify.net/codizi/assets/images/reklam_300x250.png\">', 0, '2019-03-03 14:17:34', '2019-03-03 18:20:56');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `sayfalar`
--

DROP TABLE IF EXISTS `sayfalar`;
CREATE TABLE IF NOT EXISTS `sayfalar` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sayfa_baslik` varchar(255) COLLATE utf8_turkish_ci NOT NULL,
  `sayfa_url` varchar(255) COLLATE utf8_turkish_ci NOT NULL,
  `sayfa_icerik` longtext COLLATE utf8_turkish_ci NOT NULL,
  `sayfa_durum` int(11) NOT NULL,
  `yazar_id` int(11) NOT NULL,
  `goruntulenme_sayisi` varchar(255) COLLATE utf8_turkish_ci NOT NULL,
  `createdAt` datetime DEFAULT NULL,
  `updatedAt` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;

--
-- Tablo döküm verisi `sayfalar`
--

INSERT INTO `sayfalar` (`id`, `sayfa_baslik`, `sayfa_url`, `sayfa_icerik`, `sayfa_durum`, `yazar_id`, `goruntulenme_sayisi`, `createdAt`, `updatedAt`) VALUES
(4, 'Hakkımızda', 'hakkimizda', '<p>Hakkımızda buraya gelecek :)</p>\r\n', 1, 1, '', '2018-12-31 17:33:35', '2019-03-03 18:20:56'),
(5, 'Gizlilik Politikası', 'gizlilik-politikasi', '<p>Gizlilik :D</p>\r\n', 1, 1, '', '2019-03-30 15:16:15', '2019-03-03 18:20:56'),
(6, 'Hukuksal', 'hukuksal', '<p>Hukuksal :D</p>\r\n', 1, 1, '', '2019-03-30 15:16:52', '2019-03-03 18:20:56');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `uyeler`
--

DROP TABLE IF EXISTS `uyeler`;
CREATE TABLE IF NOT EXISTS `uyeler` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ad_soyad` varchar(100) COLLATE utf8_turkish_ci NOT NULL,
  `email` varchar(100) COLLATE utf8_turkish_ci NOT NULL,
  `telefon` varchar(15) COLLATE utf8_turkish_ci NOT NULL,
  `cinsiyet` int(1) NOT NULL,
  `sifre` varchar(100) COLLATE utf8_turkish_ci NOT NULL,
  `isActive` int(1) NOT NULL,
  `user_role` int(1) NOT NULL,
  `ekleyen_id` int(11) NOT NULL,
  `createdAt` datetime DEFAULT NULL,
  `updatedat` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;

--
-- Tablo döküm verisi `uyeler`
--

INSERT INTO `uyeler` (`id`, `ad_soyad`, `email`, `telefon`, `cinsiyet`, `sifre`, `isActive`, `user_role`, `ekleyen_id`, `createdAt`, `updatedat`) VALUES
(1, 'Codetify Demo', 'demo@codetify.net', '05555555555', 1, '25f9e794323b453885f5181f1b624d0b', 1, 4, 1, '2018-07-28 07:50:11', '2019-03-03 18:20:56');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `yorumlar`
--

DROP TABLE IF EXISTS `yorumlar`;
CREATE TABLE IF NOT EXISTS `yorumlar` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `dizi_id` int(11) NOT NULL,
  `sezon_id` int(11) NOT NULL,
  `bolum_id` int(11) NOT NULL,
  `yorum_ad_soyad` varchar(255) COLLATE utf8_turkish_ci NOT NULL,
  `yorum_email` varchar(255) COLLATE utf8_turkish_ci NOT NULL,
  `yorum_icerik` longtext COLLATE utf8_turkish_ci NOT NULL,
  `yorum_durum` int(1) NOT NULL,
  `yorum_spoiler` int(1) DEFAULT '0',
  `createdAt` datetime DEFAULT NULL,
  `updatedAt` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;

--
-- Tablo döküm verisi `yorumlar`
--

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
