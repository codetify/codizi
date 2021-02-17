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

INSERT INTO `diziler` (`id`, `tmdb_id`, `dizi_baslik`, `dizi_url`, `dizi_icerik`, `dizi_resim`, `dizi_durum`, `dizi_goruntulenme`, `kategori_id`, `yazar_id`, `dizi_yil`, `dizi_dk`, `dizi_tmdb`, `createdAt`, `updatedAt`) VALUES
(1, '1622', 'Supernatural', 'supernatural', 'Anneleri kendileri daha çocukken doğaüstü bir varlık tarafından öldürülen kardeşler babaları tarafından avcı olarak yetiştirilirler... Av ise annelerini öldüren gibi doğaüstü varlıklardır...\r\n\r\nDean, ailesine dolayısı ile babasına çok bağlıdır. Sam ise tam tersine babasından, kardeşinden ve avcılıktan uzaklaşmak ister...\r\n\r\nBirkaç yıl sonra Dean, Sam\'in kız arkadaşı Jessica ile yaşadığı eve gider ve Sam\'e babalarının ortadan kaybolduğunu ve onu bulamadığını söyler. İkili babalarını bulmak için yola koyulurlar...', 'supernatural_cover.png', 1, 40, 48, 1, 2021, 45, '8', '2021-02-13 08:36:41', '2021-02-14 12:32:26'),
(61, '63174', 'Lucifer', 'lucifer', '“Cehennem Lordu” Lucifer Morningstar; Los Angeles Polis Departmanı için suçluları yakalamaktadır. Ancak büyük bir sırrı vardır: Bu çekici adam, aslında yeryüzüne düşmüş bir melektir! Neil Gaiman tarafından yaratılan Lucifer, Sandman isimli serinin yardımcı karakterlerinden biriydi ve daha sonra kendi çizgi romanına kavuştu. Çizgi romanlarda, karakter Lux isimli bir barı işletiyor.', 'lucifer-690785.jpg', 1, 80, 46, 1, 2016, 45, '8.5', '2021-02-13 09:35:29', NULL),
(62, '1416', 'Grey\'s Anatomy', 'greys-anatomy', 'Grace Hastanesi\'ne hoş geldiniz! Burada yeni ve acemi doktorlar için en zorlu doktorluk ihtisas devresi programlarından biri uygulanıyor. Bu acımasız eğitimle başa çıkmak zorunda olan kahramanlarımız ise Meredith, Izzie, George, Alex ve Cristina... Onlar dün öğrenciydiler, bugün doktorlar... Eğer yedi yıl boyunca Grace gibi bir cehennemde başarılı olurlarsa, cerrahlığa da hak kazanmış olacaklar. Ancak, ihtisas devresinin bu kadar zorlu olması, onlar için yaşamlarının geri kalanının durdurduğu anlamına da gelmiyor. Yani bu grup, aynı zamanda kıskanç sevgililer, ebeveynler, tek gecelik ilişkiler ve ev bulma krizleriyle mücadele etmek zorunda... Üstelik kahramanlarımız, bu stresli ve rekabet dolu ortamda dostluklar da kurmaya çalışıyolar', 'greys-anatomy-341584.jpg', 1, 11, 48, 1, 2005, 43, '8.2', '2021-02-14 14:13:47', NULL),
(64, '18165', 'The Vampire Diaries', 'the-vampire-diaries', 'Ailelerini dört ay önce bir trafik kazasında kaybetmiş olan 17 yaşındaki Elena ve 15 yaşındaki kardeşi Jeremy, yaşadıkları acı sonrası hayatlarına devam etmeye çalışmaktadırlar. Elena çevresinde her zaman güzelliği ve başarılı bir öğrenci olmasıyla ön planda olmuştur. Yaşadığı acıyı dış dünyadan saklama çabasındadır. İki vampir kardeşten Stefan ve Damon\'ın kasabaya gelmesiyle, Elena\'yla Stefan hemen birbirlerine karşı ilgi duymaya başlarlar. ', 'the-vampire-diaries-112690.jpg', 1, 29, 46, 1, 2009, 43, '8.3', '2021-02-13 09:36:55', NULL),
(65, '85271', 'WandaVision', 'wandavision', '1950\'li yıllarda geçecek olan WandaVision, beyaz perdede Elizabeth Olsen ve Paul Bettany’nin hayat verdiği Marvel karakterleri Scarlet Witch ve Vision\'a odaklanıyor.', 'wandavision-355157.jpg', 1, 41, 48, 1, 2021, 36, '8.4', '2021-02-13 11:54:27', NULL),
(66, '1100', 'How I Met Your Mother', 'how-i-met-your-mother', 'Ted çocuklarına yıllar önce anneleriyle nasıl tanıştığını anlatırken, Ted\'in ruh ikizi için destansı arayışı büyük ölçüde geriye dönüşlerle gösteriliyor.', 'how-i-met-your-mother-686666.jpg', 1, 25, 53, 1, 2005, 22, '8.1', '2021-02-13 22:11:38', NULL),
(67, '4604', 'Smallville', 'smallville', 'Her Efsanenin Bir Başlangıcı Vardır...  Smallville, DC Comics’in popüler çizgi roman kahramanı Superman’in gençlik yıllarını temel alan bir bilimkurgu dizisi. Dizinin olay örgüsü genç Clark Kent’in Superman olmadan önce, Smallville’de geçen maceraları üstüne kurulu. Geleceğin büyük kahramanı Clark Kent bir yandan gençliğin getirdiği ilk aşk, okul ve dersler, gelecek kaygısı gibi her gencin sahip olduğu sorunlarla uğraşırken diğer yandan da ortaya çıkan süper güçlerini kontrol etmek, dünya dışı kökenlerini öğrenmek ve kahraman olma yolundaki kaderini keşfetmek zorundadır.\r\n\r\nAyrıca dizi Clark Kent’in kahramanlığa olan yolcuğunun yanı sıra Lex Luthor\'un kötülüğe olan yolculuğunu da yansıtmaktadır. Yakın dost olarak sunulan iki karakterin farklı kaderlerinin onları nasıl iki büyük düşman haline getirdiği dizinin temel konularından biri.  Kansas\'ın Smallville kasabasında gerçekleşen ve dizinin ilk bölümünün giriş sahnesi olan 1989\'daki meteor yağmurunda, Clark\'la beraber dünyaya gelen ve Kripton gezegeninin parçalarını içeren meteor taşları (Kriptonit) bazı kasaba sakinlerinin mutasyona uğramasına ve insanüstü güçler edinmesine sebep olur. Bunun yanında LuthorCorp\'un meteor taşlarıyla yaptığı deneylerle de ortaya bir çok mutant çıkar. Dizide Clark\'ın bunların arasındaki kötü mutantlara karşı olan mücadelesi önemli bir yer tutuyor.', 'smallville-558396.jpg', 1, 13, 48, 1, 2001, 43, '8.1', '2021-02-14 13:15:42', NULL),
(70, '1396', 'Breaking Bad', 'breaking-bad', 'Kanserden öleceğini öğrenen bir kimya öğretmeni, ailesinin geleceğini garanti altına almak için metamfetamin üretip satmak üzere eski bir öğrencisiyle kafa kafaya verir. (18 yaş ve üzeri için uygundur)', 'breaking-bad-667712.jpg', 1, 245, 48, 1, 2008, 45, '8.7', '2021-02-14 14:53:23', NULL),
(71, '60735', 'The Flash', 'the-flash', 'Geçmişinde büyük bir trajedi yaşamış Barry Allen, Central City Polis Birimi’nde çalışan ve suçluların arkalarında bıraktıkları ipuçlarını toplayan bir adli laboratuvar asistanıdır. Talihsiz bir yıldırım kazası yaşamasının ardından süper hız gücüne sahip olan Barry, Flash kimliğine bürünür ve kötü adamları adalete teslim etmeyi kendine görev edinir!', 'the-flash-499127.jpg', 1, 11, 46, 1, 2014, 44, '7.6', '2021-02-16 13:17:15', NULL);

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

INSERT INTO `dizi_bolum` (`bolum_id`, `rank`, `dizi_id`, `sezon_id`, `bolum_kod`, `bolum_adi`, `bolum_baslik`, `bolum_ozet`, `bolum_durum`, `bolum_izlenme_durum`, `bolum_tarih`, `createdAt`, `updatedAt`) VALUES
(3, 0, 61, 20, 1, '1.Bölüm', 'Pilot ', 'Eski bir tanıdığının vahşice öldürülmesinin ardından, şeytan tüyü taşıyan Lucifer katillerden intikam almaya yemin eder ve beklenmedik bir müttefik edinir.\r\n\r\n', 1, 0, '2016-01-25', '2021-02-14 00:43:57', '2021-02-13 22:04:51'),
(4, 0, 61, 20, 2, '2.Bölüm', 'Lucifer, Bekle. Cici Şeytan.', 'Lucifer bir yandan cehenneme geri dönme baskısını hissederken diğer yandan genç bir adamın ölümüne sebep olan aşırı meraklı bir paparaziyi soruşturmakla meşguldur.', 1, 0, '2016-02-01', '2021-02-14 00:44:51', '2021-02-13 22:05:04'),
(5, 0, 61, 20, 3, '3.Bölüm', 'Karanlığın Sahte Prensi', 'Süperstarlığın eşiğindeki profesyonel bir oyun kurucu, uyandığında tüyler ürpertici bir olayla karşılaşır ve masumiyetini kanıtlamak için Lucifer\'dan yardım ister.', 1, 0, '2016-02-08', '2021-02-14 00:51:10', '2021-02-13 22:05:09'),
(6, 0, 61, 20, 4, '4.Bölüm', 'Erkek Ivır Zıvırları', 'Lucifer, Chloe\'yi baştan çıkarmaya çalışır, ancak o diğer kadınlara benzememektedir. Bu sırada Amenadiel, Lucifer hakkındaki endişelerini Maze ile paylaşır.', 1, 0, '2016-02-15', '2021-02-14 00:58:56', '2021-02-13 22:05:16'),
(9, 0, 61, 20, 5, '5.Bölüm', ' Güzel Ayakkabılar', 'Lucifer, modanın çirkin yüzüne tanık olur. Yeni bilgiler elde eden Amenadiel, Lucifer\'ı evine geri göndermek için bir plan yapar.', 1, 0, '2016-02-22', '2021-02-14 01:09:30', NULL),
(663, 0, 62, 38, 1, '1.Bölüm', '1. Bölüm', '', 1, 0, '2010-09-23', '2021-02-15 18:22:58', NULL),
(664, 0, 62, 38, 2, '2.Bölüm', '2. Bölüm', '', 1, 0, '2010-09-30', '2021-02-15 18:22:58', NULL),
(665, 0, 62, 38, 3, '3.Bölüm', '3. Bölüm', '', 1, 0, '2010-10-07', '2021-02-15 18:22:58', NULL),
(63, 13, 66, 50, 14, '14.Bölüm', 'İlkler', 'Banyoda saklanan Marshall ve Lily, Ted ile Victoria\'nın ilişkiye girmesini bekler. Barney, Robin hakkında yanlış fikre kapılır.', 1, 0, '2006-02-06', '2021-02-14 16:55:58', NULL),
(62, 12, 66, 50, 13, '13.Bölüm', 'Trampet Sesleri', 'Ted düğünde Victoria adlı heyecan verici yeni biriyle tanıştığında, Robin duygusal bir ikilemde kalır. Ancak daha sonra, Ted Victoria\'ya nasıl ulaşacağını bilemez.', 1, 0, '2006-01-23', '2021-02-14 16:55:58', NULL),
(61, 11, 66, 50, 12, '12.Bölüm', 'Düğün', 'Ted, Robin\'i havalı bir düğüne davet eder, ancak müstakbel gelinin yanında birini getirmesine izin vermediğini öğrenen Ted\'in romantik umutları yerle bir olur.', 1, 0, '2006-01-09', '2021-02-14 16:55:58', NULL),
(59, 9, 66, 50, 10, '10.Bölüm', 'Ananas Olayı', 'Çok içilen bir gecenin ardından, Ted uyandığında yatağında yabancı bir kadın ve bir de ananas bulur.', 1, 0, '2005-11-28', '2021-02-14 16:55:58', NULL),
(60, 10, 66, 50, 11, '11.Bölüm', 'Limuzin', 'Ted, yılbaşı gecesinde tüm ekiple gece boyu partiden partiye akmak için bir limuzin kiralar.', 1, 0, '2005-12-19', '2021-02-14 16:55:58', NULL),
(58, 8, 66, 50, 9, '9.Bölüm', 'Bıktıran Hindi', 'Marshall\'ın ailesiyle Şükran Günü yemeği biraz stresli geçer, çünkü Lily hamile olduğundan şüphelenmektedir. Robin, Barney ve Ted, günü gönüllü olarak çalışarak geçirir.', 1, 0, '2005-11-21', '2021-02-14 16:55:58', NULL),
(57, 7, 66, 50, 8, '8.Bölüm', 'Düello', 'Lily, Marshall ve Ted\'in yanına taşınır. Ted dışlandığından şüphelenince, Marshall ile birlikte bu olayı erkekler gibi çözmeye karar verirler.', 1, 0, '2005-11-14', '2021-02-14 16:55:58', NULL),
(56, 6, 66, 50, 7, '7.Bölüm', 'Çöpçatan', 'Ted bir çöpçatanlık şirketine kaydolur ve aşkın bilim olmadığını öğrenir. Marshall ve Lily, evlerinde yaşayan korkunç bir yaratık görür.', 1, 0, '2005-11-07', '2021-02-14 16:55:58', NULL),
(55, 5, 66, 50, 6, '6.Bölüm', 'Kaşar Bal Kabağı', 'Cadılar Bayramı coşkuyla kutlanırken Ted her yıl olduğu gibi aynı berbat partiye gider ve yıllar önce orada tanıştığı kızı bulmaya çalışır.', 1, 0, '2005-10-24', '2021-02-14 16:55:58', NULL),
(54, 4, 66, 50, 5, '5.Bölüm', 'Okay mi? Müthiş!', 'Popüler bir kulübe giden Robin, Ted ve Barney, nişanlı Marshall ve Lily\'yi daha yetişkinlere özgü ama aşırı sıkıcı bir şarap tadımı akşamında baş başa bırakır.', 1, 0, '2005-10-17', '2021-02-14 16:55:58', NULL),
(53, 3, 66, 50, 4, '4.Bölüm', 'Gömleğin Dönüşü', 'Ted eski sevgilisiyle tekrar birleşir ve çok geçmeden onu daha önce neden terk ettiğini hatırlar. Barney, canlı yayında aptalca şeyler söylemesi için Robin\'e para verir.', 1, 0, '2005-10-10', '2021-02-14 16:55:58', NULL),
(52, 2, 66, 50, 3, '3.Bölüm', 'Özgürlüğün Tadı', 'Ted ve Barney havaalanı güvenliği tarafından sorguya alınınca, Barney\'nin havaalanında kızlarla tanışma planı ters teper. Bu sırada Lily, Robin\'i kıskanır.', 1, 0, '2005-10-03', '2021-02-14 16:55:58', NULL),
(51, 1, 66, 50, 2, '2.Bölüm', 'Mor Zürafa', 'Ted, Robin\'i tekrar görme umuduyla bir parti verir. Robin o partiye gelmeyince bir parti daha düzenler. Sonra bir parti daha...', 1, 0, '2005-09-26', '2021-02-14 16:55:58', NULL),
(48, 15, 66, 49, 16, '16.Bölüm', '16. Bölüm', '', 1, 0, '2014-03-31', '2021-02-14 16:55:50', NULL),
(49, 16, 66, 49, 17, '17.Bölüm', '17. Bölüm', '', 1, 0, '2014-03-31', '2021-02-14 16:55:50', NULL),
(50, 0, 66, 50, 1, '1.Bölüm', 'Pilot Bölüm', '2030 yılında, Ted çocuklarına anneleriyle nasıl tanıştığını anlatır. Hikâye, 2005\'te Marshall ve Lily\'nin nişanlanmasıyla başlar.', 1, 0, '2005-09-19', '2021-02-14 16:55:58', NULL),
(45, 12, 66, 49, 13, '13.Bölüm', '13. Bölüm', '', 1, 0, '2014-03-31', '2021-02-14 16:55:50', NULL),
(46, 13, 66, 49, 14, '14.Bölüm', '14. Bölüm', '', 1, 0, '2012-05-14', '2021-02-14 16:55:50', NULL),
(47, 14, 66, 49, 15, '15.Bölüm', '15. Bölüm', '', 1, 0, '2012-12-17', '2021-02-14 16:55:50', NULL),
(42, 9, 66, 49, 10, '10.Bölüm', '10. Bölüm', '', 1, 0, '2021-02-15', '2021-02-14 16:55:50', NULL),
(43, 10, 66, 49, 11, '11.Bölüm', '11. Bölüm', '', 1, 0, '2014-03-27', '2021-02-14 16:55:50', NULL),
(44, 11, 66, 49, 12, '12.Bölüm', '12. Bölüm', '', 1, 0, '2014-02-04', '2021-02-14 16:55:50', NULL),
(39, 6, 66, 49, 7, '7.Bölüm', '7. Bölüm', '', 1, 0, '2021-02-15', '2021-02-14 16:55:50', NULL),
(40, 7, 66, 49, 8, '8.Bölüm', '8. Bölüm', '', 1, 0, '2021-02-15', '2021-02-14 16:55:50', NULL),
(41, 8, 66, 49, 9, '9.Bölüm', '9. Bölüm', '', 1, 0, '2021-02-15', '2021-02-14 16:55:50', NULL),
(36, 3, 66, 49, 4, '4.Bölüm', '4. Bölüm', '', 1, 0, '2021-02-15', '2021-02-14 16:55:50', NULL),
(37, 4, 66, 49, 5, '5.Bölüm', '5. Bölüm', '', 1, 0, '2021-02-15', '2021-02-14 16:55:50', NULL),
(38, 5, 66, 49, 6, '6.Bölüm', '6. Bölüm', '', 1, 0, '2021-02-15', '2021-02-14 16:55:50', NULL),
(33, 0, 66, 49, 1, '1.Bölüm', '1. Bölüm', '', 1, 0, '2006-11-20', '2021-02-14 16:55:50', NULL),
(34, 1, 66, 49, 2, '2.Bölüm', '2. Bölüm', '', 1, 0, '2008-04-21', '2021-02-14 16:55:50', NULL),
(35, 2, 66, 49, 3, '3.Bölüm', '3. Bölüm', '', 1, 0, '2007-11-19', '2021-02-14 16:55:50', NULL),
(64, 14, 66, 50, 15, '15.Bölüm', 'Oyun Gecesi', 'Marshall\'ın oyun gecesi, sarsıcı ve oldukça utanç verici bazı açıklamalara sahne olur.', 1, 0, '2006-02-27', '2021-02-14 16:55:58', NULL),
(65, 15, 66, 50, 16, '16.Bölüm', 'Kapkek', 'Ted ve Victoria\'nın ilişkisi tam rayına oturmaya başlarken Victoria, Almanya\'daki bir aşçılık enstitüsünden burs teklifi alır.', 1, 0, '2006-03-06', '2021-02-14 16:55:58', NULL),
(66, 16, 66, 50, 17, '17.Bölüm', 'Goriller Arasında Yaşam', 'Victoria\'nın Almanya\'ya gitmesiyle, Ted uzun mesafeli ilişkilerin olumsuz yanlarıyla karşı karşıya kalır. Marshall, Barney\'nin şirketine uyum sağlamakta zorlanır.', 1, 0, '2006-03-20', '2021-02-14 16:55:58', NULL),
(67, 17, 66, 50, 18, '18.Bölüm', 'Gece İkiden Sonra İyi Bir Şey Olmaz', 'Robin onu geç saatte evine davet ettiğinde, aklı Victoria\'da olan Ted\'in duyguları allak bullak olur.', 1, 0, '2006-04-10', '2021-02-14 16:55:58', NULL),
(68, 18, 66, 50, 19, '19.Bölüm', 'Avukat Asistanı Mary', 'Ted, Robin\'in ödül törenine giderken kendisine eşlik edecek birini bulmak zorundadır. Barney onu muhtemelen bir fahişe olan Mary ile tanıştırır.', 1, 0, '2006-04-24', '2021-02-14 16:55:58', NULL),
(69, 19, 66, 50, 20, '20.Bölüm', 'Unutulmaz Balo', 'Düğün günü hızla yaklaşan Lily, düğünde çalabilecek bir grubu dinlemek için Barney ve Robin\'le birlikte bir lise balosuna sızar.', 1, 0, '2006-05-01', '2021-02-14 16:55:58', NULL),
(70, 20, 66, 50, 21, '21.Bölüm', 'Süt', 'Bir çöpçatanlık servisi ruh eşini bulduğunu iddia edince, Ted çok heyecanlanır. Ancak sürpriz bir açıklama yapan Lily\'ye yardım etmek için bu buluşmayı erteler.', 1, 0, '2006-05-08', '2021-02-14 16:55:58', NULL),
(71, 21, 66, 50, 22, '22.Bölüm', 'Hadisene!', 'Ted, Robin\'in iş arkadaşı Sandy ile bir geziye gitmesini engellemeye çalışır. Lily\'nin burs mülakatının sonucunu öğrenen Marshall çok üzülür.', 1, 0, '2006-05-15', '2021-02-14 16:55:58', NULL),
(72, 0, 66, 51, 1, '1.Bölüm', 'Nerede Kalmıştık?', 'Lily bir resim programına katılmak için San Francisco\'ya gider ve ayrılıklarının ardından yıkılan Marshall ile ilgilenmek Ted, Barney ve Robin\'e kalır.', 1, 0, '2006-09-18', '2021-02-14 16:57:10', NULL),
(73, 0, 66, 51, 2, '2.Bölüm', 'Akrep ve Kurbağa', 'Marshall\'ın nihayet ayrılık acısını atlatmaya başladığı sırada, Lily San Francisco\'dan döner.', 1, 0, '2006-09-25', '2021-02-14 16:57:10', NULL),
(74, 0, 66, 51, 3, '3.Bölüm', 'Brunch', 'Ted\'in ailesi hafta sonunda onu ziyarete gelir. Brunch sırasında herkesi şoke eden bir aile sırrı ortaya çıkar.', 1, 0, '2006-10-02', '2021-02-14 16:57:10', NULL),
(75, 0, 66, 51, 4, '4.Bölüm', 'Mimar Ted Mosby', 'Ted ve Robin\'in kavgasının ardından, Barney mimarlık mesleğinin kadınları tavlamanın harika bir yolu olduğunu Ted\'e göstermeye çalışır.', 1, 0, '2006-10-09', '2021-02-14 16:57:10', NULL),
(76, 0, 66, 51, 5, '5.Bölüm', 'Dünyanın En Harika Çifti', 'Lily, farelerin bastığı evinden kaçmak için Barney\'nin yanına taşınır. Marshall, hukuk fakültesinden bir kankasıyla eğlenceli \"çift aktivitelerinin\" tadını çıkarır.', 1, 0, '2006-10-16', '2021-02-14 16:57:10', NULL),
(77, 0, 66, 51, 6, '6.Bölüm', 'Aldrin Adaleti', 'Barney, sınavlara not verirken daha merhametli olmasını sağlama umuduyla Marshall\'ın hukuk profesörünü baştan çıkarır. Lily, Ted\'in ofisinde işe girer.', 1, 0, '2006-10-23', '2021-02-14 16:57:10', NULL),
(78, 0, 66, 51, 7, '7.Bölüm', 'Swarley', 'Ted ve Barney, yeni kız arkadaşının deli olduğuna Marshall\'ı ikna etmeye çalışır. Barney yeni bir lakap edinir.', 1, 0, '2006-11-06', '2021-02-14 16:57:10', NULL),
(79, 0, 66, 51, 8, '8.Bölüm', 'Atlantic City', 'Marshall ve Lily, kaçarak evlenmek için tüm ekibi Atlantic City\'ye sürükler.', 1, 0, '2006-11-13', '2021-02-14 16:57:10', NULL),
(80, 0, 66, 51, 9, '9.Bölüm', 'Tokat İddiası', 'Robin\'in alışveriş merkezlerine karşı nefreti Ted\'in ilgisini çeker ve Robin\'in nasıl bir sır sakladığını bulmayı kafasına koyar.', 1, 0, '2006-11-20', '2021-02-14 16:57:10', NULL),
(81, 0, 66, 51, 10, '10.Bölüm', 'Bekâr Gücü', 'Barney\'nin gey erkek kardeşi, en yakın arkadaşlarının ilişkide olduğu gerçeğiyle baş etmeye çalışan Barney\'i ziyaret eder.', 1, 0, '2006-11-27', '2021-02-14 16:57:10', NULL),
(82, 0, 66, 51, 11, '11.Bölüm', 'Lily Noel\'i Nasıl Mahvetti?', 'Ted ve Lily\'nin birbirine söylediği kırıcı sözler, Noel\'i neredeyse mahveder.', 1, 0, '2006-12-11', '2021-02-14 16:57:10', NULL),
(83, 0, 66, 51, 12, '12.Bölüm', 'İlk Defa New York\'ta', 'Robin\'in ergen kız kardeşinin seks yapmasını önlemeye çalışması, herkesin ilk cinsel deneyimini hatırlamasına neden olur.', 1, 0, '2007-01-08', '2021-02-14 16:57:10', NULL),
(84, 0, 66, 51, 13, '13.Bölüm', 'Kolonlar', 'Ted bir çalışanı kovmakta zorlanır. Ekip, Marshall\'ın çıplak bir portresini bulduğunda ona işkence eder.', 1, 0, '2007-01-22', '2021-02-14 16:57:10', NULL),
(85, 0, 66, 51, 14, '14.Bölüm', 'Pazartesi Gecesi Futbolu', 'Ekip bir cenaze nedeniyle Super Bowl\'u canlı izleyemez ve ertesi gün maçı izleyene dek skoru öğrenmeyeceklerine dair anlaşma yaparlar.', 1, 0, '2007-02-05', '2021-02-14 16:57:10', NULL),
(86, 0, 66, 51, 15, '15.Bölüm', 'Şanslı Çeyreklik', 'Ted\'in metroda bulduğu bozuk parayı almasının ardından başlayan talihsizlikler, bir iş görüşmesini ve muhtemelen hayatının fırsatını kaçırmasıyla zirveye ulaşır.', 1, 0, '2007-02-12', '2021-02-14 16:57:10', NULL),
(87, 0, 66, 51, 16, '16.Bölüm', 'Eşyalar', 'Ted ve Robin, önceki ilişkilerinden kalan ve hâlâ sakladıkları eşyalar konusunda tartışır. Lily tüm ekibi oynadığı oyunu izlemeye zorlar.', 1, 0, '2007-02-19', '2021-02-14 16:57:10', NULL),
(88, 0, 66, 51, 17, '17.Bölüm', 'Arrivederci, Fiero', 'Marshall\'ın emektar Fiero\'su tam 200 bin mile ulaşacakken bozulunca, herkes arabayla ilgili anılarını hatırlar ve bir dönem böylece sona erer.', 1, 0, '2007-02-26', '2021-02-14 16:57:10', NULL),
(89, 0, 66, 51, 18, '18.Bölüm', 'Taşınma Günü', 'Barney, birlikte yaşamaya hazırlanan Ted ve Robin\'in ilişkisini sabote etmek için sıra dışı bir çaba sarf eder.', 1, 0, '2007-03-19', '2021-02-14 16:57:10', NULL),
(90, 0, 66, 51, 19, '19.Bölüm', 'Bekârlığa Veda Partisi', 'Marshall\'ın bekârlığa veda partisini mahvetmesinin ardından, Barney neredeyse Marshall ve Lily\'nin düğününe çağırılmayacaktır. Ta ki Lily onu savunana kadar.', 1, 0, '2007-04-09', '2021-02-14 16:57:10', NULL),
(91, 0, 66, 51, 20, '20.Bölüm', 'Kaç Para?', 'Babasının Bob Barker olabileceğini düşünen Barney, Kaç Para\'ya katılmak için hazırlanmaya başlar. Marshall ve Lily, düğünden önce ayrı yataklarda uyumaya çalışır.', 1, 0, '2007-04-30', '2021-02-14 16:57:10', NULL),
(92, 0, 66, 51, 21, '21.Bölüm', 'Ödünç Alınmış Bir Şey', 'Marshall ve Lily\'nin hayallerindeki düğün planları suya düşünce, Ted ve diğerleri günü kurtarmak için elinden geleni yapar.', 1, 0, '2007-05-07', '2021-02-14 16:57:10', NULL),
(93, 0, 66, 51, 22, '22.Bölüm', 'Mavi Bir Şey', 'Barney, Marshall ve Lily\'nin düğün töreni sırasında, Ted ve Robin\'in haftalardır sakladıkları bir sırları olduğunu öğrenir.', 1, 0, '2007-05-14', '2021-02-14 16:57:10', NULL),
(94, 0, 66, 52, 1, '1.Bölüm', 'Bekle', 'Robin yanında Bay Adonis ile dönünce Ted, Barney ile felekten bir gece çalmaya karar verir. Üstelik performansı efsa-... bekle ... -nevi olacaktır.', 1, 0, '2007-09-24', '2021-02-14 16:57:35', NULL),
(95, 0, 66, 52, 2, '2.Bölüm', 'Biz Buralı Değiliz', 'Kızların Robin\'in sevgilisi Gael\'e ölüp bittiğini gördükten sonra, Barney ve Ted kızlarla tanışmak için yabancı gibi davranmaya karar verir.', 1, 0, '2007-10-01', '2021-02-14 16:57:35', NULL),
(96, 0, 66, 52, 3, '3.Bölüm', 'Üçteker', 'İki kadın birden Ted\'den hoşlanınca, partiyi Ted\'in evine taşırlar. Bu sırada evde olan diğerleri, Ted\'in üçte keramet olmadığını anlamasını sağlamaya çalışır.', 1, 0, '2007-10-08', '2021-02-14 16:57:35', NULL),
(97, 0, 66, 52, 4, '4.Bölüm', 'Çocuklar', '\"Çocukları sevmeyen\" Robin, çıktığı adamın oğluyla bağ kurduğunda, ilişkinin fazla ciddileştiğine ve ufaklığı hayal kırıklığına uğratması gerektiğine karar verir.', 1, 0, '2007-10-15', '2021-02-14 16:57:35', NULL),
(98, 0, 66, 52, 5, '5.Bölüm', 'Diğer Herkesle Nasıl Tanıştım?', 'Ted\'in yeni kız arkadaşı, Ted\'in arkadaşlarıyla tanışma hikâyesinin onun Ted\'le tanışma hikâyesinden daha iyi olması nedeniyle kıskançlık krizine girer.', 1, 0, '2007-10-22', '2021-02-14 16:57:35', NULL),
(99, 0, 66, 52, 6, '6.Bölüm', 'Ben O Adam Değilim', 'Kurumsal bir hukuk firması Marshall\'a iş teklifinde bulununca, Marshall para kazanmak uğruna dünyayı kurtarma hayalinden vazgeçmek zorunda kalır.', 1, 0, '2007-10-29', '2021-02-14 16:57:35', NULL),
(100, 0, 66, 52, 7, '7.Bölüm', 'Dowisetrepla', 'Lily ve Marshall ev almaya karar verir. Marshall kredi başvurusu yaptığında, Lily\'nin küçük kirli finansal sırrını keşfeder.', 1, 0, '2007-11-05', '2021-02-14 16:57:35', NULL),
(101, 0, 66, 52, 8, '8.Bölüm', 'Kötü Alışkanlıklar', 'Ted harika bir kızla tanıştığını düşünmektedir. Ancak ekip, kızın bir kusuruna dikkat çekmeden edemez. Bunun üzerine, grup arasında hararetli bir tartışma başlar.', 1, 0, '2007-11-12', '2021-02-14 16:57:35', NULL),
(102, 0, 66, 52, 9, '9.Bölüm', 'Tokat Günü', 'Lily ve Marshall evli bir çift olarak ilk Şükran Günü davetini verirken, tokat iddiası geri sayımı Barney için işkenceye dönüşür.', 1, 0, '2007-11-19', '2021-02-14 16:57:35', NULL),
(103, 0, 66, 52, 10, '10.Bölüm', 'Bağlantı Kopması', 'Barney kızlara asılma yeteneğini kaybedince, eski havasını geri kazanmak için Victoria\'s Secret Sonbahar Defilesinin partisine katılır.', 1, 0, '2007-11-26', '2021-02-14 16:57:35', NULL),
(104, 0, 66, 52, 11, '11.Bölüm', 'Platin Kural', 'Ekip, Ted\'in doktoruyla çıkacağını öğrenince, sürekli gördüğü biriyle çıkmanın iyi bir fikir olmadığı konusunda onu ikna etmeye çalışır.', 1, 0, '2007-12-10', '2021-02-14 16:57:35', NULL),
(105, 0, 66, 52, 12, '12.Bölüm', 'Yarın Yok', 'Ted, Barney\'ye uyar ve yarın yokmuş gibi yaşamaya başlar. Aziz Patrick Günü sonrasında, o gece aslında neler olduğunu Marshall\'dan öğrenir.', 1, 0, '2008-03-17', '2021-02-14 16:57:35', NULL),
(106, 0, 66, 52, 13, '13.Bölüm', 'On Seans', 'Ted, dermatoloğu Stella\'yı tavlamaya çalışır. Stella, Ted\'in tüm randevu tekliflerini geri çevirirken muayenehanesindeki resepsiyonist Abby, Ted\'e âşık olur.', 1, 0, '2008-03-24', '2021-02-14 16:57:35', NULL),
(107, 0, 66, 52, 14, '14.Bölüm', 'Liste', 'Barney\'nin aşk hayatı gizemli bir kadın tarafından sabote edildiğinde, Barney ondan en çok nefret eden kişiyi bulmak için turnuva tarzında bir liste hazırlar.', 1, 0, '2008-03-31', '2021-02-14 16:57:35', NULL),
(108, 0, 66, 52, 15, '15.Bölüm', 'Bağırma Zinciri', 'Patronu ona bağırdıktan sonra, Marshall kurumsal bir hukuk firmasında işe girerek hata yapmış olabileceğini düşünmeye başlar.', 1, 0, '2008-04-14', '2021-02-14 16:57:35', NULL),
(109, 0, 66, 52, 16, '16.Bölüm', 'Kumdan Kaleler', 'Robin eski sevgilisiyle tekrar bir araya gelir ve tekrar terk edilir. Bunun üzerine Barney, kendi eşsiz üslubuyla, Robin\'in müthiş biri olduğunu anlamasına yardım eder.', 1, 0, '2008-04-21', '2021-02-14 16:57:35', NULL),
(110, 0, 66, 52, 17, '17.Bölüm', 'Keçi', '\"Kanka Kanununu\" çiğnediği için suçluluk duyan Barney, attığı yanlış adımın sonuçlarından endişelenir.', 1, 0, '2008-04-28', '2021-02-14 16:57:35', NULL),
(111, 0, 66, 52, 18, '18.Bölüm', 'Telafi Kankası', 'Stella\'nın özel sırrını ekibe anlatan Ted, onun güvenini kaybetmenin sonuçlarıyla yüzleşmek zorunda kalır.', 1, 0, '2008-05-05', '2021-02-14 16:57:35', NULL),
(112, 0, 66, 52, 19, '19.Bölüm', 'Hepsi Satılık', 'Ted\'e karşı ortak bir nefret beslediklerini fark eden Barney ve Abby, bir \"çift\" olarak yeni ilişkilerini Ted\'in gözüne sokmak için bara gider.', 1, 0, '2008-05-12', '2021-02-14 16:57:35', NULL),
(113, 0, 66, 52, 20, '20.Bölüm', 'Mucizeler', 'Ted bir kaza geçirdikten sonra, hayatını ve Stella ile ilişkisini yeniden değerlendirir.', 1, 0, '2008-05-19', '2021-02-14 16:57:35', NULL),
(114, 0, 66, 56, 1, '1.Bölüm', 'Sağdıç', 'Barney ve Ted, Ted\'in eski bir arkadaşının düğününü ve burada Marshall\'ın yaptığı doğaçlama konuşmayı hatırlar.', 1, 0, '2011-09-19', '2021-02-14 16:59:21', NULL),
(115, 0, 66, 56, 2, '2.Bölüm', 'Çıplak Gerçek', 'Marshall hayallerindeki iş teklifini alır, ancak geçmişte kaydettiği videoların standart geçmiş kontrolü sırasında ortaya çıkmasından endişelenir.', 1, 0, '2011-09-19', '2021-02-14 16:59:21', NULL),
(116, 0, 66, 56, 3, '3.Bölüm', 'Ördekli Kravat', 'Ted eski bir sevgilisiyle tekrar bir araya gelir. Lily, Marshall ve Barney bir iddiaya girer. Barney kaybederse, Marshall\'ın ördekli kravatını takacaktır.', 1, 0, '2011-09-26', '2021-02-14 16:59:21', NULL),
(117, 0, 66, 56, 4, '4.Bölüm', 'Stinson Füze Krizi', 'Robin bir kıza saldırdıktan sonra, mahkeme emriyle terapi seanslarına gitmeye başlar.', 1, 0, '2011-10-03', '2021-02-14 16:59:21', NULL),
(118, 0, 66, 56, 5, '5.Bölüm', 'Alan Gezisi', 'Marshall, patronunun milyon dolarlık bir şirketle yaptığı anlaşmaya çok şaşırır.', 1, 0, '2011-10-10', '2021-02-14 16:59:21', NULL),
(119, 0, 66, 56, 6, '6.Bölüm', 'Gizem Geçmişe Karşı', 'Ted internette hakkında araştırma yapmadığı bir kızla randevuya çıkmaya kalkışınca, ekip müdahale eder.', 1, 0, '2011-10-17', '2021-02-14 16:59:21', NULL),
(120, 0, 66, 56, 7, '7.Bölüm', 'Noretta', 'Herkes, sevgililerinin onlara ebeveynlerinden birini hatırlattığını fark eder.', 1, 0, '2011-10-24', '2021-02-14 16:59:21', NULL),
(121, 0, 66, 56, 8, '8.Bölüm', 'Kaşar Bal Kabağı Dönüyor', 'Ted, Kaşar Bal Kabağı kostümlü gizemli kızla nihayet buluşur. Kaşar Bal Kabağı Naomi rolünde, konuk oyuncu olarak Katie Holmes var.', 1, 0, '2011-10-31', '2021-02-14 16:59:21', NULL),
(122, 0, 66, 56, 9, '9.Bölüm', 'Atlatılan Felaket', 'Ekip Irene Kasırgası anılarını hatırlarken Barney, ördekli kravatı takmamak için Marshall ve Lily ile bir anlaşma yapmaya çalışır.', 1, 0, '2011-11-07', '2021-02-14 16:59:21', NULL),
(123, 0, 66, 56, 10, '10.Bölüm', 'Tik Tak', 'Robin ve Barney, birlikte oldukları kişilerden bir sır saklamaktadır.', 1, 0, '2011-11-14', '2021-02-14 16:59:21', NULL),
(124, 0, 66, 56, 11, '11.Bölüm', 'Telafi Kızı', 'Ted ve Barney, birlikte hayatlarını değiştirecek bir karar almayı değerlendirir.', 1, 0, '2011-11-21', '2021-02-14 16:59:21', NULL),
(125, 0, 66, 56, 12, '12.Bölüm', 'Aydınlatma Senfonisi', 'Robin çok şaşırtıcı bir haber alır ve bunu ekipten saklar.', 1, 0, '2011-12-05', '2021-02-14 16:59:21', NULL),
(126, 0, 66, 56, 13, '13.Bölüm', 'Piknik', 'Marshall, piknik yapma geleneklerini sürdürmek için babasının mezarını ziyaret eder ve ona yılbaşı gecesi olanları anlatır.', 1, 0, '2012-01-02', '2021-02-14 16:59:21', NULL),
(127, 0, 66, 56, 14, '14.Bölüm', '46 Dakika', 'How I Met Your Mother\'ın bu 150. bölümünde, Lily\'nin her şeye karışan babası, kızının banliyödeki evinden taşınmayı reddeder.', 1, 0, '2012-01-16', '2021-02-14 16:59:21', NULL),
(128, 0, 66, 56, 15, '15.Bölüm', 'Yanan Arıcı', 'Marshall ve Lily\'nin yeni eve taşınma partisinde her şey ters gider.', 1, 0, '2012-02-06', '2021-02-14 16:59:21', NULL),
(129, 0, 66, 56, 16, '16.Bölüm', 'Sarhoş Treni', 'Marshall, Lily, Robin ve Kevin, Sevgililer Günü\'nü bir hafta sonu kaçamağıyla kutlar.', 1, 0, '2012-02-13', '2021-02-14 16:59:21', NULL),
(130, 0, 66, 56, 17, '17.Bölüm', 'Baskı Yok', 'Ted, Robin\'e hislerini itiraf eder. Barney, Marshall ve Lily\'ye ait çok özel bir şey bulur.', 1, 0, '2012-02-20', '2021-02-14 16:59:21', NULL),
(131, 0, 66, 56, 18, '18.Bölüm', 'Karma', 'Quinn\'e karşı hisleri olduğunu fark eden Barney, onu kendisiyle çıkmaya ikna etmeye çalışır.', 1, 0, '2012-02-27', '2021-02-14 16:59:21', NULL),
(132, 0, 66, 56, 19, '19.Bölüm', 'Kanka Andı', 'Barney, Quinn\'le birlikte yaşama planlarını açıklar. Bunun üzerine Ted ve Robin, Quinn\'in evini kimin tutacağı üzerine kavga eder.', 1, 0, '2012-03-19', '2021-02-14 16:59:21', NULL),
(133, 0, 66, 56, 20, '20.Bölüm', 'Triloji Zamanı', 'Marshall, Barney ve Ted, üç yıl sonra hayatlarının nasıl olacağını hayal ederler.', 1, 0, '2012-04-09', '2021-02-14 16:59:21', NULL),
(134, 0, 66, 56, 21, '21.Bölüm', 'Şimdi Eşitiz', 'Barney, Ted\'i her geceyi \"efsanevi\" hâle getirmek için kandırmaya çalışır.', 1, 0, '2012-04-16', '2021-02-14 16:59:21', NULL),
(135, 0, 66, 56, 22, '22.Bölüm', 'İyi Bir Delilik', 'Marshall, bebeğin yakında geleceğini fark edince çılgına döner.', 1, 0, '2012-04-30', '2021-02-14 16:59:21', NULL),
(136, 0, 66, 56, 23, '23.Bölüm', 'Sihirbazın Kuralı: Kısım 1', 'Lily doğuma girince, Marshall ve Barney umutsuzca New York\'a geri dönmeye çalışır.', 1, 0, '2012-05-14', '2021-02-14 16:59:21', NULL),
(137, 0, 66, 56, 24, '24.Bölüm', 'Sihirbazın Kuralı: Kısım 2', 'Barney\'nin düğün gününde, ekip Ted\'i kaçanı kovalaması için cesaretlendirdikleri zamanları hatırlar.', 1, 0, '2012-05-14', '2021-02-14 16:59:21', NULL),
(138, 0, 66, 53, 1, '1.Bölüm', 'Seni Tanıyor muyum?', 'Stella, Ted\'in teklifine cevap verir. Bu sırada Barney, Robin\'e âşık olduğunu anlar.', 1, 0, '2008-09-22', '2021-02-14 17:03:30', NULL),
(139, 0, 66, 53, 2, '2.Bölüm', 'New York\'un En İyi Hamburgeri', 'New York\'ta ilk hamburger yediği restoranı bulmaya çalışan Marshall, televizyon yıldızı Regis Philbin\'e rastlar.', 1, 0, '2008-09-29', '2021-02-14 17:03:30', NULL),
(140, 0, 66, 53, 3, '3.Bölüm', 'New Jersey\'i Seviyorum', 'Ted, Stella\'nın evlendiklerinde onun New Jersey\'ye taşınmasını beklediği haberiyle gafil avlanır.', 1, 0, '2008-10-06', '2021-02-14 17:03:30', NULL),
(141, 0, 66, 53, 4, '4.Bölüm', 'Müdahale', 'Ted, arkadaşlarının öncesinde Stella ile nişanı için planladıkları müdahale toplantısını yapmaları konusunda ısrar eder.', 1, 0, '2008-10-13', '2021-02-14 17:03:30', NULL),
(142, 0, 66, 53, 5, '5.Bölüm', 'Shelter Adası', 'Stella ve Ted\'in üç gün içinde evlenmeye karar vermesinin ardından düğüne eski sevgililerinin gelmesi, çiftin en mutlu gününü mahveder.', 1, 0, '2008-10-20', '2021-02-14 17:03:30', NULL),
(143, 0, 66, 53, 6, '6.Bölüm', 'Sonsuza Dek Mutlu', 'Ekip, bir daha asla görmemeyi tercih ettikleri insanlarla karşılaştıklarında nasıl davranacaklarını tartışır.', 1, 0, '2008-11-03', '2021-02-14 17:03:30', NULL),
(144, 0, 66, 53, 7, '7.Bölüm', 'Baba Olmama Günü', 'Lily, hayatını değiştirecek bir karar vermeden önce Ted ve Robin\'den tavsiye ister.', 1, 0, '2008-11-10', '2021-02-14 17:03:30', NULL),
(145, 0, 66, 53, 8, '8.Bölüm', 'Woooo!', 'Robin, bir grup bekâr parti kızıyla takılmaya başlar.', 1, 0, '2008-11-17', '2021-02-14 17:03:30', NULL),
(146, 0, 66, 53, 9, '9.Bölüm', 'Çıplak Adam', 'Ekip, Robin\'in çıktığı kişinin kullandığı bir taktiğe Ted\'in tanık olmasının ardından, kız tavlamanın yeni bir yöntemini keşfeder.', 1, 0, '2008-11-24', '2021-02-14 17:03:30', NULL),
(147, 0, 66, 53, 10, '10.Bölüm', 'Kavga', 'Arkadaşlarının onlar hakkındaki algılarını değiştirmek isteyen Ted ve Barney, MacLaren\'s\'ta bir grup adamla kavga eder.', 1, 0, '2008-12-08', '2021-02-14 17:03:30', NULL),
(148, 0, 66, 53, 11, '11.Bölüm', 'Küçük Minnesota', 'Ted ziyaret için New York\'a gelen kız kardeşini Barney\'den uzak tutmaya çalışır.', 1, 0, '2008-12-15', '2021-02-14 17:03:30', NULL),
(149, 0, 66, 53, 12, '12.Bölüm', 'Faydalar', 'Robin ve Ted \"arkadaştan öte\" olduklarında, ev arkadaşı olarak daha iyi anlaştıklarını keşfederler.', 1, 0, '2009-01-12', '2021-02-14 17:03:30', NULL),
(150, 0, 66, 53, 13, '13.Bölüm', 'Karlı Üç Gün', 'Ekip, bir kar fırtınasının eğlenme ritüellerini mahvetmesine izin vermeyi reddeder.', 1, 0, '2009-01-19', '2021-02-14 17:03:30', NULL),
(151, 0, 66, 53, 14, '14.Bölüm', 'Mümkânsız', 'Ekip, sınır dışı edilmemesi için Robin\'in iş bulmasına yardım etmeye çalışır.', 1, 0, '2009-02-02', '2021-02-14 17:03:30', NULL),
(152, 0, 66, 53, 15, '15.Bölüm', 'Stinson Ailesi', 'Barney\'nin tuhaf davranışını fark eden ekip, onun gizli bir kız arkadaşı olduğundan şüphelenir.', 1, 0, '2009-03-02', '2021-02-14 17:03:30', NULL),
(153, 0, 66, 53, 16, '16.Bölüm', 'Üzgünüm Kanka', 'Lily ve Marshall, Ted\'in üniversitedeki kendini beğenmiş eski kız arkadaşıyla tekrar birleşmesinden hiç de memnun olmaz.', 1, 0, '2009-03-09', '2021-02-14 17:03:30', NULL),
(154, 0, 66, 53, 17, '17.Bölüm', 'Ön Veranda', 'Karen\'la ayrılmasından (ve eski kız arkadaşlarının çoğuyla ilişkilerinin bozulmasından) Lily\'nin sorumlu olduğunu öğrenen Ted şaşkınlık içindedir.', 1, 0, '2009-03-16', '2021-02-14 17:03:30', NULL),
(155, 0, 66, 53, 18, '18.Bölüm', 'Yaşlı Kral Clancy', 'Goliath National Bank Ted\'in tasarlayacağı merkez binası inşaatını iptal edince, Marshall ve Barney onu korumak için yalan söyler.', 1, 0, '2009-03-23', '2021-02-14 17:03:30', NULL),
(156, 0, 66, 53, 19, '19.Bölüm', 'Murtaugh', 'Ted ekiptekilerin yaşlandıkları için yapamayacakları şeylerin bir listesini hazırlayınca, Barney listedeki her şeyi bir gün içinde yapmaya çalışır.', 1, 0, '2009-03-30', '2021-02-14 17:03:30', NULL),
(157, 0, 66, 53, 20, '20.Bölüm', 'Mosbius Tasarım', 'Ted, dairesinde bir mimarlık firması kurar ve şirketin kuruluş aşamasında yardımcı olması için bir stajyeri işe alır.', 1, 0, '2009-04-13', '2021-02-14 17:03:30', NULL),
(158, 0, 66, 53, 21, '21.Bölüm', 'Üç Gün Kuralı', 'Marshall ve Barney, Ted\'in \"kısa mesajlar\" üzerinden ilişki yaşadığı bir kız gibi davranarak ona oyun oynarlar.', 1, 0, '2009-04-27', '2021-02-14 17:03:30', NULL),
(159, 0, 66, 53, 22, '22.Bölüm', 'Doğru Zamanda, Doğru Yerde', 'Ted, geçmişinden bir kişiyle şans eseri karşılaşmasının insanı kaderine nasıl yaklaştırabileceğini öğrenir. Bu sırada, Barney bir dönüm noktasını kutlamaktadır.', 1, 0, '2009-05-04', '2021-02-14 17:03:30', NULL),
(160, 0, 66, 53, 23, '23.Bölüm', 'Elinden Geldiğince Hızlı', 'Ted\'in eski sevgilisi yeniden hayatına girer. Hem de yeni nişanlısıyla birlikte.', 1, 0, '2009-05-11', '2021-02-14 17:03:30', NULL),
(161, 0, 66, 53, 24, '24.Bölüm', 'Atlayış', '31. doğum günü yaklaşan Ted, diğer kariyer seçeneklerini araştırması gerektiğini fark eder.', 1, 0, '2009-05-18', '2021-02-14 17:03:30', NULL),
(162, 0, 1, 5, 1, '1.Bölüm', 'Ölüm Zamanım', 'Sam, Dean ve John, İblis tarafından kullanılan bir kamyonun Impala\'ya çarpmasından sonra ölüme terk edilmişlerdir. Winchesterlar’dan biri ölüm ile yaşam arasında mücadele verirken, diğeri kendini geri kalanının hayatını kurtarmak için feda etmeyi düşünmektedir; böylece eski ve güçlü bir düşman ile karşı karşıya gelir.', 1, 0, '2006-09-28', '2021-02-14 17:03:49', NULL),
(163, 0, 1, 5, 2, '2.Bölüm', 'Palyaçoları Herkes Sever', 'Sam ve Dean babalarının cep telefonundan Ellen adında bir kadından mesaj alırlar ve onu bulmak için yola çıkarlar. Ellen’ın, avcılara hizmet eden bir buluşma noktası olan Roadhouse’un sahibi olduğunu öğrenirler. Bu sırada bir sirk palyaçosu, ailelerini vahşice öldürebilmesi için onu içeri davet edecek çocukları hedef almıştır.', 1, 0, '2006-10-05', '2021-02-14 17:03:49', NULL),
(164, 0, 1, 5, 3, '3.Bölüm', 'Kana Susamış', 'Sam ve Dean, küçük bir kasabadaki vampirleri öldürmekte olan bir avcı ile karşılaşırlar. Dean bu kendini doğaüstü yaratıkları öldürmeye adamış adamla takım olur ve birlikte vampir sürüsünü avlarlar. Sam lider vampirler ile karşılaştıktan sonra onların sadece sığır kanıyla beslenen barışçıl canlılar olduğunu görür, tüm yaratıkların kötü olmadığına karar verir ve Dean’i seçim yapmaya zorlar.', 1, 0, '2006-10-12', '2021-02-14 17:03:49', NULL),
(165, 0, 1, 5, 4, '4.Bölüm', 'Çocuklar Ölü Şeylerle Oynamamalıdır', 'Annelerinin mezarını ziyaret ederken Dean ölü bitkilerle çevrelenmiş bir mezar görür ve bunun zombi işareti olduğunu düşünür. Winchesterlar, araba kazasında ölmüş üniversiteli bir kızın hayata geri döndürüldüğünü öğrenirler. Kız şimdi hayattayken kendisine kötü davranan kişilerden intikam almaktadır.', 1, 0, '2006-10-19', '2021-02-14 17:03:49', NULL),
(166, 0, 1, 5, 5, '5.Bölüm', 'Simon Der ki', 'Sam Oklahoma, Blue Ridge’de başka bir ölümü rüyasında görür. Kardeşler araştırmaya koyulurlar ve Andy Gallagher adında Sam ile aynı yaşta, annesini 6 aylıkken yangında kaybetmiş biriyle karşılaşırlar. Ve öğrenirler ki Andy’nin insanları kontrol etme gücü vardır. Andy’nin arkadaşları ölmeye başlayınca Dean ve Sam, Andy’nin gücünü insanları öldürmek için kullanıp kullanmadığını düşünmeye başlarlar.', 1, 0, '2006-10-26', '2021-02-14 17:03:49', NULL),
(167, 0, 1, 5, 6, '6.Bölüm', 'Çıkış Yok', '80 yıldır sarışın kadınlar bir apartmanda kaybolmaktadır. Jo, annesi onun araştırmasına izin vermedikten sonra dosyayı Winchesterlar\'a götürür ancak; annesine karşı gelerek Sam ve Dean’e katılır ve sonunda Amerika’nın ilk seri katilinin hayaleti tarafından yakalanır.', 1, 0, '2006-11-02', '2021-02-14 17:03:49', NULL),
(168, 0, 1, 5, 7, '7.Bölüm', 'Olağan Şüpheliler', 'Sam ve Dean, ölmeden önce bir hayalet gördüğü iddia edilen avukat ve eşinin cinayetini araştırırlar. Ancak Winchesterlar daha hayaleti bulamadan, yerel polis onların sabıka kaydını bulur ve kardeşleri çifte cinayetten tutuklar. Hayalet dedektif Ballard’ı ziyaret etmeye başlayınca, o da Sam ve Dean’in hikayesinin gerçek olup olmadığını ve sonraki kurbanın kendisi olup olmayacağını düşünmeye başlar.', 1, 0, '2006-11-09', '2021-02-14 17:03:49', NULL),
(169, 0, 1, 5, 8, '8.Bölüm', 'Şeytanla Anlaşma', 'İki son derece başarılı kişinin ölümünün ardından, peşlerine cehennem köpekleri düştüğü iddia edilince Sam ve Dean yerel bir barı ziyaret ederler ve öğrenirler ki barda bir iblis, ruhları karşılığında insanların rüyalarını gerçekleştirmek için anlaşmalar yapmaktadır. Dean iblisi öldürmek için çağırır ancak; iblis ona, babasının ölümü ardındaki acı gerçeği açıklayıp onu baştan çıkararak en çok istediği şeyi teklif eder: Babasını.', 1, 0, '2006-11-16', '2021-02-14 17:03:49', NULL),
(170, 0, 1, 5, 9, '9.Bölüm', 'Croatoan', 'Sam, Dean’in iblis tarafından ele geçirilmiş bir adam tarafından öldürüldüğünün görüşünü yaşar. Kardeşler Sam’in bu görüşünü araştırmak için Oregon’daki Grove Nehri’ne giderler ve şehirdekilerin, insanları öldürmelerine yol açan ölümcül bir virüsün etkisi altında olduklarını görürler. Sam’e de virüs bulaşır ve ölümcül sonunu bekler ancak ona bir şey olmaz. Dean itiraf etmeye karar verir ve John’ın ölmeden önce ona söylediği şeyi açıklar.', 1, 0, '2006-12-07', '2021-02-14 17:03:49', NULL),
(171, 0, 1, 5, 10, '10.Bölüm', 'Avlanan', 'Dean, babalarının ölmeden önce ona söylediği şeyi Sam’e anlattıktan sonra Sam, Dean’E söylemeden Indiana’ya doğru yola çıkar. Orada Sam’i kaderi hakkında uyarmak için aramakta olan Ava Wilson adında bir psişik ile karşılaşır. Bu sırada Dean kardeşinin izini sürer ve Sam’in bir canavar olduğunu düşünen Gordon Walker’ın onu öldürmeye çalıştığını öğrenir.', 1, 0, '2007-01-11', '2021-02-14 17:03:49', NULL),
(172, 0, 1, 5, 11, '11.Bölüm', 'Oyuncak', 'Sam ve Dean, kızı sürekli bir hayali arkadaşı ile oynayan, bekar bir anne tarafından işletilen Connecticut’daki küçük bir oteldeki iki tuhaf ölümü araştırırlar. Anne kız işletmeyi satarak taşınmayı planlamaktadırlar. Bu sırada Sam ve Dean otelde voodoo işareti olan kafaları tersine çevrilmiş tuhaf oyuncak bebekler bulurlar ve sonra kızın hayali arkadaşının kasabadaki ölümlerin arkasındaki hayalet olup olmadığını düşünürler.', 1, 0, '2007-01-18', '2021-02-14 17:03:49', NULL),
(173, 0, 1, 5, 12, '12.Bölüm', 'Şekil Değiştiren', 'Sam ve Dean rahatsız edici benzerlikleri olan bir dizi soygunu araştırırlar. Her soygunda, üst yetkili bir eleman bankayı soyup intihar etmektedir. Winchesterlar olayın ardında bir şekil-değiştirenin olduğunu fark eder.', 1, 0, '2007-01-25', '2021-02-14 17:03:49', NULL),
(174, 0, 1, 5, 13, '13.Bölüm', 'Kutsal Evler', 'Winchester kardeşler, bir melek tarafından ziyaret edildiklerini ve sadece Tanrı’nın isteğini yerine getirdiklerini söyleyen kişiler tarafından işlenmiş cinayetleri araştırırlar. Araştırmalardan sonra kardeşler bu katillerin aslında gizli suçlar işleyen kişiler olduğunu öğrendikten sonra Sam bunun gerçekten bir meleğin işi olduğunu düşünür ama Dean bunu reddeder ve ölümlerin ardında bir iblisin olduğunu düşünür -ta ki açıklanamayan şeyi görene kadar.', 1, 0, '2007-02-01', '2021-02-14 17:03:49', NULL),
(175, 0, 1, 5, 14, '14.Bölüm', 'Kötü Bir İşaret Altında Doğdu', 'Bir haftadır kayıp olan kardeşinden çağrı aldıktan sonra Dean, Sam’in yanına gider. Sam kanlar içindedir ve olanları hatırlamamaktadır. Durumu araştıran kardeşler Sam’in soğukkanlılıkla başka bir avcıyı öldürdüğünü gösteren bir kaset bulurlar, bu da Sam’in karanlık tarafının onu ele geçirdiğine inanmasına neden olur.', 1, 0, '2007-02-08', '2021-02-14 17:03:49', NULL),
(176, 0, 1, 5, 15, '15.Bölüm', 'Uzun Masallar', 'Sam ve Dean gerçekleşmeye başlayan halk hikayelerini araştırırlar. Kardeşler sürekli kavga etmeye başlayınca aile dostları Bobby’i ararlar. Daha sonra bu olayların arkasında \"Hileci\"nin olduğunu öğrenirler.', 1, 0, '2007-02-15', '2021-02-14 17:03:49', NULL),
(177, 0, 1, 5, 16, '16.Bölüm', 'Asfalt Leşi', 'Terkedilmiş bir yolda sürerken Sam ve Dean, kendisini kovalayan deli bir çiftçiden kaçarken yardım çığlığı atarak Impala’nın önüne çıkan Molly adında, kanlar içinde bir kadın tarafından şaşkına uğrarlar. Sam ve Dean olayı araştırırlar ve ortaya çıkar ki adam aslında her yıl aynı zamanda bir kişiyi öldüren kızgın bir ruhtur ve sıradaki kurban Molly’dir.', 1, 0, '2007-03-15', '2021-02-14 17:03:49', NULL),
(178, 0, 1, 5, 17, '17.Bölüm', 'Kalp', 'Vahşi bir hayvan tarafından öldürülmüş gibi görünen bir avukatın ölümünü araştırırken Sam ve Dean kendilerini bir kurt adamın izini sürerken bulurlar. Sam avukatın sekreteri Madison’dan hoşlanmaya başlar ve Madison’ın kurt adamın sıradaki kurbanı olacağını sanarak, onu korumak için gece yatıya kalmayı teklif eder. Dean hayvanı yakalamak için ortaya çıkar ve bulduğu şey karşısında şaşkına uğrar.', 1, 0, '2007-03-22', '2021-02-14 17:03:49', NULL),
(179, 0, 1, 5, 18, '18.Bölüm', 'Hollywood Babylon', 'Sam ve Dean, bir hayalet tarafından öldürüldüğü söylentisi yayılınca, korku filmi setindeki aktörlerden birinin ölümünü araştırmak için Hollywood’a giderler. Ölümün halk kandırmacası olduğu ortaya çıkar ancak yapımcı yönetmen ve bir stüdyo yetkilisi öldürülünce Sam ve Dean hayaletli bir set ile uğraştıklarını anlarlar.', 1, 0, '2007-04-19', '2021-02-14 17:03:49', NULL),
(180, 0, 1, 5, 19, '19.Bölüm', 'Folsom Prison Blues', 'Bir hayaletin hapishanedekileri teker teker öldürdüğünü duyunca, Sam ve Dean bu ruhu öldürmenin en iyi yolunun içeriden olduğuna karar verirler ve eyalet hapishanesine girebilmek için kendilerini tutuklatırlar. FBI Ajanı Henricksen soruşturmayı devralınca, kardeşler hapishaneden çıkmanın hayaleti bulmaktan daha zor olduğunu fark ederler.', 1, 0, '2007-04-26', '2021-02-14 17:03:49', NULL),
(181, 0, 1, 5, 20, '20.Bölüm', 'Nedir ve Asla Ne Olmamalı', 'Bir Djinn’i avlarken Dean saldırıya uğrar ve annesinin hala hayatta olduğu Sam’in hukuk fakültesinde, Jessica ile nişanlı olduğu ve Dean’in de kız arkadaşı ile normal bir hayat yaşadığı bir dünyaya ışınlanır. Ancak, tuhaf bir kız görmeye başladıktan sonra öğrenir ki geçmişte kurtardığı tüm o insanlar ölmüştür. Dean bu yeni güvenli yaşantısında sevdikleri ile kalmak ve avlanmaya geri dönmek arasında bir seçim yapmak zorundadır.', 1, 0, '2007-05-03', '2021-02-14 17:03:49', NULL),
(182, 0, 1, 5, 21, '21.Bölüm', 'Tüm Cehennem Gevşiyor - 1', 'Sam, Sarı Gözlü İblis tarafından kaçırılır ve kendisini, diğer özel yetenekli çocuklarla hayalet bir kasabada bulur. İblis’in onları buraya en güçlüyü belirlemek için getirdiklerini öğrenirler. Sam’i savaşmaya teşvik etmek için İblis ona ailesinin ölümünün arkasındaki gerçeği açıklar. Bu sırada Dean ve Bobby’i birleşip savaş çıkmadan önce Sam’i kurtarmaya çalışırlar ama ne yazık ki çok geç kalırlar.', 1, 0, '2007-05-10', '2021-02-14 17:03:49', NULL),
(183, 0, 1, 5, 22, '22.Bölüm', 'Tüm Cehennem Gevşiyor - 2', 'Dean, Sam’in ölümünü kabullenmeyi reddeder ve büyük bir fedakarlık yapar. Bu sırada İblis, Jake’i Dünya’yı ele geçirme planında kullanır. Sam ve Dean çok geç olmadan onu alt etmelidirler.', 1, 0, '2007-05-17', '2021-02-14 17:03:49', NULL),
(184, 0, 1, 4, 1, '1.Bölüm', 'Pilot', 'Küçük yaşta Sam ve Dean\'in annesinin açıklanamayan bir biçimde ölmesiyle babalarıyla birlikte doğaüstü güçleri avlamaya başlarlar. Yıllar sonra Sam avcılığı bırakır ve üniversiteye başlar. Bir gün Dean Sam\'in evine gelir ve babalarının ava gittiğini ve dönmediğini söyler.', 1, 0, '2005-09-13', '2021-02-14 17:04:21', NULL),
(185, 0, 1, 4, 2, '2.Bölüm', 'Wendigo', 'Sam ve Dean babalarının günlüğünü kullanarak bir kampçı grubunun Wendigo adındaki bir yaratık tarafından kaçırılıp öldürüldüğünü öğrenir ve onları kurtarmak için kampçıların arkadaşlarıyla işbirliği yaparlar.', 1, 0, '2005-09-20', '2021-02-14 17:04:21', NULL),
(186, 0, 1, 4, 3, '3.Bölüm', 'Suda Ölüm', 'Manitoc Gölü\'ndeki esrarengiz ölümle ilgilenen Sam ve Dean bu ölümün sebebini bulmak için Wisconsin\'e gelirler. Yaratığın İntikamcı Ruh olduğunu öğrenirler ve avlarlar.', 1, 0, '2005-09-27', '2021-02-14 17:04:21', NULL),
(187, 0, 1, 4, 4, '4.Bölüm', 'Hayalet Gezgin', 'Sam ve Dean bir şeytanın pilotun içine girerek uçağı düşürdüğünü söyleyen birinden telefon alır. Sam ve Dean bir sonraki şeytan faaliyetinin nerede olacağını saptar ve uçağa biner ancak Dean uçaktan korkmaktadır ve bu Dean için çok zor olacaktır.', 1, 0, '2005-10-04', '2021-02-14 17:04:21', NULL),
(188, 0, 1, 4, 5, '5.Bölüm', 'Kanlı Mary', 'Sam ve Dean aynanın karşısında gözleri oyulmuş ölü bir adamın ölüm nedenini araştırırken bu olayı Bloody Mary\'nin yaptığını bulurlar. Ve Bloody Mary\'i avlarlar.', 1, 0, '2005-10-11', '2021-02-14 17:04:21', NULL),
(189, 0, 1, 4, 6, '6.Bölüm', 'Deri', 'Sam\'in kolejden arkadaşı Zach sevgilisini öldürmekten tutuklanır ve Sam bu haberi duyunca Zach\'in bunu yapmayacağını, bu olayın arkasında doğaüstü bir şeyin olduğunu söyler ve Winchester kardeşler araştırmaya başlar. Bu şeyin Şekil Değiştiren olduğunu öğrenirler ve avlarlar.', 1, 0, '2005-10-18', '2021-02-14 17:04:21', NULL),
(190, 0, 1, 4, 7, '7.Bölüm', 'Kanca Adam', 'Sam ve Dean kolejden bir öğrencinin ölümünü araştırmaya başlar. Ölen çocuğun kız arkadaşı olan Lori erkek arkadaşına görünmez birinin saldırdığını söyler. Daha sonra olayların Lori\'ye bağlı olduğunu öğrenirler. Ve yaratığın bir hayalet olduğunu öğrendiklerinde bu hayaleti avlarlar.', 1, 0, '2005-10-25', '2021-02-14 17:04:21', NULL),
(191, 0, 1, 4, 8, '8.Bölüm', 'Böcekler', 'Sam ve Dean inşaat sırasında bir adamın aniden açılan bir çukura düşüp esrarengiz bir biçimde ölmesini araştırır. Bu araştırmanın sonunda katilin böcekler olduğunu bulurlar.', 1, 0, '2005-11-08', '2021-02-14 17:04:21', NULL),
(192, 0, 1, 4, 9, '9.Bölüm', 'Ev', 'Sam gece kabuslar görmeye başlar ve bunun üzerine kabusundaki evi bulmaya çalışırlar. Evin eski yaşadıkları ev olduğunu öğrenince evin içindeki şeytanın annelerini öldüren şeytanın aynısı olabileceğinden şüphelenirler.', 1, 0, '2005-11-15', '2021-02-14 17:04:21', NULL),
(193, 0, 1, 4, 10, '10.Bölüm', 'İltica', 'Sam ve Dean perili bir akıl hastanesini araştırmak için Rockford, Illinois\'e gider ama burada ruh Sam\'in içine girecektir ve Dean\'i öldürmeye çalışacaktır.', 1, 0, '2005-11-22', '2021-02-14 17:04:21', NULL),
(194, 0, 1, 4, 11, '11.Bölüm', 'Korkuluk', 'Sam ve Dean bir çiftin Indiana\'da bir kasabada esrarengiz bir biçimde kaybolmasını araştırmaya gider ancak yolda Sam ve Dean kavga eder ve Sam çantasını alarak yola koyulur. Dean ise kasabaya gider.', 1, 0, '2006-01-10', '2021-02-14 17:04:21', NULL),
(195, 0, 1, 4, 12, '12.Bölüm', 'İnanç', 'Sam ve Dean Bloody Bones adlı yaratıkla mücadele verirken Dean\'e elektrik çarpar ve kalbi büyük oranda zarar görür. Dean\'i kurtarmak için Sam bir medyum bulur ve medyum Dean\'i iyileştirir ama bu olayın bir azrail ile ilgili olduğunu anlamaları uzun sürmez. Medyum bir kişiyi iyileştirdiğinde bir başkası ölmektedir.', 1, 0, '2006-01-17', '2021-02-14 17:04:21', NULL),
(196, 0, 1, 4, 13, '13.Bölüm', '666 No\'lu Otoyol', 'Dean\'i eski kız arkadaşı arar ve babasının esrarengiz bir biçimde öldüğünü söyler. Bunun üzerine Sam ve Dean olayı araştırmaya başlar ve bu olayın öfkeli bir ruh tarafından yapıldığını anlar.', 1, 0, '2006-01-31', '2021-02-14 17:04:21', NULL),
(197, 0, 1, 4, 14, '14.Bölüm', 'Kabus', 'Sam bir rüya görür ve bu rüyası gerçekleşir. Bu olayı araştırırlarken anneleri aynı şekilde ölmüş bir çocukla tanışırlar ve o da Sam gibi ilginç özelliklere sahiptir.', 1, 0, '2006-02-07', '2021-02-14 17:04:21', NULL),
(198, 0, 1, 4, 15, '15.Bölüm', 'Bükücüler', 'Bir adamın birden ortadan kaybolduğunu söyleyen bir çocuğu dinleyen Sam ve Dean olayı araştırmaya başlar ancak bu olayın ardında doğaüstü bir olayın değil psikopat bir ailenin olduğunu bulur.', 1, 0, '2006-02-14', '2021-02-14 17:04:21', NULL),
(199, 0, 1, 4, 16, '16.Bölüm', 'Gölge', 'Sam ve Dean bir gölge şeytanını araştırırken, Sam haftalar önce otobüs durağında tanıştığı Meg ile yeniden karşılaşır. Daha sonra kızın şeytan olduğunu ve babalarını tuzağa düşürmek istediğini anlarlar. Kız pencereden düşer ve öldüğünü sanırlar fakat şeytan hala içinde yaşıyordur.', 1, 0, '2006-02-28', '2021-02-14 17:04:21', NULL),
(200, 0, 1, 4, 17, '17.Bölüm', 'Cehennem Evi', 'Sam ve Dean perili bir evi araştırırken içinde yaşayan Mordecai adlı yaratığı insanların hayal gücünün yarattığını fark ederler ve bu yaptıkları iş hakkında düşünmelerini sağlar.', 1, 0, '2006-03-30', '2021-02-14 17:04:21', NULL),
(201, 0, 1, 4, 18, '18.Bölüm', 'Kötü Şeyler', 'Sam ve Dean küçük bir kasabadaki çocuk hastalığını araştırırken bu olayın çocukların yaşam enerjisini çalan Shtriga adlı yaratıkla bağlantılı olduğunu görürler.', 1, 0, '2006-04-06', '2021-02-14 17:04:21', NULL),
(202, 0, 1, 4, 19, '19.Bölüm', 'Kaynak', 'Genç bir çift 1910\'lara ait bir aile portresi olan antika resmi satın aldıktan kısa bir süre sonra evlerinde öldürülür. Resmin geçmişinin incelenmesi üzerine, Sam ve Dean resmi satın alan herkesin öldürüldüğünü öğrenirler ve ve onun bir sonraki kurbanını tahmin etmeden önce portrenin nasıl ölümlere neden olduğunu keşfetmek için hızlı çalışırlar.', 1, 0, '2006-04-13', '2021-02-14 17:04:21', NULL),
(203, 0, 1, 4, 20, '20.Bölüm', 'Ölü Adamın Kanı', 'Vampir faaliyetlerinin Colorado\'da görülmesi üzerine Sam ve Dean\'in babası ortaya çıkar ve her şeyi öldürme gücüne sahip olan Colt adlı silahın vampirlerin elinde olduğunu söyler. Silahı ele geçirdiklerinde babaları vampire ateş eder ve mermi vampiri yok eder. Ayrıca bu bölümde ölü bir insanın kanının vampirleri zehirlediğini öğrenirler.', 1, 0, '2006-04-20', '2021-02-14 17:04:21', NULL),
(204, 0, 1, 4, 21, '21.Bölüm', 'Kurtuluş', 'Meg John\'un papaz olan arkadaşını öldürür ve Colt\'u almak için plan kurar ancak John\'un da planları vardır.', 1, 0, '2006-04-27', '2021-02-14 17:04:21', NULL),
(205, 0, 1, 4, 22, '22.Bölüm', 'Şeytan Tuzağı', 'Sam ve Dean, Bobby Singer\'ın evindeki şeytan kapanıyla Meg\'i yakalayıp cehenneme gönderirler ve babalarını kurtarırlar ancak şeytanın içine girdiği bir tır sürücüsü arabalarına çarpar ve ağır yaralanırlar.', 1, 0, '2006-05-04', '2021-02-14 17:04:21', NULL),
(241, 0, 70, 82, 8, '8.Bölüm', 'Kitaptaki Gerçek', 'Walt, Mike\'ın hapishanedeki adamlarının isimlerini öğrenmek için Lydia ile buluşur. Skyler, uyuşturucu üretmeyi bırakması için Walt\'u bir kez daha ikna etmeye çalışır.', 1, 0, '2012-09-02', '2021-02-14 17:53:42', NULL),
(240, 0, 70, 82, 7, '7.Bölüm', 'Adımı Söyle', 'Walter, Declan\'la bir anlaşma yapmaya çalışır. Mike\'tan elini çekmesi istenen Hank, tüm dikkatini Mike\'ın adamlarına ödeme yapan avukata çevirir.', 1, 0, '2012-08-26', '2021-02-14 17:53:42', NULL),
(239, 0, 70, 82, 6, '6.Bölüm', 'Satınalma', 'Walt, Mike ve Jesse metilamin soygununun sonuçlarıyla boğuşmaktadır. Mike ve Jesse bu işleri bırakmayı isterlerken Walt, kendi imparatorluğunu kurmaya kararlıdır.', 1, 0, '2012-08-19', '2021-02-14 17:53:42', NULL),
(238, 0, 70, 82, 5, '5.Bölüm', 'Ölü Navlun', 'Mike ve Lydia, operasyon için metilamin sevkıyatını ayarlamaya çalışırlar. Walt ve Jesse, gerçek kimliklerini açığa çıkarmayacak bir plan yapmaya çalışırlar.', 1, 0, '2012-08-12', '2021-02-14 17:53:42', NULL),
(236, 0, 70, 82, 3, '3.Bölüm', 'Ödeme', 'Skyler için korkutucu olsa da Walter tekrar eve döner. Walter, Mike ve Jesse, uyuşturucu üretecekleri yeni bir yer bulma konusunu konuşmak için Saul\'la buluşurlar.', 1, 0, '2012-07-29', '2021-02-14 17:53:42', NULL),
(237, 0, 70, 82, 4, '4.Bölüm', 'Elli Bir', 'Lydia, kendi çalışanını Narkotik\'e ihbar ederken Mike, onun yerine Jesse\'yi işe almasını önerir. Walt ve Skyler, ailenin güvende olup olmadığı konusunda tartışırlar.', 1, 0, '2012-08-05', '2021-02-14 17:53:42', NULL),
(235, 0, 70, 82, 2, '2.Bölüm', 'Madrigal', 'Walt ve Jesse, son işte kendilerine yardım edecek yeni bir ortak bulmaya karar verirler. Narkotik de bir şeyler bulmak umuduyla çeşitli ipuçlarını elden geçirmektedir.', 1, 0, '2012-07-22', '2021-02-14 17:53:42', NULL),
(234, 0, 70, 82, 1, '1.Bölüm', 'Ya Özgürlük Ya Ölüm', 'Walt, halen koruma altında bulunan ailesini görmeye giderken bir taraftan da Casa Tranquila\'daki patlamanın sonuçlarıyla boğuşmaktadır.', 1, 0, '2012-07-15', '2021-02-14 17:53:42', NULL),
(242, 0, 70, 82, 9, '9.Bölüm', 'Kanlı Para', 'Walt ve Jesse, işten uzak bir hayata uyum sağlamaya çalışırlarken Hank, önemli bir ipucu yakalar.', 1, 0, '2013-08-11', '2021-02-14 17:53:42', NULL),
(243, 0, 70, 82, 10, '10.Bölüm', 'Gömülü', 'Skyler\'ın geçmişi onu rahat bırakmazken Walt, kendi izlerini siler. Jesse ise, suçluluk duygusuyla mücadele etmeye devam eder.', 1, 0, '2013-08-18', '2021-02-14 17:53:42', NULL),
(244, 0, 70, 82, 11, '11.Bölüm', 'İtiraflar', 'Jesse bir değişiklik yapmaya karar verirken Walt ve Skyler beklenmedik bir taleple başa çıkmaya çalışırlar.', 1, 0, '2013-08-25', '2021-02-14 17:53:42', NULL),
(245, 0, 70, 82, 12, '12.Bölüm', 'Kuduz Köpek', 'Her şeyi değiştirebilecek planlar eyleme geçirilirken alışılmadık bir strateji meyvelerini vermeye başlar.', 1, 0, '2013-09-01', '2021-02-14 17:53:42', NULL),
(246, 0, 70, 82, 13, '13.Bölüm', 'Korkak', 'İşler, Walt için beklenmedik şekilde gelişiyor.', 1, 0, '2013-09-08', '2021-02-14 17:53:42', NULL),
(247, 0, 70, 82, 14, '14.Bölüm', 'Kaçınılmaz Son', 'Dizinin sonuna yaklaşıldıkça herkes, radikal değişimlere uyum sağlamaya çalışmaktadır.', 1, 0, '2013-09-15', '2021-02-14 17:53:42', NULL),
(248, 0, 70, 82, 15, '15.Bölüm', 'Yarım Kalan Bir İş', 'Dizinin sondan bir önceki bölümünde, çok önceden eyleme geçirilen olaylar sonuçlanmak üzeredir.', 1, 0, '2013-09-22', '2021-02-14 17:53:42', NULL),
(249, 0, 70, 82, 16, '16.Bölüm', 'Elveda (Final)', 'Ödüllü dizi, dramatik bir finalle sona eriyor.', 1, 0, '2013-09-29', '2021-02-14 17:53:42', NULL),
(250, 0, 70, 77, 1, '1.Bölüm', '1. Bölüm', '', 1, 0, '2009-02-17', '2021-02-14 18:22:06', NULL),
(251, 0, 70, 77, 2, '2.Bölüm', '2. Bölüm', '', 1, 0, '2009-02-17', '2021-02-14 18:22:06', NULL),
(252, 0, 70, 77, 3, '3.Bölüm', '3. Bölüm', '', 1, 0, '2009-02-17', '2021-02-14 18:22:06', NULL),
(253, 0, 70, 77, 4, '4.Bölüm', '4. Bölüm', '', 1, 0, '2009-02-17', '2021-02-14 18:22:06', NULL),
(254, 0, 70, 77, 5, '5.Bölüm', '5. Bölüm', '', 1, 0, '2009-02-24', '2021-02-14 18:22:06', NULL),
(255, 0, 70, 77, 6, '6.Bölüm', '6. Bölüm', '', 1, 0, '2021-02-15', '2021-02-14 18:22:06', NULL),
(256, 0, 70, 77, 7, '7.Bölüm', '7. Bölüm', '', 1, 0, '2021-02-15', '2021-02-14 18:22:06', NULL),
(257, 0, 70, 77, 8, '8.Bölüm', '8. Bölüm', '', 1, 0, '2021-02-15', '2021-02-14 18:22:06', NULL),
(258, 0, 70, 77, 9, '9.Bölüm', '9. Bölüm', '', 1, 0, '2021-02-15', '2021-02-14 18:22:06', NULL),
(259, 0, 70, 77, 10, '10.Bölüm', '10. Bölüm', '', 1, 0, '2021-02-15', '2021-02-14 18:22:06', NULL),
(260, 0, 70, 77, 11, '11.Bölüm', '11. Bölüm', '', 1, 0, '2021-02-15', '2021-02-14 18:22:06', NULL);
INSERT INTO `dizi_bolum` (`bolum_id`, `rank`, `dizi_id`, `sezon_id`, `bolum_kod`, `bolum_adi`, `bolum_baslik`, `bolum_ozet`, `bolum_durum`, `bolum_izlenme_durum`, `bolum_tarih`, `createdAt`, `updatedAt`) VALUES
(261, 0, 70, 77, 12, '12.Bölüm', '12. Bölüm', '', 1, 0, '2021-02-15', '2021-02-14 18:22:06', NULL),
(262, 0, 70, 77, 13, '13.Bölüm', '13. Bölüm', '', 1, 0, '2021-02-15', '2021-02-14 18:22:06', NULL),
(263, 0, 70, 77, 14, '14.Bölüm', '14. Bölüm', '', 1, 0, '2021-02-15', '2021-02-14 18:22:06', NULL),
(264, 0, 70, 77, 15, '15.Bölüm', '15. Bölüm', '', 1, 0, '2021-02-15', '2021-02-14 18:22:06', NULL),
(265, 0, 70, 77, 16, '16.Bölüm', '16. Bölüm', '', 1, 0, '2021-02-15', '2021-02-14 18:22:06', NULL),
(266, 0, 70, 77, 17, '17.Bölüm', '17. Bölüm', '', 1, 0, '2021-02-15', '2021-02-14 18:22:06', NULL),
(267, 0, 70, 77, 18, '18.Bölüm', '18. Bölüm', '', 1, 0, '2021-02-15', '2021-02-14 18:22:06', NULL),
(268, 0, 70, 77, 19, '19.Bölüm', '19. Bölüm', '', 1, 0, '2021-02-15', '2021-02-14 18:22:06', NULL),
(269, 0, 70, 77, 20, '20.Bölüm', '20. Bölüm', '', 1, 0, '2021-02-15', '2021-02-14 18:22:06', NULL),
(270, 0, 70, 77, 21, '21.Bölüm', '21. Bölüm', '', 1, 0, '2021-02-15', '2021-02-14 18:22:06', NULL),
(271, 0, 70, 77, 22, '22.Bölüm', '22. Bölüm', '', 1, 0, '2021-02-15', '2021-02-14 18:22:06', NULL),
(272, 0, 70, 77, 23, '23.Bölüm', '23. Bölüm', '', 1, 0, '2021-02-15', '2021-02-14 18:22:06', NULL),
(273, 0, 70, 77, 24, '24.Bölüm', '24. Bölüm', '', 1, 0, '2021-02-15', '2021-02-14 18:22:06', NULL),
(274, 0, 70, 77, 25, '25.Bölüm', '25. Bölüm', '', 1, 0, '2021-02-15', '2021-02-14 18:22:06', NULL),
(275, 0, 70, 77, 26, '26.Bölüm', '26. Bölüm', '', 1, 0, '2021-02-15', '2021-02-14 18:22:06', NULL),
(276, 0, 70, 77, 27, '27.Bölüm', '27. Bölüm', '', 1, 0, '2021-02-15', '2021-02-14 18:22:06', NULL),
(277, 0, 70, 77, 28, '28.Bölüm', '28. Bölüm', '', 1, 0, '2021-02-15', '2021-02-14 18:22:06', NULL),
(278, 0, 70, 77, 29, '29.Bölüm', '29. Bölüm', '', 1, 0, '2021-02-15', '2021-02-14 18:22:06', NULL),
(279, 0, 70, 77, 30, '30.Bölüm', '30. Bölüm', '', 1, 0, '2021-02-15', '2021-02-14 18:22:06', NULL),
(280, 0, 70, 77, 31, '31.Bölüm', '31. Bölüm', '', 1, 0, '2021-02-15', '2021-02-14 18:22:06', NULL),
(281, 0, 70, 77, 32, '32.Bölüm', '32. Bölüm', '', 1, 0, '2021-02-15', '2021-02-14 18:22:06', NULL),
(282, 0, 70, 77, 33, '33.Bölüm', '33. Bölüm', '', 1, 0, '2021-02-15', '2021-02-14 18:22:06', NULL),
(283, 0, 70, 77, 34, '34.Bölüm', '34. Bölüm', '', 1, 0, '2021-02-15', '2021-02-14 18:22:06', NULL),
(284, 0, 70, 77, 35, '35.Bölüm', '35. Bölüm', '', 1, 0, '2021-02-15', '2021-02-14 18:22:06', NULL),
(285, 0, 70, 77, 36, '36.Bölüm', '36. Bölüm', '', 1, 0, '2021-02-15', '2021-02-14 18:22:06', NULL),
(286, 0, 70, 77, 37, '37.Bölüm', '37. Bölüm', '', 1, 0, '2021-02-15', '2021-02-14 18:22:06', NULL),
(287, 0, 70, 77, 38, '38.Bölüm', '38. Bölüm', '', 1, 0, '2021-02-15', '2021-02-14 18:22:06', NULL),
(288, 0, 70, 77, 39, '39.Bölüm', '39. Bölüm', '', 1, 0, '2021-02-15', '2021-02-14 18:22:06', NULL),
(289, 0, 70, 77, 40, '40.Bölüm', '40. Bölüm', '', 1, 0, '2021-02-15', '2021-02-14 18:22:06', NULL),
(290, 0, 70, 77, 41, '41.Bölüm', '41. Bölüm', '', 1, 0, '2019-10-11', '2021-02-14 18:22:06', NULL),
(298, 0, 70, 81, 1, '1.Bölüm', 'Maket Bıçağı', 'Üçüncü sezonun sonunda Walt ve Jesse, gerilimin zirveye ulaştığı olayların tam ortasındaydı. Şimdi, ikisi de tedirginlik içinde Gus\'ın bir sonraki hamlesini bekliyor.', 1, 0, '2011-07-17', '2021-02-15 00:03:30', NULL),
(299, 0, 70, 81, 2, '2.Bölüm', 'Otuzsekizlik', 'Walt, Gus\'a karşı savunmasını hazırlarken Jesse üzerindeki baskılarla başa çıkabilmek için Badger ve Skinny Pete\'le barışır.', 1, 0, '2011-07-24', '2021-02-15 00:03:30', NULL),
(300, 0, 70, 81, 3, '3.Bölüm', 'Açık Ev', 'Walt, Gus\'ın hamlesinden ve Jesse\'nin gittikçe kırılganlaşan ruh halinden endişelenirken Skyler da, istediğini elde etmek için baskıyı daha da artırır.', 1, 0, '2011-07-31', '2021-02-15 00:03:30', NULL),
(301, 0, 70, 81, 4, '4.Bölüm', 'Kurşun Delikleri', 'Skyler, White ailesinin mali durumunu açıklamak için ayrıntılı bir hikaye uydururken endişeli Walt, Hank\'in yeni bir soruşturma başlattığını öğrenir.', 1, 0, '2011-08-07', '2021-02-15 00:03:30', NULL),
(302, 0, 70, 81, 5, '5.Bölüm', 'Kahraman', 'Çölün derinliklerinde ilerleyen arabanın direksiyonunda Mike, yanında ise Jesse vardır. Walt ise, ortağının öldürülmesinden korkmaktadır.', 1, 0, '2011-08-14', '2021-02-15 00:03:30', NULL),
(303, 0, 70, 81, 6, '6.Bölüm', 'Köşeye Sıkışmak', 'Walt\'un ona gerçekleri söylemediğinden şüphelenen Skyler mesafeli bir tutum takınır. Bu arada Jesse neler yapabileceğini Mike ve Gus\'a gösterir.', 1, 0, '2011-08-21', '2021-02-15 00:03:30', NULL),
(304, 0, 70, 81, 7, '7.Bölüm', 'Sorun Çıkaran Köpek', 'Skyler Walt\'tan oğluna aldığı arabayı iade etmesini ister. Walt yeni para aklama operasyonunda Skyler\'ı zor duruma sokarak tepki gösterir.', 1, 0, '2011-08-28', '2021-02-15 00:03:30', NULL),
(305, 0, 70, 81, 8, '8.Bölüm', 'Hermanos', 'Hank, Albuquerque\'deki metamfetamin işinin patronunun Gus olduğuna dair kanıt bulunca, Walt patronu korumak için Jesse\'yi ve kendisini öldüreceklerinden korkmaya başlar.', 1, 0, '2011-09-04', '2021-02-15 00:03:30', NULL),
(306, 0, 70, 81, 9, '9.Bölüm', 'Böcek', 'Walt, Hank\'in Albuquerque\'deki metamfetamin piyasasına yönelik araştırmasını önlemeye çalışırken, ölümcül bir uyarı Gus’ı Meksika karteliyle anlaşmayı düşünmeye iter.', 1, 0, '2011-09-11', '2021-02-15 00:03:30', NULL),
(307, 0, 70, 81, 10, '10.Bölüm', 'Şerefe', 'Walt\'un kavgada aldığı yaralar hala iyileşmemiştir. Gus, kartelle anlaşma yapmak için Jesse\'yi de beraberinde Meksika\'ya sürükler.', 1, 0, '2011-09-18', '2021-02-15 00:03:30', NULL),
(308, 0, 70, 81, 11, '11.Bölüm', 'Yaklaşan Tehlike', 'Skyler, Ted\'e vergilerini ödemesi için önerdiği parayı kabul ettirmek için baskı yapar. Gus, Jesse\'nin laboratuvarda yalnız başına tekrar işe başlamasında ısrar eder.', 1, 0, '2011-09-25', '2021-02-15 00:03:30', NULL),
(309, 0, 70, 81, 12, '12.Bölüm', 'Son Zamanlar', 'Narkotik\'in Hank\'e sağladığı korumadan ailesinin de yararlanmasını isteyen Walt, kaderinde yazılı olanla yüzleşmeyi bekler.', 1, 0, '2011-10-02', '2021-02-15 00:03:30', NULL),
(310, 0, 70, 81, 13, '13.Bölüm', 'Yüzleşme (Sezon Finali)', 'Gus\'ı öldürme planları suya düşen Walt ve Jesse, izlerini silmek ve öldürülmemek için çabuk davranmalıdır.', 1, 0, '2011-10-09', '2021-02-15 00:03:30', NULL),
(311, 0, 70, 80, 1, '1.Bölüm', 'Terk', 'Uçak faciasının sonrasında Skyler, Walt\'u evden ayrılmaya zorlarken terapi, Jesse\'nin kazayla ilgili hissettiği sorumlulukla yüzleşmesine yardımcı olur.', 1, 0, '2010-03-21', '2021-02-15 00:03:33', NULL),
(312, 0, 70, 80, 2, '2.Bölüm', 'Çatıdaki Pizza', 'Skyler, boşanmayı kafasına koyarken hiçbir şeyden haberi olmayan Walt da, Meksikalı uyuşturucu karteline çalışan, intikam peşindeki iki tetikçinin hedefi haline gelir.', 1, 0, '2010-03-28', '2021-02-15 00:03:33', NULL),
(313, 0, 70, 80, 3, '3.Bölüm', 'İhanet', 'Walt, Skyler\'ın blöfünü görüp onun onayı olmadan eve geri taşınınca tansiyon yükselir. Jesse ise, uyuşturucu ticaretine geri dönmeyi düşünmektedir.', 1, 0, '2010-04-04', '2021-02-15 00:03:33', NULL),
(314, 0, 70, 80, 4, '4.Bölüm', 'Yeşil Işık', 'Jesse, yeni üretim metamfetaminle işlere geri dönünce Walt da, müdahil olur. Skyler ise, patronuyla yaşadığı ilişkiden dolayı sıkıntılı bir dönemden geçmektedir.', 1, 0, '2010-04-11', '2021-02-15 00:03:33', NULL),
(315, 0, 70, 80, 5, '5.Bölüm', 'Devam', 'Skyler, Walt\'un dönüşüne karşı tavrını gözden geçirirken Walt da, uyuşturucu ticaretine geri dönmeyi düşünür. Hank\'in takıntısı, Jesse\'ye pahalıya patlayacak gibidir.', 1, 0, '2010-04-18', '2021-02-15 00:03:33', NULL),
(316, 0, 70, 80, 6, '6.Bölüm', 'Gün Batımı', 'Eski karavanlarının bulunması, Walt ve Jesse\'yi hızlı hareket etmeye iterken Walt, Gus\'ın en son teknolojiyle donatılmış laboratuvarında işe geri döner.', 1, 0, '2010-04-25', '2021-02-15 00:03:33', NULL),
(317, 0, 70, 80, 7, '7.Bölüm', 'Bir Dakika', 'Hank, kariyerini riske atarak kendisine saldırınca Jesse, onu mahkemeye verip intikam almaya yemin eder. Skyler da, Jesse\'yi vazgeçirmesi için Walt\'tan yardım ister.', 1, 0, '2010-05-02', '2021-02-15 00:03:33', NULL),
(318, 0, 70, 80, 8, '8.Bölüm', 'Yoğun Bakım', 'Uyuşturucu kartelinin saldırısının ardından Hank hayatta kalma mücadelesi verirken Walt da, Jesse\'yi ortak olarak alıp beladan uzak durmaya çalışır.', 1, 0, '2010-05-09', '2021-02-15 00:03:33', NULL),
(319, 0, 70, 80, 9, '9.Bölüm', 'Kafka', 'Hank\'in tedavisiyle ilgili seçenekler Marie\'nin sigorta şirketiyle anlaşmazlığa düşmesine neden olur. Diğer yandan Jesse payını artırmanın yollarını arar.', 1, 0, '2010-05-16', '2021-02-15 00:03:33', NULL),
(320, 0, 70, 80, 10, '10.Bölüm', 'Sinek', 'Metamfetamin laboratuvarına giren ve bir türlü ölmek bilmeyen sinek yüzünden Walt ve Jesse\'yi uzun ve gergin bir gece beklemektedir.', 1, 0, '2010-05-23', '2021-02-15 00:03:33', NULL),
(321, 0, 70, 80, 11, '11.Bölüm', 'Son Kapı', 'Hank yeteri kadar hızlı iyileşemediğini düşündüğü için mutsuzdur, Skyler Saul\'un para aklama planını etraflıca sorgular. Jesse rehabilitasyondaki bir hastaya aşık olur.', 1, 0, '2010-05-30', '2021-02-15 00:03:33', NULL),
(322, 0, 70, 80, 12, '12.Bölüm', 'Yetersiz Önlem', 'Jesse Combo\'nun cinayetini planlayan satıcıların peşine düşer. Hank hastaneden çıkmayı kabul etmez. Skyler, kendi planını uygulaması için Walt\'a baskı yapar.', 1, 0, '2010-06-06', '2021-02-15 00:03:33', NULL),
(323, 0, 70, 80, 13, '13.Bölüm', 'Yeterli Önlem (Sezon Finali)', 'Patronunun sokak satıcılarından ikisini öldürdükten sonra Walt, Gus\'ın kendisini ve Jesse\'yi öldürüp işe eski yardımcısıyla devam etmeyi planladığını fark eder.', 1, 0, '2010-06-13', '2021-02-15 00:03:33', NULL),
(324, 0, 70, 79, 1, '1.Bölüm', 'Yedi Yüz Otuz Yedi', 'Son büyük uyuşturucu vurgunlarını planlayan Walt ve Jesse, ellerindeki tek müşterinin de işine geldiği zaman gözünü kırpmadan onları öldürebileceğinden endişelidirler.', 1, 0, '2009-03-08', '2021-02-15 00:03:34', NULL),
(325, 0, 70, 79, 2, '2.Bölüm', 'Zil', 'Narkotik, Tuco\'yu yakalamak için bir insan avı başlatırken Skyler da, Walt\'u bulması için Hank\'den yardım ister.', 1, 0, '2009-03-15', '2021-02-15 00:03:34', NULL),
(326, 0, 70, 79, 3, '3.Bölüm', 'Ölü Arının İğnesi', 'Hank\'in, Walt\'un uyuşturucu işiyle olan bağlantısını keşfetmesine ramak kalır. O da, izini kaybettirmek için bir plan yapar.', 1, 0, '2009-03-22', '2021-02-15 00:03:34', NULL),
(327, 0, 70, 79, 4, '4.Bölüm', 'Özür', 'Walt, Skyler ile arasındaki buzları eritmek için uğraşırken ailesinin yanından kovulan Jesse, evsiz kalır.', 1, 0, '2009-03-29', '2021-02-15 00:03:34', NULL),
(328, 0, 70, 79, 5, '5.Bölüm', 'Hamamböcekleri', 'Hank, Tuco\'yla karşılaşmasının ardından toparlanmaya çalışırken Jesse, piyasaya daha çok ürün dağıtabilmek için bir ekip toplar.', 1, 0, '2009-04-05', '2021-02-15 00:03:34', NULL),
(329, 0, 70, 79, 6, '6.Bölüm', 'ATM', 'Jesse, Skinny Pete\'in uyuşturucu stokunu çalan bağımlıların peşine düşerken Walt da, tedavi masraflarını ödemek için bulduğu paranın kaynağına ilişkin bir bahane uydurur.', 1, 0, '2009-04-12', '2021-02-15 00:03:34', NULL),
(330, 0, 70, 79, 7, '7.Bölüm', 'Siyah ve Mavi', 'Jesse\'nin uyuşturucu baronu olarak anılmaya başlanması, Walt\'u operasyonu büyütmeye iterken Narkotiğin El Paso birimine geçiş yapmak, Hank\'i biraz sarsmıştır.', 1, 0, '2009-04-19', '2021-02-15 00:03:34', NULL),
(331, 0, 70, 79, 8, '8.Bölüm', 'Saul Goodman', 'Badger\'ın tutuklanması, Walt ve Jesse\'yi şaibeli bir avukatla işbirliği yapmaya mecbur bırakır.', 1, 0, '2009-04-26', '2021-02-15 00:03:34', NULL),
(332, 0, 70, 79, 9, '9.Bölüm', 'Dört Uzun Gün', 'Çok ömrü kalmadığından korkan Walt, ailesinin geleceğini garantilemek adına Jesse\'yle beraber dur durak dinlemeden metamfetamin üretmeye çalışır.', 1, 0, '2009-05-03', '2021-02-15 00:03:34', NULL),
(333, 0, 70, 79, 10, '10.Bölüm', 'Kutlama', 'Kanser tedavisiyle ilgili güzel haberlerin sonrasında Walt, tüm dikkatini evdekilerle arasını düzeltmeye vermeden önce kayınbiraderine çıkışır.', 1, 0, '2009-05-10', '2021-02-15 00:03:34', NULL),
(334, 0, 70, 79, 11, '11.Bölüm', 'Yaşam Döngüsü', 'Skyler, hamileliğin sonlarına doğru karışık duygular hissederken bir satıcının ölümü, Walt\'u elindeki metamfetamini boşaltacak yeni bir yer aramaya iter.', 1, 0, '2009-05-17', '2021-02-15 00:03:34', NULL),
(335, 0, 70, 79, 12, '12.Bölüm', 'Phoneix', 'Büyük bir uyuşturucu alışverişi yüzünden kızının doğumunu kaçıran Walt, Jesse\'nin paradan alacağı pay hakkında Jesse\'nin sevgilisiyle karşı karşıya gelir.', 1, 0, '2009-05-24', '2021-02-15 00:03:34', NULL),
(336, 0, 70, 79, 13, '13.Bölüm', 'ABQ (Sezon Finali)', 'Walt, ameliyata hazırlanırken bir yandan da kendi hayatını ve Jesse\'ninkini tekrar düzene koymak ve paranın kaynağını Skyler ile Walt Jr.\'dan saklamak için uğraşır.', 1, 0, '2009-05-31', '2021-02-15 00:03:34', NULL),
(350, 6, 70, 78, 7, '7.Bölüm', 'Yasa Dışı (Sezon Finali)', 'Jesse ölümden dönünce Walt, zalim Tuco için daha da fazla uyuşturucu imal etmeyi kabul eder. Skyler ise, kız kardeşinin mağazalardan hırsızlık yaptığından şüphelenir.', 1, 0, '2008-03-09', '2021-02-15 00:03:56', NULL),
(349, 5, 70, 78, 6, '6.Bölüm', 'Heisenberg', 'Tedavinin masrafları ve yan etkileri artarken Walt, Jesse\'den uyuşturucuyu satabilecekleri bir toptancı bulmasını ister. Bu da, Jesse\'nin başını belaya sokar.', 1, 0, '2008-03-02', '2021-02-15 00:03:56', NULL),
(348, 4, 70, 78, 5, '5.Bölüm', 'Yastık', 'Eski araştırma arkadaşı, Walt\'un kanser tedavisinin masraflarını ödemek üzere cömert bir teklif yapınca Skyler, bu teklifi kocasına kabul ettirebilmek için çabalar.', 1, 0, '2008-02-24', '2021-02-15 00:03:56', NULL),
(347, 3, 70, 78, 4, '4.Bölüm', 'Hasta Adam', 'Hastalığının ardındaki gerçeği açıklamak zorunda kalan Walt, bu pahalı tedavinin masraflarını nasıl ödeyeceğinin çıkmazıyla yüz yüze gelir.', 1, 0, '2008-02-17', '2021-02-15 00:03:56', NULL),
(346, 2, 70, 78, 3, '3.Bölüm', 'Eksik Parça', 'Walt, ilk uyuşturucu işinden geriye kalan pisliği temizlerken Skyler da, kocasının ikili yaşamı hakkındaki gerçekleri öğrenmeye oldukça yaklaşır.', 1, 0, '2008-02-10', '2021-02-15 00:03:56', NULL),
(344, 0, 70, 78, 1, '1.Bölüm', 'Pilot Bölüm', 'Ölümcül akciğer kanseri teşhisi konan bir lise kimya öğretmeni, ailesini geçindirmek için metamfetamin yapıp satmaya başlar.', 1, 0, '2008-01-20', '2021-02-15 00:03:56', NULL),
(345, 1, 70, 78, 2, '2.Bölüm', 'Yazı Tura', 'Ters giden ilk uyuşturucu işi, Walt ve Jesse\'yi iki cesedi ortadan kaldırmak zorunda bırakır. Skyler ise, kocasının bir haltlar karıştırdığından şüphelenmektedir.', 1, 0, '2008-01-27', '2021-02-15 00:03:56', NULL),
(351, 0, 67, 61, 1, '1.Bölüm', '1. Bölüm', '', 1, 0, '2001-10-16', '2021-02-15 02:12:23', NULL),
(352, 0, 67, 61, 2, '2.Bölüm', '2. Bölüm', '', 1, 0, '2001-10-23', '2021-02-15 02:12:23', NULL),
(353, 0, 67, 61, 3, '3.Bölüm', '3. Bölüm', '', 1, 0, '2001-10-30', '2021-02-15 02:12:23', NULL),
(354, 0, 67, 61, 4, '4.Bölüm', '4. Bölüm', '', 1, 0, '2001-11-06', '2021-02-15 02:12:23', NULL),
(355, 0, 67, 61, 5, '5.Bölüm', '5. Bölüm', '', 1, 0, '2001-11-13', '2021-02-15 02:12:23', NULL),
(356, 0, 67, 61, 6, '6.Bölüm', '6. Bölüm', '', 1, 0, '2001-11-20', '2021-02-15 02:12:23', NULL),
(357, 0, 67, 61, 7, '7.Bölüm', '7. Bölüm', '', 1, 0, '2001-11-27', '2021-02-15 02:12:23', NULL),
(358, 0, 67, 61, 8, '8.Bölüm', '8. Bölüm', '', 1, 0, '2001-12-11', '2021-02-15 02:12:23', NULL),
(359, 0, 67, 61, 9, '9.Bölüm', '9. Bölüm', '', 1, 0, '2002-01-15', '2021-02-15 02:12:23', NULL),
(360, 0, 67, 61, 10, '10.Bölüm', '10. Bölüm', '', 1, 0, '2002-01-29', '2021-02-15 02:12:23', NULL),
(361, 0, 67, 61, 11, '11.Bölüm', '11. Bölüm', '', 1, 0, '2002-02-05', '2021-02-15 02:12:23', NULL),
(362, 0, 67, 61, 12, '12.Bölüm', '12. Bölüm', '', 1, 0, '2002-02-12', '2021-02-15 02:12:23', NULL),
(363, 0, 67, 61, 13, '13.Bölüm', '13. Bölüm', '', 1, 0, '2002-02-26', '2021-02-15 02:12:23', NULL),
(364, 0, 67, 61, 14, '14.Bölüm', '14. Bölüm', '', 1, 0, '2002-03-12', '2021-02-15 02:12:23', NULL),
(365, 0, 67, 61, 15, '15.Bölüm', '15. Bölüm', '', 1, 0, '2002-03-19', '2021-02-15 02:12:23', NULL),
(366, 0, 67, 61, 16, '16.Bölüm', '16. Bölüm', '', 1, 0, '2002-04-16', '2021-02-15 02:12:23', NULL),
(367, 0, 67, 61, 17, '17.Bölüm', '17. Bölüm', '', 1, 0, '2002-04-23', '2021-02-15 02:12:23', NULL),
(368, 0, 67, 61, 18, '18.Bölüm', '18. Bölüm', '', 1, 0, '2002-04-30', '2021-02-15 02:12:23', NULL),
(369, 0, 67, 61, 19, '19.Bölüm', '19. Bölüm', '', 1, 0, '2002-05-07', '2021-02-15 02:12:23', NULL),
(370, 0, 67, 61, 20, '20.Bölüm', '20. Bölüm', '', 1, 0, '2002-05-14', '2021-02-15 02:12:23', NULL),
(371, 0, 67, 61, 21, '21.Bölüm', '21. Bölüm', '', 1, 0, '2002-05-21', '2021-02-15 02:12:23', NULL),
(372, 0, 67, 62, 1, '1.Bölüm', '1. Bölüm', '', 1, 0, '2002-09-24', '2021-02-15 02:12:24', NULL),
(373, 0, 67, 62, 2, '2.Bölüm', '2. Bölüm', '', 1, 0, '2002-10-01', '2021-02-15 02:12:24', NULL),
(374, 0, 67, 62, 3, '3.Bölüm', '3. Bölüm', '', 1, 0, '2002-10-08', '2021-02-15 02:12:24', NULL),
(375, 0, 67, 62, 4, '4.Bölüm', '4. Bölüm', '', 1, 0, '2002-10-15', '2021-02-15 02:12:24', NULL),
(376, 0, 67, 62, 5, '5.Bölüm', '5. Bölüm', '', 1, 0, '2002-10-22', '2021-02-15 02:12:24', NULL),
(377, 0, 67, 62, 6, '6.Bölüm', '6. Bölüm', '', 1, 0, '2002-10-29', '2021-02-15 02:12:24', NULL),
(378, 0, 67, 62, 7, '7.Bölüm', '7. Bölüm', '', 1, 0, '2002-11-05', '2021-02-15 02:12:24', NULL),
(379, 0, 67, 62, 8, '8.Bölüm', '8. Bölüm', '', 1, 0, '2002-11-12', '2021-02-15 02:12:24', NULL),
(380, 0, 67, 62, 9, '9.Bölüm', '9. Bölüm', '', 1, 0, '2002-11-19', '2021-02-15 02:12:24', NULL),
(381, 0, 67, 62, 10, '10.Bölüm', '10. Bölüm', '', 1, 0, '2002-11-26', '2021-02-15 02:12:24', NULL),
(382, 0, 67, 62, 11, '11.Bölüm', '11. Bölüm', '', 1, 0, '2003-01-14', '2021-02-15 02:12:24', NULL),
(383, 0, 67, 62, 12, '12.Bölüm', '12. Bölüm', '', 1, 0, '2003-01-21', '2021-02-15 02:12:24', NULL),
(384, 0, 67, 62, 13, '13.Bölüm', '13. Bölüm', '', 1, 0, '2003-01-28', '2021-02-15 02:12:24', NULL),
(385, 0, 67, 62, 14, '14.Bölüm', '14. Bölüm', '', 1, 0, '2003-02-04', '2021-02-15 02:12:24', NULL),
(386, 0, 67, 62, 15, '15.Bölüm', '15. Bölüm', '', 1, 0, '2003-02-11', '2021-02-15 02:12:24', NULL),
(387, 0, 67, 62, 16, '16.Bölüm', '16. Bölüm', '', 1, 0, '2003-02-18', '2021-02-15 02:12:24', NULL),
(388, 0, 67, 62, 17, '17.Bölüm', '17. Bölüm', '', 1, 0, '2003-02-25', '2021-02-15 02:12:24', NULL),
(389, 0, 67, 62, 18, '18.Bölüm', '18. Bölüm', '', 1, 0, '2003-04-15', '2021-02-15 02:12:24', NULL),
(390, 0, 67, 62, 19, '19.Bölüm', '19. Bölüm', '', 1, 0, '2003-04-22', '2021-02-15 02:12:24', NULL),
(391, 0, 67, 62, 20, '20.Bölüm', '20. Bölüm', '', 1, 0, '2003-04-29', '2021-02-15 02:12:24', NULL),
(392, 0, 67, 62, 21, '21.Bölüm', '21. Bölüm', '', 1, 0, '2003-05-06', '2021-02-15 02:12:24', NULL),
(393, 0, 67, 62, 22, '22.Bölüm', '22. Bölüm', '', 1, 0, '2003-05-13', '2021-02-15 02:12:24', NULL),
(394, 0, 67, 62, 23, '23.Bölüm', '23. Bölüm', '', 1, 0, '2003-05-20', '2021-02-15 02:12:24', NULL),
(395, 0, 67, 70, 1, '1.Bölüm', '1. Bölüm', '', 1, 0, '2010-09-24', '2021-02-15 02:13:00', NULL),
(396, 0, 67, 70, 2, '2.Bölüm', '2. Bölüm', '', 1, 0, '2010-10-01', '2021-02-15 02:13:00', NULL),
(397, 0, 67, 70, 3, '3.Bölüm', '3. Bölüm', '', 1, 0, '2010-10-08', '2021-02-15 02:13:00', NULL),
(398, 0, 67, 70, 4, '4.Bölüm', '4. Bölüm', '', 1, 0, '2010-10-15', '2021-02-15 02:13:00', NULL),
(399, 0, 67, 70, 5, '5.Bölüm', '5. Bölüm', '', 1, 0, '2010-10-22', '2021-02-15 02:13:00', NULL),
(400, 0, 67, 70, 6, '6.Bölüm', '6. Bölüm', '', 1, 0, '2010-10-29', '2021-02-15 02:13:00', NULL),
(401, 0, 67, 70, 7, '7.Bölüm', '7. Bölüm', '', 1, 0, '2010-11-05', '2021-02-15 02:13:00', NULL),
(402, 0, 67, 70, 8, '8.Bölüm', '8. Bölüm', '', 1, 0, '2010-11-12', '2021-02-15 02:13:00', NULL),
(403, 0, 67, 70, 9, '9.Bölüm', '9. Bölüm', '', 1, 0, '2010-11-19', '2021-02-15 02:13:00', NULL),
(404, 0, 67, 70, 10, '10.Bölüm', '10. Bölüm', '', 1, 0, '2010-12-03', '2021-02-15 02:13:00', NULL),
(405, 0, 67, 70, 11, '11.Bölüm', '11. Bölüm', '', 1, 0, '2010-12-10', '2021-02-15 02:13:00', NULL),
(406, 0, 67, 70, 12, '12.Bölüm', '12. Bölüm', '', 1, 0, '2011-02-04', '2021-02-15 02:13:00', NULL),
(407, 0, 67, 70, 13, '13.Bölüm', '13. Bölüm', '', 1, 0, '2011-02-11', '2021-02-15 02:13:00', NULL),
(408, 0, 67, 70, 14, '14.Bölüm', '14. Bölüm', '', 1, 0, '2011-02-18', '2021-02-15 02:13:00', NULL),
(409, 0, 67, 70, 15, '15.Bölüm', '15. Bölüm', '', 1, 0, '2011-02-25', '2021-02-15 02:13:00', NULL),
(410, 0, 67, 70, 16, '16.Bölüm', '16. Bölüm', '', 1, 0, '2011-03-04', '2021-02-15 02:13:00', NULL),
(411, 0, 67, 70, 17, '17.Bölüm', '17. Bölüm', '', 1, 0, '2011-04-15', '2021-02-15 02:13:00', NULL),
(412, 0, 67, 70, 18, '18.Bölüm', '18. Bölüm', '', 1, 0, '2011-04-22', '2021-02-15 02:13:00', NULL),
(413, 0, 67, 70, 19, '19.Bölüm', '19. Bölüm', '', 1, 0, '2011-04-29', '2021-02-15 02:13:00', NULL),
(414, 0, 67, 70, 20, '20.Bölüm', '20. Bölüm', '', 1, 0, '2011-05-06', '2021-02-15 02:13:00', NULL),
(415, 0, 67, 70, 21, '21.Bölüm', '21. Bölüm', '', 1, 0, '2011-05-13', '2021-02-15 02:13:00', NULL),
(416, 0, 67, 63, 1, '1.Bölüm', '1. Bölüm', '', 1, 0, '2003-10-01', '2021-02-15 02:13:02', NULL),
(417, 0, 67, 63, 2, '2.Bölüm', '2. Bölüm', '', 1, 0, '2003-10-08', '2021-02-15 02:13:02', NULL),
(418, 0, 67, 63, 3, '3.Bölüm', '3. Bölüm', '', 1, 0, '2003-10-15', '2021-02-15 02:13:02', NULL),
(419, 0, 67, 63, 4, '4.Bölüm', '4. Bölüm', '', 1, 0, '2003-10-22', '2021-02-15 02:13:02', NULL),
(420, 0, 67, 63, 5, '5.Bölüm', '5. Bölüm', '', 1, 0, '2003-10-29', '2021-02-15 02:13:02', NULL),
(421, 0, 67, 63, 6, '6.Bölüm', '6. Bölüm', '', 1, 0, '2003-11-05', '2021-02-15 02:13:02', NULL),
(422, 0, 67, 63, 7, '7.Bölüm', '7. Bölüm', '', 1, 0, '2003-11-12', '2021-02-15 02:13:02', NULL),
(423, 0, 67, 63, 8, '8.Bölüm', '8. Bölüm', '', 1, 0, '2003-11-19', '2021-02-15 02:13:02', NULL),
(424, 0, 67, 63, 9, '9.Bölüm', '9. Bölüm', '', 1, 0, '2004-01-14', '2021-02-15 02:13:02', NULL),
(425, 0, 67, 63, 10, '10.Bölüm', '10. Bölüm', '', 1, 0, '2004-01-21', '2021-02-15 02:13:02', NULL),
(426, 0, 67, 63, 11, '11.Bölüm', '11. Bölüm', '', 1, 0, '2004-01-28', '2021-02-15 02:13:02', NULL),
(427, 0, 67, 63, 12, '12.Bölüm', '12. Bölüm', '', 1, 0, '2004-02-04', '2021-02-15 02:13:02', NULL),
(428, 0, 67, 63, 13, '13.Bölüm', '13. Bölüm', '', 1, 0, '2004-02-11', '2021-02-15 02:13:02', NULL),
(429, 0, 67, 63, 14, '14.Bölüm', '14. Bölüm', '', 1, 0, '2004-02-18', '2021-02-15 02:13:02', NULL),
(430, 0, 67, 63, 15, '15.Bölüm', '15. Bölüm', '', 1, 0, '2004-02-25', '2021-02-15 02:13:02', NULL),
(431, 0, 67, 63, 16, '16.Bölüm', '16. Bölüm', '', 1, 0, '2004-03-03', '2021-02-15 02:13:02', NULL),
(432, 0, 67, 63, 17, '17.Bölüm', '17. Bölüm', '', 1, 0, '2004-04-14', '2021-02-15 02:13:02', NULL),
(433, 0, 67, 63, 18, '18.Bölüm', '18. Bölüm', '', 1, 0, '2004-04-21', '2021-02-15 02:13:02', NULL),
(434, 0, 67, 63, 19, '19.Bölüm', '19. Bölüm', '', 1, 0, '2004-04-28', '2021-02-15 02:13:02', NULL),
(435, 0, 67, 63, 20, '20.Bölüm', '20. Bölüm', '', 1, 0, '2004-05-05', '2021-02-15 02:13:02', NULL),
(436, 0, 67, 63, 21, '21.Bölüm', '21. Bölüm', '', 1, 0, '2004-05-12', '2021-02-15 02:13:02', NULL),
(437, 0, 67, 63, 22, '22.Bölüm', '22. Bölüm', '', 1, 0, '2004-05-19', '2021-02-15 02:13:02', NULL),
(438, 0, 67, 64, 1, '1.Bölüm', '1. Bölüm', '', 1, 0, '2004-09-22', '2021-02-15 02:13:04', NULL),
(439, 0, 67, 64, 2, '2.Bölüm', '2. Bölüm', '', 1, 0, '2004-09-29', '2021-02-15 02:13:04', NULL),
(440, 0, 67, 64, 3, '3.Bölüm', '3. Bölüm', '', 1, 0, '2004-10-06', '2021-02-15 02:13:04', NULL),
(441, 0, 67, 64, 4, '4.Bölüm', '4. Bölüm', '', 1, 0, '2004-10-13', '2021-02-15 02:13:04', NULL),
(442, 0, 67, 64, 5, '5.Bölüm', '5. Bölüm', '', 1, 0, '2004-10-20', '2021-02-15 02:13:04', NULL),
(443, 0, 67, 64, 6, '6.Bölüm', '6. Bölüm', '', 1, 0, '2004-10-27', '2021-02-15 02:13:04', NULL),
(444, 0, 67, 64, 7, '7.Bölüm', '7. Bölüm', '', 1, 0, '2004-11-03', '2021-02-15 02:13:04', NULL),
(445, 0, 67, 64, 8, '8.Bölüm', '8. Bölüm', '', 1, 0, '2004-11-10', '2021-02-15 02:13:04', NULL),
(446, 0, 67, 64, 9, '9.Bölüm', '9. Bölüm', '', 1, 0, '2004-11-17', '2021-02-15 02:13:04', NULL),
(447, 0, 67, 64, 10, '10.Bölüm', '10. Bölüm', '', 1, 0, '2004-12-01', '2021-02-15 02:13:04', NULL),
(448, 0, 67, 64, 11, '11.Bölüm', '11. Bölüm', '', 1, 0, '2005-01-26', '2021-02-15 02:13:04', NULL),
(449, 0, 67, 64, 12, '12.Bölüm', '12. Bölüm', '', 1, 0, '2005-02-02', '2021-02-15 02:13:04', NULL),
(450, 0, 67, 64, 13, '13.Bölüm', '13. Bölüm', '', 1, 0, '2005-02-09', '2021-02-15 02:13:04', NULL),
(451, 0, 67, 64, 14, '14.Bölüm', '14. Bölüm', '', 1, 0, '2005-02-16', '2021-02-15 02:13:04', NULL),
(452, 0, 67, 64, 15, '15.Bölüm', '15. Bölüm', '', 1, 0, '2005-02-23', '2021-02-15 02:13:04', NULL),
(453, 0, 67, 64, 16, '16.Bölüm', '16. Bölüm', '', 1, 0, '2005-03-02', '2021-02-15 02:13:04', NULL),
(454, 0, 67, 64, 17, '17.Bölüm', '17. Bölüm', '', 1, 0, '2005-04-13', '2021-02-15 02:13:04', NULL),
(455, 0, 67, 64, 18, '18.Bölüm', '18. Bölüm', '', 1, 0, '2005-04-20', '2021-02-15 02:13:04', NULL),
(456, 0, 67, 64, 19, '19.Bölüm', '19. Bölüm', '', 1, 0, '2005-04-27', '2021-02-15 02:13:04', NULL),
(457, 0, 67, 64, 20, '20.Bölüm', '20. Bölüm', '', 1, 0, '2005-05-04', '2021-02-15 02:13:04', NULL),
(458, 0, 67, 64, 21, '21.Bölüm', '21. Bölüm', '', 1, 0, '2005-05-11', '2021-02-15 02:13:04', NULL),
(459, 0, 67, 64, 22, '22.Bölüm', '22. Bölüm', '', 1, 0, '2005-05-18', '2021-02-15 02:13:04', NULL),
(460, 0, 67, 65, 1, '1.Bölüm', '1. Bölüm', '', 1, 0, '2005-09-22', '2021-02-15 02:13:05', NULL),
(461, 0, 67, 65, 2, '2.Bölüm', '2. Bölüm', '', 1, 0, '2005-09-29', '2021-02-15 02:13:05', NULL),
(462, 0, 67, 65, 3, '3.Bölüm', '3. Bölüm', '', 1, 0, '2005-10-13', '2021-02-15 02:13:05', NULL),
(463, 0, 67, 65, 4, '4.Bölüm', '4. Bölüm', '', 1, 0, '2005-10-20', '2021-02-15 02:13:05', NULL),
(464, 0, 67, 65, 5, '5.Bölüm', '5. Bölüm', '', 1, 0, '2005-10-27', '2021-02-15 02:13:05', NULL),
(465, 0, 67, 65, 6, '6.Bölüm', '6. Bölüm', '', 1, 0, '2005-11-03', '2021-02-15 02:13:05', NULL),
(466, 0, 67, 65, 7, '7.Bölüm', '7. Bölüm', '', 1, 0, '2005-11-10', '2021-02-15 02:13:05', NULL),
(467, 0, 67, 65, 8, '8.Bölüm', '8. Bölüm', '', 1, 0, '2005-11-17', '2021-02-15 02:13:05', NULL),
(468, 0, 67, 65, 9, '9.Bölüm', '9. Bölüm', '', 1, 0, '2005-12-01', '2021-02-15 02:13:05', NULL),
(469, 0, 67, 65, 10, '10.Bölüm', '10. Bölüm', '', 1, 0, '2006-01-12', '2021-02-15 02:13:05', NULL),
(470, 0, 67, 65, 11, '11.Bölüm', '11. Bölüm', '', 1, 0, '2006-01-19', '2021-02-15 02:13:05', NULL),
(471, 0, 67, 65, 12, '12.Bölüm', '12. Bölüm', '', 1, 0, '2006-01-26', '2021-02-15 02:13:05', NULL),
(472, 0, 67, 65, 13, '13.Bölüm', '13. Bölüm', '', 1, 0, '2006-02-02', '2021-02-15 02:13:05', NULL),
(473, 0, 67, 65, 14, '14.Bölüm', '14. Bölüm', '', 1, 0, '2006-02-09', '2021-02-15 02:13:05', NULL),
(474, 0, 67, 65, 15, '15.Bölüm', '15. Bölüm', '', 1, 0, '2006-02-16', '2021-02-15 02:13:05', NULL),
(475, 0, 67, 65, 16, '16.Bölüm', '16. Bölüm', '', 1, 0, '2006-03-30', '2021-02-15 02:13:05', NULL),
(476, 0, 67, 65, 17, '17.Bölüm', '17. Bölüm', '', 1, 0, '2006-04-06', '2021-02-15 02:13:05', NULL),
(477, 0, 67, 65, 18, '18.Bölüm', '18. Bölüm', '', 1, 0, '2006-04-13', '2021-02-15 02:13:05', NULL),
(478, 0, 67, 65, 19, '19.Bölüm', '19. Bölüm', '', 1, 0, '2006-04-20', '2021-02-15 02:13:05', NULL),
(479, 0, 67, 65, 20, '20.Bölüm', '20. Bölüm', '', 1, 0, '2006-04-27', '2021-02-15 02:13:05', NULL),
(480, 0, 67, 65, 21, '21.Bölüm', '21. Bölüm', '', 1, 0, '2006-05-04', '2021-02-15 02:13:05', NULL),
(481, 0, 67, 65, 22, '22.Bölüm', '22. Bölüm', '', 1, 0, '2006-05-11', '2021-02-15 02:13:05', NULL),
(482, 0, 67, 66, 1, '1.Bölüm', '1. Bölüm', '', 1, 0, '2006-09-28', '2021-02-15 02:13:07', NULL),
(483, 0, 67, 66, 2, '2.Bölüm', '2. Bölüm', '', 1, 0, '2006-10-05', '2021-02-15 02:13:07', NULL),
(484, 0, 67, 66, 3, '3.Bölüm', '3. Bölüm', '', 1, 0, '2006-10-12', '2021-02-15 02:13:07', NULL),
(485, 0, 67, 66, 4, '4.Bölüm', '4. Bölüm', '', 1, 0, '2006-10-19', '2021-02-15 02:13:07', NULL),
(486, 0, 67, 66, 5, '5.Bölüm', '5. Bölüm', '', 1, 0, '2006-10-26', '2021-02-15 02:13:07', NULL),
(487, 0, 67, 66, 6, '6.Bölüm', '6. Bölüm', '', 1, 0, '2006-11-02', '2021-02-15 02:13:07', NULL),
(488, 0, 67, 66, 7, '7.Bölüm', '7. Bölüm', '', 1, 0, '2006-11-09', '2021-02-15 02:13:07', NULL),
(489, 0, 67, 66, 8, '8.Bölüm', '8. Bölüm', '', 1, 0, '2006-11-16', '2021-02-15 02:13:07', NULL),
(490, 0, 67, 66, 9, '9.Bölüm', '9. Bölüm', '', 1, 0, '2006-12-07', '2021-02-15 02:13:07', NULL),
(491, 0, 67, 66, 10, '10.Bölüm', '10. Bölüm', '', 1, 0, '2007-01-11', '2021-02-15 02:13:07', NULL),
(492, 0, 67, 66, 11, '11.Bölüm', '11. Bölüm', '', 1, 0, '2007-01-18', '2021-02-15 02:13:07', NULL),
(493, 0, 67, 66, 12, '12.Bölüm', '12. Bölüm', '', 1, 0, '2007-01-25', '2021-02-15 02:13:07', NULL),
(494, 0, 67, 66, 13, '13.Bölüm', '13. Bölüm', '', 1, 0, '2007-02-01', '2021-02-15 02:13:07', NULL),
(495, 0, 67, 66, 14, '14.Bölüm', '14. Bölüm', '', 1, 0, '2007-02-08', '2021-02-15 02:13:07', NULL),
(496, 0, 67, 66, 15, '15.Bölüm', '15. Bölüm', '', 1, 0, '2007-02-15', '2021-02-15 02:13:07', NULL),
(497, 0, 67, 66, 16, '16.Bölüm', '16. Bölüm', '', 1, 0, '2007-03-15', '2021-02-15 02:13:07', NULL),
(498, 0, 67, 66, 17, '17.Bölüm', '17. Bölüm', '', 1, 0, '2007-03-22', '2021-02-15 02:13:07', NULL),
(499, 0, 67, 66, 18, '18.Bölüm', '18. Bölüm', '', 1, 0, '2007-04-19', '2021-02-15 02:13:07', NULL),
(500, 0, 67, 66, 19, '19.Bölüm', '19. Bölüm', '', 1, 0, '2007-04-26', '2021-02-15 02:13:07', NULL),
(501, 0, 67, 66, 20, '20.Bölüm', '20. Bölüm', '', 1, 0, '2007-05-03', '2021-02-15 02:13:07', NULL),
(502, 0, 67, 66, 21, '21.Bölüm', '21. Bölüm', '', 1, 0, '2007-05-10', '2021-02-15 02:13:07', NULL),
(503, 0, 67, 66, 22, '22.Bölüm', '22. Bölüm', '', 1, 0, '2007-05-17', '2021-02-15 02:13:07', NULL),
(504, 0, 67, 67, 1, '1.Bölüm', '1. Bölüm', '', 1, 0, '2007-09-27', '2021-02-15 02:13:08', NULL),
(505, 0, 67, 67, 2, '2.Bölüm', '2. Bölüm', '', 1, 0, '2007-10-04', '2021-02-15 02:13:08', NULL),
(506, 0, 67, 67, 3, '3.Bölüm', '3. Bölüm', '', 1, 0, '2007-10-11', '2021-02-15 02:13:08', NULL),
(507, 0, 67, 67, 4, '4.Bölüm', '4. Bölüm', '', 1, 0, '2007-10-18', '2021-02-15 02:13:08', NULL),
(508, 0, 67, 67, 5, '5.Bölüm', '5. Bölüm', '', 1, 0, '2007-10-25', '2021-02-15 02:13:08', NULL),
(509, 0, 67, 67, 6, '6.Bölüm', '6. Bölüm', '', 1, 0, '2007-11-01', '2021-02-15 02:13:08', NULL),
(510, 0, 67, 67, 7, '7.Bölüm', '7. Bölüm', '', 1, 0, '2007-11-08', '2021-02-15 02:13:08', NULL),
(511, 0, 67, 67, 8, '8.Bölüm', '8. Bölüm', '', 1, 0, '2007-11-15', '2021-02-15 02:13:08', NULL),
(512, 0, 67, 67, 9, '9.Bölüm', '9. Bölüm', '', 1, 0, '2007-12-13', '2021-02-15 02:13:08', NULL),
(513, 0, 67, 67, 10, '10.Bölüm', '10. Bölüm', '', 1, 0, '2008-01-31', '2021-02-15 02:13:08', NULL),
(514, 0, 67, 67, 11, '11.Bölüm', '11. Bölüm', '', 1, 0, '2008-02-07', '2021-02-15 02:13:08', NULL),
(515, 0, 67, 67, 12, '12.Bölüm', '12. Bölüm', '', 1, 0, '2008-02-14', '2021-02-15 02:13:08', NULL),
(516, 0, 67, 67, 13, '13.Bölüm', '13. Bölüm', '', 1, 0, '2008-03-13', '2021-02-15 02:13:08', NULL),
(517, 0, 67, 67, 14, '14.Bölüm', '14. Bölüm', '', 1, 0, '2008-03-20', '2021-02-15 02:13:08', NULL),
(518, 0, 67, 67, 15, '15.Bölüm', '15. Bölüm', '', 1, 0, '2008-03-27', '2021-02-15 02:13:08', NULL),
(519, 0, 67, 67, 16, '16.Bölüm', '16. Bölüm', '', 1, 0, '2008-04-17', '2021-02-15 02:13:08', NULL),
(520, 0, 67, 67, 17, '17.Bölüm', '17. Bölüm', '', 1, 0, '2008-04-24', '2021-02-15 02:13:08', NULL),
(521, 0, 67, 67, 18, '18.Bölüm', '18. Bölüm', '', 1, 0, '2008-05-01', '2021-02-15 02:13:08', NULL),
(522, 0, 67, 67, 19, '19.Bölüm', '19. Bölüm', '', 1, 0, '2008-05-08', '2021-02-15 02:13:08', NULL),
(523, 0, 67, 67, 20, '20.Bölüm', '20. Bölüm', '', 1, 0, '2008-05-15', '2021-02-15 02:13:08', NULL),
(524, 0, 67, 68, 1, '1.Bölüm', '1. Bölüm', '', 1, 0, '2008-09-18', '2021-02-15 02:13:10', NULL),
(525, 0, 67, 68, 2, '2.Bölüm', '2. Bölüm', '', 1, 0, '2008-09-25', '2021-02-15 02:13:10', NULL),
(526, 0, 67, 68, 3, '3.Bölüm', '3. Bölüm', '', 1, 0, '2008-10-02', '2021-02-15 02:13:10', NULL),
(527, 0, 67, 68, 4, '4.Bölüm', '4. Bölüm', '', 1, 0, '2008-10-09', '2021-02-15 02:13:10', NULL),
(528, 0, 67, 68, 5, '5.Bölüm', '5. Bölüm', '', 1, 0, '2008-10-16', '2021-02-15 02:13:10', NULL),
(529, 0, 67, 68, 6, '6.Bölüm', '6. Bölüm', '', 1, 0, '2008-10-23', '2021-02-15 02:13:10', NULL),
(530, 0, 67, 68, 7, '7.Bölüm', '7. Bölüm', '', 1, 0, '2008-10-30', '2021-02-15 02:13:10', NULL),
(531, 0, 67, 68, 8, '8.Bölüm', '8. Bölüm', '', 1, 0, '2008-11-06', '2021-02-15 02:13:10', NULL),
(532, 0, 67, 68, 9, '9.Bölüm', '9. Bölüm', '', 1, 0, '2008-11-13', '2021-02-15 02:13:10', NULL),
(533, 0, 67, 68, 10, '10.Bölüm', '10. Bölüm', '', 1, 0, '2008-11-20', '2021-02-15 02:13:10', NULL),
(534, 0, 67, 68, 11, '11.Bölüm', '11. Bölüm', '', 1, 0, '2009-01-15', '2021-02-15 02:13:10', NULL),
(535, 0, 67, 68, 12, '12.Bölüm', '12. Bölüm', '', 1, 0, '2009-01-22', '2021-02-15 02:13:10', NULL),
(536, 0, 67, 68, 13, '13.Bölüm', '13. Bölüm', '', 1, 0, '2009-01-29', '2021-02-15 02:13:10', NULL),
(537, 0, 67, 68, 14, '14.Bölüm', '14. Bölüm', '', 1, 0, '2009-02-05', '2021-02-15 02:13:10', NULL),
(538, 0, 67, 68, 15, '15.Bölüm', '15. Bölüm', '', 1, 0, '2009-03-12', '2021-02-15 02:13:10', NULL),
(539, 0, 67, 68, 16, '16.Bölüm', '16. Bölüm', '', 1, 0, '2009-03-19', '2021-02-15 02:13:10', NULL),
(540, 0, 67, 68, 17, '17.Bölüm', '17. Bölüm', '', 1, 0, '2009-03-26', '2021-02-15 02:13:10', NULL),
(541, 0, 67, 68, 18, '18.Bölüm', '18. Bölüm', '', 1, 0, '2009-04-02', '2021-02-15 02:13:10', NULL),
(542, 0, 67, 68, 19, '19.Bölüm', '19. Bölüm', '', 1, 0, '2009-04-23', '2021-02-15 02:13:10', NULL),
(543, 0, 67, 68, 20, '20.Bölüm', '20. Bölüm', '', 1, 0, '2009-04-30', '2021-02-15 02:13:10', NULL),
(544, 0, 67, 68, 21, '21.Bölüm', '21. Bölüm', '', 1, 0, '2009-05-07', '2021-02-15 02:13:10', NULL),
(545, 0, 67, 68, 22, '22.Bölüm', '22. Bölüm', '', 1, 0, '2009-05-14', '2021-02-15 02:13:10', NULL),
(546, 0, 67, 69, 1, '1.Bölüm', '1. Bölüm', '', 1, 0, '2009-09-25', '2021-02-15 02:13:11', NULL),
(547, 0, 67, 69, 2, '2.Bölüm', '2. Bölüm', '', 1, 0, '2009-10-02', '2021-02-15 02:13:11', NULL),
(548, 0, 67, 69, 3, '3.Bölüm', '3. Bölüm', '', 1, 0, '2009-10-09', '2021-02-15 02:13:11', NULL),
(549, 0, 67, 69, 4, '4.Bölüm', '4. Bölüm', '', 1, 0, '2009-10-16', '2021-02-15 02:13:11', NULL),
(550, 0, 67, 69, 5, '5.Bölüm', '5. Bölüm', '', 1, 0, '2009-10-23', '2021-02-15 02:13:11', NULL),
(551, 0, 67, 69, 6, '6.Bölüm', '6. Bölüm', '', 1, 0, '2009-10-30', '2021-02-15 02:13:11', NULL),
(552, 0, 67, 69, 7, '7.Bölüm', '7. Bölüm', '', 1, 0, '2009-11-06', '2021-02-15 02:13:11', NULL),
(553, 0, 67, 69, 8, '8.Bölüm', '8. Bölüm', '', 1, 0, '2009-11-13', '2021-02-15 02:13:11', NULL),
(554, 0, 67, 69, 9, '9.Bölüm', '9. Bölüm', '', 1, 0, '2009-11-20', '2021-02-15 02:13:11', NULL),
(555, 0, 67, 69, 10, '10.Bölüm', '10. Bölüm', '', 1, 0, '2010-01-29', '2021-02-15 02:13:11', NULL),
(556, 0, 67, 69, 11, '11.Bölüm', '11. Bölüm', '', 1, 0, '2010-02-05', '2021-02-15 02:13:11', NULL),
(557, 0, 67, 69, 12, '12.Bölüm', '12. Bölüm', '', 1, 0, '2010-02-12', '2021-02-15 02:13:11', NULL),
(558, 0, 67, 69, 13, '13.Bölüm', '13. Bölüm', '', 1, 0, '2010-02-19', '2021-02-15 02:13:11', NULL),
(559, 0, 67, 69, 14, '14.Bölüm', '14. Bölüm', '', 1, 0, '2010-02-26', '2021-02-15 02:13:11', NULL),
(560, 0, 67, 69, 15, '15.Bölüm', '15. Bölüm', '', 1, 0, '2010-04-02', '2021-02-15 02:13:11', NULL),
(561, 0, 67, 69, 16, '16.Bölüm', '16. Bölüm', '', 1, 0, '2010-04-09', '2021-02-15 02:13:11', NULL),
(562, 0, 67, 69, 17, '17.Bölüm', '17. Bölüm', '', 1, 0, '2010-04-16', '2021-02-15 02:13:11', NULL),
(563, 0, 67, 69, 18, '18.Bölüm', '18. Bölüm', '', 1, 0, '2010-04-23', '2021-02-15 02:13:11', NULL),
(564, 0, 67, 69, 19, '19.Bölüm', '19. Bölüm', '', 1, 0, '2010-04-30', '2021-02-15 02:13:11', NULL),
(565, 0, 67, 69, 20, '20.Bölüm', '20. Bölüm', '', 1, 0, '2010-05-07', '2021-02-15 02:13:11', NULL),
(566, 0, 67, 69, 21, '21.Bölüm', '21. Bölüm', '', 1, 0, '2010-05-14', '2021-02-15 02:13:11', NULL),
(567, 0, 66, 54, 1, '1.Bölüm', 'Tanımlamalar', 'Ekip, Robin ve Barney\'nin gizlice ilişki yaşadığını öğrenir.', 1, 0, '2009-09-21', '2021-02-15 18:02:41', NULL),
(568, 0, 66, 54, 2, '2.Bölüm', 'Çifte Randevu', 'Bir kör randevu sırasında, Ted aynı kızla yedi yıl önce çıktığını fark eder.', 1, 0, '2009-09-28', '2021-02-15 18:02:41', NULL),
(569, 0, 66, 54, 3, '3.Bölüm', 'Robin\'e Giriş Dersi', 'Ted, Robin hakkında bildiklerini faydalı şekilde değerlendirir ve Barney\'ye Robin\'le çıkma dersi verir.', 1, 0, '2009-10-05', '2021-02-15 18:02:41', NULL),
(570, 0, 66, 54, 4, '4.Bölüm', 'Sekssiz Hancı', 'Marshall ve Lily, ilk çifte randevularında Barney ve Robin\'i etkilemek için fazla çaba gösterir.', 1, 0, '2009-10-12', '2021-02-15 18:02:41', NULL),
(571, 0, 66, 54, 5, '5.Bölüm', 'Vatandaşlık Düellosu', 'Barney, Robin\'i Amerikan vatandaşı olması için ikna etmeye çalışır. Lily de onlara katılmaya karar verince, Ted ve Marshall\'ın yolculuğu bambaşka bir hâl alır.', 1, 0, '2009-10-19', '2021-02-15 18:02:41', NULL),
(572, 0, 66, 54, 6, '6.Bölüm', 'Gayda', 'Marshall Barney\'den ilişki tavsiyesi alınca, Lily ile büyük bir kavgaya tutuşurlar.', 1, 0, '2009-11-02', '2021-02-15 18:02:41', NULL),
(573, 0, 66, 54, 7, '7.Bölüm', 'Zor Dönem', 'Ekip, Barney ve Robin\'in birlikteyken çok mutsuz olduğunu fark ettiğinde, Ted ve Marshall onları ayırmak için Lily\'den yardım ister.', 1, 0, '2009-11-09', '2021-02-15 18:02:41', NULL),
(574, 0, 66, 54, 8, '8.Bölüm', 'Av Rehberi', 'Robin\'le ayrılmasının ardından, Barney \"Av Rehberi\"ndeki klasik numaraları kullanarak randevu dünyasına hızla geri döner.', 1, 0, '2009-11-16', '2021-02-15 18:02:41', NULL),
(575, 0, 66, 54, 9, '9.Bölüm', 'Tokat Günü 2', 'Marshall, tokat iddiasındaki bir tokat hakkını Ted ve Robin\'e devreder. Lily\'nin uzun süredir görüşmediği babası sürpriz bir ziyarette bulunur.', 1, 0, '2009-11-23', '2021-02-15 18:02:41', NULL),
(576, 0, 66, 54, 10, '10.Bölüm', 'Pencere', 'Ted ideal bir komşu kızıyla çıkmak için nihayet bir fırsat yakalar.', 1, 0, '2009-12-07', '2021-02-15 18:02:41', NULL),
(577, 0, 66, 54, 11, '11.Bölüm', 'Son Sigara', 'Ekip sigarayı bırakmaya çalışırken Robin, isteksiz yeni iş arkadaşıyla \"görüş\" ayrılığı yaşar.', 1, 0, '2009-12-14', '2021-02-15 18:02:41', NULL),
(578, 0, 66, 54, 12, '12.Bölüm', 'Kızlar mı Takımlar mı?', 'Barney, bardaki seksi barmaidle yatmak ve çok sevdiği takım elbiseleri arasında seçim yapmak zorundadır. Ted, müstakbel eşiyle tanışmaya bir adım daha yaklaşır.', 1, 0, '2010-01-11', '2021-02-15 18:02:41', NULL),
(579, 0, 66, 54, 13, '13.Bölüm', 'Jenkins', 'Marshall, çekici kadın iş arkadaşının onu öptüğünü Lily\'ye kanıtlamaya çalışır.', 1, 0, '2010-01-18', '2021-02-15 18:02:41', NULL),
(580, 0, 66, 54, 14, '14.Bölüm', 'Kusursuz Hafta', 'Barney, yedi günde yedi kızla takılarak \"kusursuz haftayı\" tamamlamaya çalışır.', 1, 0, '2010-02-01', '2021-02-15 18:02:41', NULL),
(581, 0, 66, 54, 15, '15.Bölüm', 'Tavşan veya Ördek', 'Sevgililer Günü\'ne sadece bir hafta kala, Ted o gün buluşabileceği birini bulma işini Marshall ve Lily\'ye bırakır.', 1, 0, '2010-02-08', '2021-02-15 18:02:41', NULL),
(582, 0, 66, 54, 16, '16.Bölüm', 'Kancaya Takılmış', 'Ekip, Ted\'i bir kız tarafından \"kancaya takıldığı\" konusunda ikna ettikten sonra, kendi benzer ilişkilerini hatırlarlar.', 1, 0, '2010-03-01', '2021-02-15 18:02:41', NULL),
(583, 0, 66, 54, 17, '17.Bölüm', 'Tabii', 'Robin, ayrılıkları sırasındaki duyarsızlığı için Barney\'den intikam almak amacıyla bir plan yapar.', 1, 0, '2010-03-08', '2021-02-15 18:02:41', NULL),
(584, 0, 66, 54, 18, '18.Bölüm', 'Gülümse!', 'Ted, yanında birini getirerek Lily\'nin doğum gününü mahveder.', 1, 0, '2010-03-22', '2021-02-15 18:02:41', NULL),
(585, 0, 66, 54, 19, '19.Bölüm', 'Doğru mu Yanlış mı?', 'Marshall yaşadığı soygun olayının ardından, Lily\'nin kendini güvende hissetmesi için soygunla ilgili farklı hikâyeler uydurur.', 1, 0, '2010-04-12', '2021-02-15 18:02:41', NULL),
(586, 0, 66, 54, 20, '20.Bölüm', 'Ev Yıkıcılar', 'Annesinin nişanlısı ile aşırı samimi ilişkisine tanık olan Ted, kendi hayatında ne kadar geride kaldığını sorgular.', 1, 0, '2010-04-19', '2021-02-15 18:02:41', NULL),
(587, 0, 66, 54, 21, '21.Bölüm', 'Tekli Yataklar', 'Ted ve Barney, Robin\'e aşkları yüzünden kavga eder.', 1, 0, '2010-05-03', '2021-02-15 18:02:41', NULL),
(588, 0, 66, 54, 22, '22.Bölüm', 'Robotlar Güreşçilere Karşı', 'Ted, Marshall, Lily ve Barney gösterişli bir partiye gider. Ted burada kendini beğenmiş tavırlar takınır.', 1, 0, '2010-05-10', '2021-02-15 18:02:41', NULL),
(589, 0, 66, 54, 23, '23.Bölüm', 'Düğün Gelini', 'Çıktığı kızla Düğün Gelini filmini izlemek için sinemaya giden Ted, filmin eski bir sevgilisiyle ilişkisinin serbest bir uyarlaması olduğunu fark eder.', 1, 0, '2010-05-17', '2021-02-15 18:02:41', NULL),
(590, 0, 66, 54, 24, '24.Bölüm', 'Görsel İkizler', 'Marshall ve Lily, bebek sahibi olmaya hazır olup olmadıklarına karar vermek için evrenden bir işaret bekler.', 1, 0, '2010-05-24', '2021-02-15 18:02:41', NULL),
(591, 0, 66, 55, 1, '1.Bölüm', 'Önemli Günler', 'Ted, kötü şekilde ayrıldığı bir eski sevgilisine rastlar.', 1, 0, '2010-09-20', '2021-02-15 18:02:53', NULL),
(592, 0, 66, 55, 2, '2.Bölüm', 'Ev Toplamak', 'Barney, çocukluğunun geçtiği evi toplaması için annesine yardım ederken babası hakkındaki gerçeği öğrenir.', 1, 0, '2010-09-27', '2021-02-15 18:02:53', NULL),
(593, 0, 66, 55, 3, '3.Bölüm', 'Yarım Kalmış', 'Barney, Ted\'i bir işi kabul etmeye ikna etmek için en iyi baştan çıkarma numaralarını onun üzerinde dener.', 1, 0, '2010-10-04', '2021-02-15 18:02:53', NULL),
(594, 0, 66, 55, 4, '4.Bölüm', 'Metro Savaşları', 'Ekip, merkezdeki bir restorana en hızlı kimin ulaşacağını görmek için birbiriyle yarışır.', 1, 0, '2010-10-11', '2021-02-15 18:02:53', NULL),
(595, 0, 66, 55, 5, '5.Bölüm', 'Yıkımın Mimarı', 'Ted, hayallerini gerçeğe dönüştürecek yeni projesine yer açmak için yıkılacak olan önemli bir binayı kurtarmayı kafasına koymuş bir kıza âşık olur.', 1, 0, '2010-10-18', '2021-02-15 18:02:53', NULL),
(596, 0, 66, 55, 6, '6.Bölüm', 'Bebek Muhabbeti', 'Marshall ve Lily, yapacakları bebeğin cinsiyetini belirleyebilmek için ayrı ayrı araştırmalar yapar.', 1, 0, '2010-10-25', '2021-02-15 18:02:53', NULL),
(597, 0, 66, 55, 7, '7.Bölüm', 'Randy\'yi Kovmak', 'Zoey onun sınıfına kaydolduktan sonra, Ted öğrencileri üzerindeki kontrolünü kaybeder.', 1, 0, '2010-11-01', '2021-02-15 18:02:53', NULL),
(598, 0, 66, 55, 8, '8.Bölüm', 'Doğa Tarihi', 'Ekip, Doğa Tarihi Müzesi\'nde bir etkinliğe katılır. Ted burada en büyük düşmanına ve onun kocası olan Kaptan\'a rastlar.', 1, 0, '2010-11-08', '2021-02-15 18:02:53', NULL),
(599, 0, 66, 55, 9, '9.Bölüm', 'Glitter', 'Ekip, Kanada\'da bir çocuk programında birlikte sahne aldığı eski en iyi arkadaşı Jessica Glitter\'la tekrar görüşmesi için Robin\'i cesaretlendirir.', 1, 0, '2010-11-15', '2021-02-15 18:02:53', NULL),
(600, 0, 66, 55, 10, '10.Bölüm', 'Blitz Laneti', 'Ekip, geceyi lanetli bir üniversite arkadaşlarıyla birlikte geçirdikten sonra, Ted\'in Şükran Günü yemeği düzenleme planları suya düşer. O da günü Zoey ile geçirir.', 1, 0, '2010-11-22', '2021-02-15 18:02:53', NULL),
(601, 0, 66, 55, 11, '11.Bölüm', 'Deniz Kızı Teorisi', 'Zoey ile ilişkisini sorgulamaya başlayan Ted, Zoey\'nin kocasıyla arkadaş olur.', 1, 0, '2010-12-06', '2021-02-15 18:02:53', NULL),
(602, 0, 66, 55, 12, '12.Bölüm', 'Yanlış Pozitif', 'Marshall ve Lily, ekipteki herkesin hayatını yeniden değerlendirmesine neden olan sürpriz bir haber alır.', 1, 0, '2010-12-13', '2021-02-15 18:02:53', NULL),
(603, 0, 66, 55, 13, '13.Bölüm', 'Kötü Haber', 'Marshall ve Lily, bebek yapmalarına yardımcı olabilecek bir uzmanla görüştükten sonra aşırı tepki verir.', 1, 0, '2011-01-03', '2021-02-15 18:02:53', NULL),
(604, 0, 66, 55, 14, '14.Bölüm', 'Son Sözler', 'Ekip, Marshall\'ın zor bir dönemi atlatması için ellerinden ne gelirse yapmaya yemin eder.', 1, 0, '2011-01-17', '2021-02-15 18:02:53', NULL),
(605, 0, 66, 55, 15, '15.Bölüm', 'Canım Ya', 'Ted, Zoey\'ye karşı hisleri olduğunu fark eder. Bu sırada Barney, Zoey\'nin kuzenine asılır.', 1, 0, '2011-02-07', '2021-02-15 18:02:53', NULL),
(606, 0, 66, 55, 16, '16.Bölüm', 'Umutsuzluk Günü', 'Ekip, Sevgililer Günü\'nü yalnız geçirmek zorunda kalmayacakları planlar yapmak için uğraşır.', 1, 0, '2011-02-14', '2021-02-15 18:02:53', NULL),
(607, 0, 66, 55, 17, '17.Bölüm', 'Çöp Adası', 'Marshall, çevreyi korumayı takıntı haline getirir. Bu sırada Ted, Zoey\'nin eski kocasına rastlar.', 1, 0, '2011-02-21', '2021-02-15 18:02:53', NULL),
(608, 0, 66, 55, 18, '18.Bölüm', 'Kalbinin Sesi', 'Nora\'ya duyduğu hisler nedeniyle Barney\'nin kafası karışıktır.', 1, 0, '2011-02-28', '2021-02-15 18:02:53', NULL),
(609, 0, 66, 55, 19, '19.Bölüm', 'Efsane Baba', 'Barney nihayet babasıyla tanışır.', 1, 0, '2011-03-21', '2021-02-15 18:02:53', NULL),
(610, 0, 66, 55, 20, '20.Bölüm', 'Patlayan Köfteli Sandviç', 'Marshall, bir çevre kuruluşunda gönüllü olarak çalışmak için işinden istifa eder.', 1, 0, '2011-04-11', '2021-02-15 18:02:53', NULL),
(611, 0, 66, 55, 21, '21.Bölüm', 'Umutsuz', 'Barney, babasıyla daha yakın olmaya çalışır.', 1, 0, '2011-04-18', '2021-02-15 18:02:53', NULL),
(612, 0, 66, 55, 22, '22.Bölüm', 'Kusursuz Kokteyl', 'Marshall ve Barney, Arcadian Hotel\'in yıkılması hakkında tartışır.', 1, 0, '2011-05-02', '2021-02-15 18:02:53', NULL),
(613, 0, 66, 55, 23, '23.Bölüm', 'Kent Simgeleri', 'Ted, Zoey ile ilişkisini etkileyecek önemli bir karar verir.', 1, 0, '2011-05-09', '2021-02-15 18:02:53', NULL),
(614, 0, 66, 55, 24, '24.Bölüm', 'Meydan Okumanı Kabul Ediyorum', 'Ted, sağdıç olarak önemli bir düğüne katılır. Bu sırada Robin ve Barney, Ted\'in ilişkisiyle uğraşırken birbiriyle yakınlaşır.', 1, 0, '2011-05-16', '2021-02-15 18:02:53', NULL),
(615, 0, 66, 57, 1, '1.Bölüm', 'Farhampton', 'Robin\'in düğün gününde Ted, Victoria\'nın terk ettiği nişanlısına bir not bırakıp birlikte gün batımına doğru uzaklaştıkları günü hatırlar.', 1, 0, '2012-09-24', '2021-02-15 18:02:55', NULL),
(616, 0, 66, 57, 2, '2.Bölüm', 'Evlilik Sözleşmesi', 'Barney kapsamlı bir evlilik sözleşmesi hazırladığında, Ted ve Marshall bundan çok etkilenir ve sevgililerine kendi ilişkilerinin şartlarını değiştirmeyi teklif ederler.', 1, 0, '2012-10-01', '2021-02-15 18:02:55', NULL),
(617, 0, 66, 57, 3, '3.Bölüm', 'Dadılar', 'Lily ve Marshall bakıcı bulmakta zorlanınca, bunun Barney\'nin kızlarla tanışmak için hazırladığı kapsamlı plandan kaynaklandığını öğrenirler.', 1, 0, '2012-10-08', '2021-02-15 18:02:55', NULL),
(618, 0, 66, 57, 4, '4.Bölüm', 'Kim Vaftiz Ebeveyni Olmak İster?', 'Lily ve Marshall, Marvin\'in vaftiz ebeveynlerinin kim olacağına karar veremez. Bu nedenle, kimin en iyi vaftiz ebeveyni olacağını görmek için ekibi sınavdan geçirirler.', 1, 0, '2012-10-15', '2021-02-15 18:02:55', NULL),
(619, 0, 66, 57, 5, '5.Bölüm', 'Ayrılık Mevsimi', 'Ayrılık mevsimi devam ederken Ted ve Victoria, uzun ve karmaşık ilişkilerinde bir sonraki adımın ne olacağını seçmek zorundadır.', 1, 0, '2012-11-05', '2021-02-15 18:02:55', NULL),
(620, 0, 66, 57, 6, '6.Bölüm', 'Ayrılık Şehri', 'Robin, Nick\'ten ayrılma konusunda emin değildir. Bunun üzerine Barney ipleri eline alır. Bu sırada Lily ve Marshall, baş başa zaman geçirmek için yanıp tutuşmaktadır.', 1, 0, '2012-11-12', '2021-02-15 18:02:55', NULL),
(621, 0, 66, 57, 7, '7.Bölüm', 'Damga Sürtüğü', 'Marshall, çalıştığı firmadaki bir iş için hukuk fakültesinden eski sınıf arkadaşı Brad\'i tavsiye eder. Ancak mülakat kötü geçer ve hasar kontrolü yapmak Marshall\'a kalır.', 1, 0, '2012-11-19', '2021-02-15 18:02:55', NULL),
(622, 0, 66, 57, 8, '8.Bölüm', '12 Azgın Kadın', 'Marshall, kariyerinin en büyük davasında Brad\'le karşı karşıya gelir. Bu sırada, ekip kendilerinin yasaları çiğnediği zamanları hatırlar.', 1, 0, '2012-11-26', '2021-02-15 18:02:55', NULL),
(623, 0, 66, 57, 9, '9.Bölüm', 'Istakoz Emeklemesi', 'Robin, her ne pahasına olursa olsun Barney\'yi geri kazanmayı aklına koymuştur. Bu sırada Ted, Marvin\'e bakıcılık yapar.', 1, 0, '2012-12-03', '2021-02-15 18:02:55', NULL),
(624, 0, 66, 57, 10, '10.Bölüm', 'Abartılı Telafi', 'Robin, Barney\'nin Patrice\'le ilişkisinden giderek daha fazla şüphelenir. Marshall, annesinin yeni bir ilişkisi olduğunu öğrenir.', 1, 0, '2012-12-10', '2021-02-15 18:02:55', NULL),
(625, 0, 66, 57, 11, '11.Bölüm', 'Son Sayfa: Kısım 1', 'Noel hızla yaklaşırken Barney, Patrice\'e evlenme teklif etmeyi düşündüğünü Ted\'e söyler. Ted, bunu Robin\'e söyleyip söylememe konusunda kararsızdır. Kısım 1/2.', 1, 0, '2012-12-17', '2021-02-15 18:02:55', NULL),
(626, 0, 66, 57, 12, '12.Bölüm', 'Son Sayfa: Kısım 2', 'Noel hızla yaklaşırken Barney, Patrice\'e evlenme teklif etmeyi düşündüğünü Ted\'e söyler. Ted, bunu Robin\'e söyleyip söylememe konusunda kararsızdır. Kısım 2/2.', 1, 0, '2012-12-17', '2021-02-15 18:02:55', NULL),
(627, 0, 66, 57, 13, '13.Bölüm', 'Grup mu DJ mi?', 'Robin, Barney\'nin evlilik teklifi öncesinde babasından izin istemediğini öğrenince, Barney\'ye babasının onayını alması için ısrar eder.', 1, 0, '2013-01-14', '2021-02-15 18:02:55', NULL),
(628, 0, 66, 57, 14, '14.Bölüm', 'Yüzüğün Gücü', 'Barney, Ted\'e aşırı genç, aşırı vahşi kız arkadaşıyla görüşmeye devam etmesi için yalvarır, ancak Ted\'in onunla hiçbir ortak noktası yoktur.', 1, 0, '2013-01-21', '2021-02-15 18:02:55', NULL),
(629, 0, 66, 57, 15, '15.Bölüm', 'Not: Seni Seviyorum', 'Barney, Robin\'in Robin Sparkles olarak rol aldığı \"Ezgilerin Altında\"nın kayıp bölümünü bulur. Marshall ve Lily, Ted\'in yeni sevgilisinin takipçi olduğundan endişelenir.', 1, 0, '2013-02-04', '2021-02-15 18:02:55', NULL),
(630, 0, 66, 57, 16, '16.Bölüm', 'Kötü Bir Delilik', 'Ted, çılgın kız arkadaşı Jeanette\'ten ayrılma konusunda isteksizdir. Bu sırada Robin, Marvin\'i ilk kez kucağına aldığında ona bağlanır.', 1, 0, '2013-02-11', '2021-02-15 18:02:55', NULL),
(631, 0, 66, 57, 17, '17.Bölüm', 'Küllük', 'Ted, Kaptan\'dan beklenmedik bir telefon aldığında, ekip onunla son tuhaf karşılaşmalarını hatırlar.', 1, 0, '2013-02-18', '2021-02-15 18:02:55', NULL),
(632, 0, 66, 57, 18, '18.Bölüm', 'Barney\'de Hafta Sonu', 'Ted ve Jeanette ayrılınca, Barney Robin\'in yok ettiğini sandığı meşhur Av Rehberi\'ni kullanarak Ted\'in yeni bir kızı tavlamasına yardım etmeye çalışır.', 1, 0, '2013-02-25', '2021-02-15 18:02:55', NULL),
(633, 0, 66, 57, 19, '19.Bölüm', 'Kale', 'Robin, birlikte yeni bir ev kurabilmeleri için Barney\'den bekâr evini satmasını ister. Ancak Barney evi satmaya yanaşmamaktadır ve potansiyel alıcıları kaçırır.', 1, 0, '2013-03-18', '2021-02-15 18:02:55', NULL);
INSERT INTO `dizi_bolum` (`bolum_id`, `rank`, `dizi_id`, `sezon_id`, `bolum_kod`, `bolum_adi`, `bolum_baslik`, `bolum_ozet`, `bolum_durum`, `bolum_izlenme_durum`, `bolum_tarih`, `createdAt`, `updatedAt`) VALUES
(634, 0, 66, 57, 20, '20.Bölüm', 'Zaman Yolcuları', 'Ted ve Barney\'nin gelecekteki versiyonları, Ted\'i Robotlar Güreşçilere Karşı\'yı görmeye ikna etmeye çalışır. Bu sırada, Marshall bir dans yarışında Robin\'e meydan okur.', 1, 0, '2013-03-25', '2021-02-15 18:02:55', NULL),
(635, 0, 66, 57, 21, '21.Bölüm', 'İstikamet Roma', 'Kaptan, sanat danışmanı olması için Lily\'den bir yıllığına Roma\'ya taşınmasını isteyince, Lily Marshall\'ın kendisine bozulacağından korkar.', 1, 0, '2013-04-15', '2021-02-15 18:02:55', NULL),
(636, 0, 66, 57, 22, '22.Bölüm', 'Kanka Mitzvahı', 'Ekip, Barney için efsanevi bir bekârlığa veda partisi düzenlemek için kolları sıvar.', 1, 0, '2013-04-29', '2021-02-15 18:02:55', NULL),
(637, 0, 66, 57, 23, '23.Bölüm', 'Eski Bir Şey', 'Robin, düğünü için yıllar önce Central Park\'a gömdüğü \"eski bir şeyi\" bulmaya çalışır.', 1, 0, '2013-05-06', '2021-02-15 18:02:55', NULL),
(638, 0, 66, 57, 24, '24.Bölüm', 'Yeni Bir Şey', 'Ted, Lily\'yi tadilatını yaptığı evi görmeye götürür. Robin ve Barney, baş başa sakin bir gece geçirmek ister, ancak geceleri kaba şekilde kesintiye uğrar.', 1, 0, '2013-05-13', '2021-02-15 18:02:55', NULL),
(639, 0, 66, 58, 1, '1.Bölüm', 'Madalyon', 'Robin ve Barney, düğünlerinin gerçekleşeceği hafta sonu için Long Island\'a giderken şoke edici bir aile sırrını keşfederler.', 1, 0, '2013-09-23', '2021-02-15 18:02:57', NULL),
(640, 0, 66, 58, 2, '2.Bölüm', 'Geri Döneceğim', 'Mahsur kalan Marshall düğün için New York\'a ulaşmanın bir yolunu bulmaya çalışırken James, Robin\'i çok huzursuz eden bir haber verir.', 1, 0, '2013-09-23', '2021-02-15 18:02:57', NULL),
(641, 0, 66, 58, 3, '3.Bölüm', 'Son Defa New York\'ta', 'Lily, Ted\'in New York\'tan ayrılmadan önce yapacağı şeylerin listesini bulur. Barney ve Robin, akrabaları gelirken biraz baş başa zaman geçirmek için kaçmaya çalışır.', 1, 0, '2013-09-30', '2021-02-15 18:02:57', NULL),
(642, 0, 66, 58, 4, '4.Bölüm', 'Kanunu Çiğnemek', 'Barney, Ted\'in hâlâ Robin\'e karşı hisleri olduğunu öğrendikten sonra öfkesini kontrol etmeye çalışırken Marshall aralarındaki anlaşmazlığı çözmeye çalışır.', 1, 0, '2013-10-07', '2021-02-15 18:02:57', NULL),
(643, 0, 66, 58, 5, '5.Bölüm', 'Poker Oyunu', 'Barney, Robin ile kendi annesi arasındaki bir kavgada taraf tutmaya zorlandığında, Lily ilişkisini mahvetmemesi için ona akıl verir.', 1, 0, '2013-10-14', '2021-02-15 18:02:57', NULL),
(644, 0, 66, 58, 6, '6.Bölüm', 'Şövalye Görüşü', 'Ted düğüne birlikte gidebileceği üç aday arasından talihsiz bir seçim yapar. Marshall, yol arkadaşı hakkında daha çok şey öğrenir.', 1, 0, '2013-10-21', '2021-02-15 18:02:57', NULL),
(645, 0, 66, 58, 7, '7.Bölüm', 'Soru Sormak Yok', 'Daphne, Lily\'ye rahatsız edici bir mesaj attığında, Marshall \"soru sormak yok\" kuralını uygulayarak ekipten mesajı silmeye yardım etmelerini ister.', 1, 0, '2013-10-28', '2021-02-15 18:02:57', NULL),
(646, 0, 66, 58, 8, '8.Bölüm', 'Deniz Feneri', 'Robin ile Loretta arasındaki anlaşmazlık artarken Barney arada kalır. Bu sırada, Ted ve Cassie deniz feneri gezisinin tadını çıkarmaya çalışır.', 1, 0, '2013-11-04', '2021-02-15 18:02:57', NULL),
(647, 0, 66, 58, 9, '9.Bölüm', 'Platonik', 'Ekip; Ted, Robin ve Barney arasındaki aşk üçgeninin akıbeti üzerine kafa yorar. Bu sırada Barney, Lily ve Robin\'in meydan okumalarını kabul eder.', 1, 0, '2013-11-11', '2021-02-15 18:02:57', NULL),
(648, 0, 66, 58, 10, '10.Bölüm', 'Anne ve Baba', 'Barney\'nin babası otele geldiğinde, Barney Robin\'i huzursuz eden bir plan yapar. Ted, düğünle ilgili görevlerini yerine getirmemekle suçlanır.', 1, 0, '2013-11-18', '2021-02-15 18:02:57', NULL),
(649, 0, 66, 58, 11, '11.Bölüm', 'Uyku Masalları', 'Marshall, huysuz oğlunu uyutabilmek için ona kafiyeli üç masal anlatır.', 1, 0, '2013-11-25', '2021-02-15 18:02:57', NULL),
(650, 0, 66, 58, 12, '12.Bölüm', 'Prova Yemeği', 'Robin her ne kadar karşı çıksa da, Barney prova yemeğinin bir laser tag salonunda düzenlenmesini takıntı haline getirir. Bu sırada, Ted verdiği bir sözü tutamaz.', 1, 0, '2013-12-02', '2021-02-15 18:02:57', NULL),
(651, 0, 66, 58, 13, '13.Bölüm', 'Basçı Aranıyor', 'Ekip, düğünde aralarında kasıtlı olarak sorun çıkaran bir adamla karşılaşır. Marshall nihayet düğünün yapılacağı Farhampton Inn\'e varır.', 1, 0, '2013-12-16', '2021-02-15 18:02:57', NULL),
(652, 0, 66, 58, 14, '14.Bölüm', 'Tokat Günü 3', 'Barney\'ye dehşet bir son tokat armak isteyen Marshall, \"Patlayan Milyon Güneşin Tokadı\" konusunda nasıl ustalaştığını açıklar.', 1, 0, '2014-01-13', '2021-02-15 18:02:57', NULL),
(653, 0, 66, 58, 15, '15.Bölüm', 'Başlat', 'Barney içkiyi fazla kaçırınca, Ted ve Robin onun bu halinden faydalanır ve yıllardır sakladığı sırları açıklamasını sağlamaya çalışırlar.', 1, 0, '2014-01-20', '2021-02-15 18:02:57', NULL),
(654, 0, 66, 58, 16, '16.Bölüm', 'Anneniz Benimle Nasıl Tanıştı?', 'Anne, Ted\'le nasıl tanıştığını ve son sekiz yıldır neler yaptığını anlatır.', 1, 0, '2014-01-27', '2021-02-15 18:02:57', NULL),
(655, 0, 66, 58, 17, '17.Bölüm', 'Gün Doğumu', 'Düğün gününde zil zurna sarhoş olan Barney\'yi arayan Robin ve Ted, eski ilişkilerini hatırlar.', 1, 0, '2014-02-03', '2021-02-15 18:02:57', NULL),
(656, 0, 66, 58, 18, '18.Bölüm', 'Toparlanmak', 'Barney düğün gününde berbat şekilde akşamdan kalmadır. Ekip, bu durumu düzelttiği bilinen bir iksirin içindeki abartılı malzemelerin ne olduğunu öğrenmeye çalışır.', 1, 0, '2014-02-24', '2021-02-15 18:02:57', NULL),
(657, 0, 66, 58, 19, '19.Bölüm', 'Vezüv', 'Düğün sabahında, Lily ile Robin kavga eder ve Barney hangi takım elbiseyi giyeceğine bir türlü karar veremez.', 1, 0, '2014-03-03', '2021-02-15 18:02:57', NULL),
(658, 0, 66, 58, 20, '20.Bölüm', 'Papatya', 'Marshall, Lily\'nin kavgalarının ortasında nereye gittiğini bulmak için Ted ve Barney\'den yardım ister.', 1, 0, '2014-03-10', '2021-02-15 18:02:57', NULL),
(659, 0, 66, 58, 21, '21.Bölüm', 'Gary Blauman', 'Gary Blauman düğüne geldiğinde, ekipteki herkes onunla bir karşılaşmasını hatırlar ve büyük bir kargaşa çıkar.', 1, 0, '2014-03-17', '2021-02-15 18:02:57', NULL),
(660, 0, 66, 58, 22, '22.Bölüm', 'Mihrap', 'Düğüne sadece yarım saat kalmışken, Barney ve Robin evlilikle ilgili panik ataklar geçirir. Marshall ve Lily, eski düğün yeminlerini yeniden yazarlar.', 1, 0, '2014-03-24', '2021-02-15 18:02:57', NULL),
(661, 0, 66, 58, 23, '23.Bölüm', 'Sonsuza Kadar: Kısım 1', 'Ted nihayet çocuklarına anneleriyle nasıl tanıştığının hikâyesini anlatmayı bitirir.', 1, 0, '2014-03-31', '2021-02-15 18:02:57', NULL),
(662, 0, 66, 58, 24, '24.Bölüm', 'Sonsuza Kadar: Kısım 2', 'Ted nihayet çocuklarına anneleriyle nasıl tanıştığının hikâyesini anlatmayı bitirir. Barney, hayatını değiştiren bir deneyim yaşar.', 1, 0, '2014-03-31', '2021-02-15 18:02:57', NULL),
(666, 0, 62, 38, 4, '4.Bölüm', '4. Bölüm', '', 1, 0, '2010-10-14', '2021-02-15 18:22:58', NULL),
(667, 0, 62, 38, 5, '5.Bölüm', '5. Bölüm', '', 1, 0, '2010-10-21', '2021-02-15 18:22:58', NULL),
(668, 0, 62, 38, 6, '6.Bölüm', '6. Bölüm', '', 1, 0, '2010-10-28', '2021-02-15 18:22:58', NULL),
(669, 0, 62, 38, 7, '7.Bölüm', '7. Bölüm', '', 1, 0, '2010-11-04', '2021-02-15 18:22:58', NULL),
(670, 0, 62, 38, 8, '8.Bölüm', '8. Bölüm', '', 1, 0, '2010-11-11', '2021-02-15 18:22:58', NULL),
(671, 0, 62, 38, 9, '9.Bölüm', '9. Bölüm', '', 1, 0, '2010-11-18', '2021-02-15 18:22:58', NULL),
(672, 0, 62, 38, 10, '10.Bölüm', '10. Bölüm', '', 1, 0, '2010-12-02', '2021-02-15 18:22:58', NULL),
(673, 0, 62, 38, 11, '11.Bölüm', '11. Bölüm', '', 1, 0, '2011-01-06', '2021-02-15 18:22:58', NULL),
(674, 0, 62, 38, 12, '12.Bölüm', '12. Bölüm', '', 1, 0, '2011-01-13', '2021-02-15 18:22:58', NULL),
(675, 0, 62, 38, 13, '13.Bölüm', '13. Bölüm', '', 1, 0, '2011-02-03', '2021-02-15 18:22:58', NULL),
(676, 0, 62, 38, 14, '14.Bölüm', '14. Bölüm', '', 1, 0, '2011-02-10', '2021-02-15 18:22:58', NULL),
(677, 0, 62, 38, 15, '15.Bölüm', '15. Bölüm', '', 1, 0, '2011-02-17', '2021-02-15 18:22:58', NULL),
(678, 0, 62, 38, 16, '16.Bölüm', '16. Bölüm', '', 1, 0, '2011-02-24', '2021-02-15 18:22:58', NULL),
(679, 0, 62, 38, 17, '17.Bölüm', '17. Bölüm', '', 1, 0, '2011-03-24', '2021-02-15 18:22:58', NULL),
(680, 0, 62, 38, 18, '18.Bölüm', '18. Bölüm', '', 1, 0, '2011-03-31', '2021-02-15 18:22:58', NULL),
(681, 0, 62, 38, 19, '19.Bölüm', '19. Bölüm', '', 1, 0, '2011-04-28', '2021-02-15 18:22:58', NULL),
(682, 0, 62, 38, 20, '20.Bölüm', '20. Bölüm', '', 1, 0, '2011-05-05', '2021-02-15 18:22:58', NULL),
(683, 0, 62, 38, 21, '21.Bölüm', '21. Bölüm', '', 1, 0, '2011-05-12', '2021-02-15 18:22:58', NULL),
(684, 0, 62, 38, 22, '22.Bölüm', '22. Bölüm', '', 1, 0, '2011-05-19', '2021-02-15 18:22:58', NULL),
(685, 0, 71, 84, 1, '1.Bölüm', '1. Bölüm', '', 1, 0, '2014-10-07', '2021-02-16 16:17:32', NULL),
(686, 0, 71, 84, 2, '2.Bölüm', '2. Bölüm', '', 1, 0, '2014-10-14', '2021-02-16 16:17:32', NULL),
(687, 0, 71, 84, 3, '3.Bölüm', '3. Bölüm', '', 1, 0, '2014-10-21', '2021-02-16 16:17:32', NULL),
(688, 0, 71, 84, 4, '4.Bölüm', '4. Bölüm', '', 1, 0, '2014-10-28', '2021-02-16 16:17:32', NULL),
(689, 0, 71, 84, 5, '5.Bölüm', '5. Bölüm', '', 1, 0, '2014-11-11', '2021-02-16 16:17:32', NULL),
(690, 0, 71, 84, 6, '6.Bölüm', '6. Bölüm', '', 1, 0, '2014-11-18', '2021-02-16 16:17:32', NULL),
(691, 0, 71, 84, 7, '7.Bölüm', '7. Bölüm', '', 1, 0, '2014-11-25', '2021-02-16 16:17:32', NULL),
(692, 0, 71, 84, 8, '8.Bölüm', '8. Bölüm', '', 1, 0, '2014-12-02', '2021-02-16 16:17:32', NULL),
(693, 0, 71, 84, 9, '9.Bölüm', '9. Bölüm', '', 1, 0, '2014-12-09', '2021-02-16 16:17:32', NULL),
(694, 0, 71, 84, 10, '10.Bölüm', '10. Bölüm', '', 1, 0, '2015-01-20', '2021-02-16 16:17:32', NULL),
(695, 0, 71, 84, 11, '11.Bölüm', '11. Bölüm', '', 1, 0, '2015-01-27', '2021-02-16 16:17:32', NULL),
(696, 0, 71, 84, 12, '12.Bölüm', '12. Bölüm', '', 1, 0, '2015-02-03', '2021-02-16 16:17:32', NULL),
(697, 0, 71, 84, 13, '13.Bölüm', '13. Bölüm', '', 1, 0, '2015-02-10', '2021-02-16 16:17:32', NULL),
(698, 0, 71, 84, 14, '14.Bölüm', '14. Bölüm', '', 1, 0, '2015-02-17', '2021-02-16 16:17:32', NULL),
(699, 0, 71, 84, 15, '15.Bölüm', '15. Bölüm', '', 1, 0, '2015-03-17', '2021-02-16 16:17:32', NULL),
(700, 0, 71, 84, 16, '16.Bölüm', '16. Bölüm', '', 1, 0, '2015-03-24', '2021-02-16 16:17:32', NULL),
(701, 0, 71, 84, 17, '17.Bölüm', '17. Bölüm', '', 1, 0, '2015-03-31', '2021-02-16 16:17:32', NULL),
(702, 0, 71, 84, 18, '18.Bölüm', '18. Bölüm', '', 1, 0, '2015-04-14', '2021-02-16 16:17:32', NULL),
(703, 0, 71, 84, 19, '19.Bölüm', '19. Bölüm', '', 1, 0, '2015-04-21', '2021-02-16 16:17:32', NULL),
(704, 0, 71, 84, 20, '20.Bölüm', '20. Bölüm', '', 1, 0, '2015-04-28', '2021-02-16 16:17:32', NULL),
(705, 0, 71, 84, 21, '21.Bölüm', '21. Bölüm', '', 1, 0, '2015-05-05', '2021-02-16 16:17:32', NULL),
(706, 0, 71, 84, 22, '22.Bölüm', '22. Bölüm', '', 1, 0, '2015-05-12', '2021-02-16 16:17:32', NULL),
(707, 0, 71, 84, 23, '23.Bölüm', '23. Bölüm', '', 1, 0, '2015-05-19', '2021-02-16 16:17:32', NULL),
(708, 0, 71, 85, 1, '1.Bölüm', 'Pilot', 'özet mi hmm', 1, 0, '0000-00-00', '2021-02-16 16:18:19', NULL);

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

INSERT INTO `dizi_kaynak` (`kaynak_id`, `dizi_id`, `sezon_id`, `bolum_id`, `kaynak_adi`, `kaynak_icerik`, `kaynak_durum`, `createdAt`, `updatedAt`) VALUES
(24, 70, 78, 344, 'Orjinal', 'https://yd.sheila.stream/embed/8112-5e9b1e251b95a0555d9967cd', 1, '2021-02-14 21:35:05', '2021-02-15 12:41:48');

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

INSERT INTO `dizi_sezon` (`sezon_id`, `rank`, `dizi_id`, `sezon_kod`, `sezon_baslik`, `sezon_tarih`, `sezon_durum`, `sezon_izlenme_durum`, `createdAt`, `updatedAt`) VALUES
(4, 0, 1, 1, '1.Sezon', '2005-09-13', 1, 0, '2021-02-13 17:58:15', '2021-02-13 21:28:51'),
(5, 0, 1, 2, '2.Sezon', '2006-09-28', 1, 0, '2021-02-13 17:58:51', NULL),
(6, 0, 1, 3, '3.Sezon', '2007-10-04', 1, 0, '2021-02-13 17:59:13', NULL),
(7, 0, 1, 4, '4.Sezon', '2008-09-18', 1, 0, '2021-02-13 17:59:28', NULL),
(8, 0, 1, 5, '5.Sezon', '2009-09-10', 1, 0, '2021-02-13 17:59:45', NULL),
(9, 0, 1, 6, '6.Sezon', '2010-09-24', 1, 0, '2021-02-13 18:00:03', NULL),
(10, 0, 1, 7, '7.Sezon', '2011-09-23', 1, 0, '2021-02-13 18:00:23', NULL),
(11, 0, 1, 8, '8.Sezon', '2012-10-03', 1, 0, '2021-02-13 18:00:38', NULL),
(12, 0, 1, 9, '9.Sezon', '2013-10-08', 1, 0, '2021-02-13 18:01:37', NULL),
(13, 0, 1, 10, '10.Sezon', '2014-10-07', 1, 0, '2021-02-13 18:02:02', NULL),
(14, 0, 1, 11, '11.Sezon', '2015-10-07', 1, 0, '2021-02-13 18:02:26', NULL),
(15, 0, 1, 12, '12.Sezon', '2016-10-13', 1, 0, '2021-02-13 18:02:40', NULL),
(16, 0, 1, 13, '13.Sezon', '2017-10-12', 1, 0, '2021-02-13 18:02:54', NULL),
(17, 0, 1, 14, '14.Sezon', '2018-10-11', 1, 0, '2021-02-13 18:03:04', NULL),
(18, 0, 1, 15, '15.Sezon', '2019-10-10', 1, 0, '2021-02-13 18:03:22', NULL),
(20, 0, 61, 1, '1.Sezon', '2019-10-12', 1, 0, '2021-02-14 00:36:13', NULL),
(33, 1, 62, 2, 'Sezon 2', '2005-09-25', 1, 0, '2021-02-14 16:12:28', NULL),
(32, 0, 62, 1, 'Sezon 1', '2005-03-27', 1, 0, '2021-02-14 16:12:28', NULL),
(31, 17, 62, 0, 'Specials', '2006-01-08', 1, 0, '2021-02-14 16:12:28', NULL),
(49, 9, 66, 0, 'Specials', '2006-11-20', 1, 0, '2021-02-14 16:12:47', NULL),
(22, 8, 64, 0, 'Specials', '2009-08-25', 1, 0, '2021-02-14 16:11:24', NULL),
(23, 0, 64, 1, 'Sezon 1', '2009-09-10', 1, 0, '2021-02-14 16:11:24', NULL),
(24, 1, 64, 2, 'Sezon 2', '2010-09-09', 1, 0, '2021-02-14 16:11:24', NULL),
(25, 2, 64, 3, 'Sezon 3', '2011-09-15', 1, 0, '2021-02-14 16:11:24', NULL),
(26, 3, 64, 4, 'Sezon 4', '2012-10-11', 1, 0, '2021-02-14 16:11:24', NULL),
(27, 4, 64, 5, 'Sezon 5', '2013-10-03', 1, 0, '2021-02-14 16:11:24', NULL),
(28, 5, 64, 6, 'Sezon 6', '2014-10-02', 1, 0, '2021-02-14 16:11:24', NULL),
(29, 6, 64, 7, 'Sezon 7', '2015-10-08', 1, 0, '2021-02-14 16:11:24', NULL),
(30, 7, 64, 8, 'Sezon 8', '2016-10-21', 1, 0, '2021-02-14 16:11:24', NULL),
(34, 2, 62, 3, 'Sezon 3', '2006-09-21', 1, 0, '2021-02-14 16:12:28', NULL),
(35, 3, 62, 4, 'Sezon 4', '2007-09-27', 1, 0, '2021-02-14 16:12:28', NULL),
(36, 4, 62, 5, 'Sezon 5', '2008-09-25', 1, 0, '2021-02-14 16:12:28', NULL),
(37, 5, 62, 6, 'Sezon 6', '2009-09-24', 1, 0, '2021-02-14 16:12:28', NULL),
(38, 6, 62, 7, 'Sezon 7', '2010-09-23', 1, 0, '2021-02-14 16:12:28', NULL),
(39, 7, 62, 8, 'Sezon 8', '2011-09-22', 1, 0, '2021-02-14 16:12:28', NULL),
(40, 8, 62, 9, 'Sezon 9', '2012-09-27', 1, 0, '2021-02-14 16:12:28', NULL),
(41, 9, 62, 10, 'Sezon 10', '2013-09-26', 1, 0, '2021-02-14 16:12:28', NULL),
(42, 10, 62, 11, 'Sezon 11', '2014-09-25', 1, 0, '2021-02-14 16:12:28', NULL),
(43, 11, 62, 12, 'Sezon 12', '2015-09-24', 1, 0, '2021-02-14 16:12:28', NULL),
(44, 12, 62, 13, 'Sezon 13', '2016-09-22', 1, 0, '2021-02-14 16:12:28', NULL),
(45, 13, 62, 14, 'Sezon 14', '2017-09-28', 1, 0, '2021-02-14 16:12:28', NULL),
(46, 14, 62, 15, 'Sezon 15', '2018-09-27', 1, 0, '2021-02-14 16:12:28', NULL),
(47, 15, 62, 16, 'Sezon 16', '2019-09-26', 1, 0, '2021-02-14 16:12:28', NULL),
(48, 16, 62, 17, 'Sezon 17', '2020-11-12', 1, 0, '2021-02-14 16:12:28', NULL),
(50, 0, 66, 1, 'Sezon 1', '2005-09-19', 1, 0, '2021-02-14 16:12:47', NULL),
(51, 1, 66, 2, 'Sezon 2', '2006-09-18', 1, 0, '2021-02-14 16:12:47', NULL),
(52, 2, 66, 3, 'Sezon 3', '2007-09-24', 1, 0, '2021-02-14 16:12:47', NULL),
(53, 3, 66, 4, 'Sezon 4', '2008-09-22', 1, 0, '2021-02-14 16:12:47', NULL),
(54, 4, 66, 5, 'Sezon 5', '2009-09-21', 1, 0, '2021-02-14 16:12:47', NULL),
(55, 5, 66, 6, 'Sezon 6', '2010-09-20', 1, 0, '2021-02-14 16:12:47', NULL),
(56, 6, 66, 7, 'Sezon 7', '2011-09-19', 1, 0, '2021-02-14 16:12:47', NULL),
(57, 7, 66, 8, 'Sezon 8', '2012-09-24', 1, 0, '2021-02-14 16:12:47', NULL),
(58, 8, 66, 9, 'Sezon 9', '2013-09-23', 1, 0, '2021-02-14 16:12:47', NULL),
(59, 0, 65, 1, 'Sezon 1', '2021-01-15', 1, 0, '2021-02-14 16:13:33', NULL),
(82, 4, 70, 5, 'Sezon 5', '2012-07-14', 1, 0, '2021-02-14 17:53:33', NULL),
(61, 0, 67, 1, 'Sezon 1', '2001-10-16', 1, 0, '2021-02-14 17:11:38', NULL),
(62, 0, 67, 2, 'Sezon 2', '2002-09-24', 1, 0, '2021-02-14 17:11:38', NULL),
(63, 0, 67, 3, 'Sezon 3', '2003-09-30', 1, 0, '2021-02-14 17:11:38', NULL),
(64, 0, 67, 4, 'Sezon 4', '2004-09-21', 1, 0, '2021-02-14 17:11:38', NULL),
(65, 0, 67, 5, 'Sezon 5', '2005-09-21', 1, 0, '2021-02-14 17:11:38', NULL),
(66, 0, 67, 6, 'Sezon 6', '2006-09-27', 1, 0, '2021-02-14 17:11:38', NULL),
(67, 0, 67, 7, 'Sezon 7', '2007-09-26', 1, 0, '2021-02-14 17:11:38', NULL),
(68, 0, 67, 8, 'Sezon 8', '2008-09-17', 1, 0, '2021-02-14 17:11:38', NULL),
(69, 0, 67, 9, 'Sezon 9', '2009-09-24', 1, 0, '2021-02-14 17:11:38', NULL),
(70, 0, 67, 10, 'Sezon 10', '2010-09-23', 1, 0, '2021-02-14 17:11:38', NULL),
(81, 3, 70, 4, 'Sezon 4', '2011-07-16', 1, 0, '2021-02-14 17:53:33', NULL),
(80, 2, 70, 3, 'Sezon 3', '2010-03-20', 1, 0, '2021-02-14 17:53:33', NULL),
(79, 1, 70, 2, 'Sezon 2', '2009-03-07', 1, 0, '2021-02-14 17:53:33', NULL),
(78, 0, 70, 1, 'Sezon 1', '2008-01-19', 1, 0, '2021-02-14 17:53:33', NULL),
(77, 5, 70, 0, 'Specials', '2009-02-17', 1, 0, '2021-02-14 17:53:33', NULL),
(83, 0, 71, 0, 'Specials', '2016-04-19', 1, 0, '2021-02-16 16:17:27', NULL),
(84, 0, 71, 1, 'Sezon 1', '2014-10-07', 1, 0, '2021-02-16 16:17:27', NULL),
(85, 0, 71, 2, 'Sezon 2', '2015-10-06', 1, 0, '2021-02-16 16:17:27', NULL),
(86, 0, 71, 3, 'Sezon 3', '2016-10-04', 1, 0, '2021-02-16 16:17:27', NULL),
(87, 0, 71, 4, 'Sezon 4', '2017-10-10', 1, 0, '2021-02-16 16:17:27', NULL),
(88, 0, 71, 5, 'Sezon 5', '2018-10-09', 1, 0, '2021-02-16 16:17:27', NULL),
(89, 0, 71, 6, 'Sezon 6', '2019-10-08', 1, 0, '2021-02-16 16:17:27', NULL),
(90, 0, 71, 7, 'Sezon 7', '2021-03-02', 1, 0, '2021-02-16 16:17:27', NULL);

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

INSERT INTO `yorumlar` (`id`, `dizi_id`, `sezon_id`, `bolum_id`, `yorum_ad_soyad`, `yorum_email`, `yorum_icerik`, `yorum_durum`, `yorum_spoiler`, `createdAt`, `updatedAt`) VALUES
(3, 64, 0, 0, 'Burak', 'burak@codetify.com.tr', 'spoiler', 1, 1, '2021-02-13 13:47:01', '2021-02-13 10:47:35'),
(4, 70, 0, 0, 'Burak Dündar', 'burak@codetify.com.tr', 'deneme', 1, NULL, '2021-02-15 13:22:52', '2021-02-15 10:22:57'),
(6, 70, 78, 344, 'Burak Dündar', 'burak@codetify.com.tr', 'bölüm yorumuss', 1, NULL, '2021-02-15 15:59:50', '2021-02-15 12:59:56');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
