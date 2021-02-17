<?php

function convertToSEO($text){

    $turkce  = array("ç","Ç","ğ","Ğ","ü","Ü","ö","Ö","ı","İ","ş","Ş",".",",","!","'","\""," ","?","*","_","|","=","(",")","[","]","{","}");
    $convert = array("c","c","g","g","u","u","o","o","i","I","s","s","-","-","-","-","-","-","-","-","-","-","-","-","-","-","-","-","-","-","-");

    return strtolower(str_replace($turkce,$convert,$text));
}

//menüleri getir
if(!function_exists('helper_menu')){
    function helper_menu(){
        $t = &get_instance();
        $t->load->model("anasayfa_model");
        return $t->anasayfa_model->menu_sayfalar();
    }
}

if(!function_exists('enckizlenenler')){
    function enckizlenenler(){
        $t = &get_instance();
        $t->load->model("anasayfa_model");
        return $t->anasayfa_model->enckizlenenler();
    }
}

//alt yorumlari getir
if (!function_exists('helper_alt_yorumlar')) {
    function helper_alt_yorumlar($yorum_id){
        $ci =& get_instance();
        $ci->load->model('anasayfa_model');
        return $ci->anasayfa_model->dizi_alt_yorumlari($yorum_id);
    }
}

if (!function_exists('helper_comment_date_format')) {
    function helper_comment_date_format($datetime)
    {
        $ci =& get_instance();
        $date = date("M j, Y g:i a", strtotime($datetime));
        $date = str_replace("Jan", $ci->lang->line("January"), $date);
        $date = str_replace("Feb", $ci->lang->line("February"), $date);
        $date = str_replace("Mar", $ci->lang->line("March"), $date);
        $date = str_replace("Apr", $ci->lang->line("April"), $date);
        $date = str_replace("May", $ci->lang->line("May"), $date);
        $date = str_replace("Jun", $ci->lang->line("June"), $date);
        $date = str_replace("Jul", $ci->lang->line("July"), $date);
        $date = str_replace("Aug", $ci->lang->line("August"), $date);
        $date = str_replace("Sep", $ci->lang->line("September"), $date);
        $date = str_replace("Oct", $ci->lang->line("October"), $date);
        $date = str_replace("Nov", $ci->lang->line("November"), $date);
        $date = str_replace("Dec", $ci->lang->line("December"), $date);
        return $date;
    }
}

//slug generator
if (!function_exists('str_slug')) {
    function str_slug($str, $separator = 'dash', $lowercase = TRUE)
    {
        $CI =& get_instance();
        $foreign_characters = array(
            '/ä|æ|ǽ/' => 'ae',
            '/ö|œ/' => 'o',
            '/ü/' => 'u',
            '/Ä/' => 'Ae',
            '/Ü/' => 'u',
            '/Ö/' => 'o',
            '/À|Á|Â|Ã|Ä|Å|Ǻ|Ā|Ă|Ą|Ǎ|Α|Ά|Ả|Ạ|Ầ|Ẫ|Ẩ|Ậ|Ằ|Ắ|Ẵ|Ẳ|Ặ|А/' => 'A',
            '/à|á|â|ã|å|ǻ|ā|ă|ą|ǎ|ª|α|ά|ả|ạ|ầ|ấ|ẫ|ẩ|ậ|ằ|ắ|ẵ|ẳ|ặ|а/' => 'a',
            '/Б/' => 'B',
            '/б/' => 'b',
            '/Ç|Ć|Ĉ|Ċ|Č/' => 'C',
            '/ç|ć|ĉ|ċ|č/' => 'c',
            '/Д/' => 'D',
            '/д/' => 'd',
            '/Ð|Ď|Đ|Δ/' => 'Dj',
            '/ð|ď|đ|δ/' => 'dj',
            '/È|É|Ê|Ë|Ē|Ĕ|Ė|Ę|Ě|Ε|Έ|Ẽ|Ẻ|Ẹ|Ề|Ế|Ễ|Ể|Ệ|Е|Э/' => 'E',
            '/è|é|ê|ë|ē|ĕ|ė|ę|ě|έ|ε|ẽ|ẻ|ẹ|ề|ế|ễ|ể|ệ|е|э/' => 'e',
            '/Ф/' => 'F',
            '/ф/' => 'f',
            '/Ĝ|Ğ|Ġ|Ģ|Γ|Г|Ґ/' => 'G',
            '/ĝ|ğ|ġ|ģ|γ|г|ґ/' => 'g',
            '/Ĥ|Ħ/' => 'H',
            '/ĥ|ħ/' => 'h',
            '/Ì|Í|Î|Ï|Ĩ|Ī|Ĭ|Ǐ|Į|İ|Η|Ή|Ί|Ι|Ϊ|Ỉ|Ị|И|Ы/' => 'I',
            '/ì|í|î|ï|ĩ|ī|ĭ|ǐ|į|ı|η|ή|ί|ι|ϊ|ỉ|ị|и|ы|ї/' => 'i',
            '/Ĵ/' => 'J',
            '/ĵ/' => 'j',
            '/Ķ|Κ|К/' => 'K',
            '/ķ|κ|к/' => 'k',
            '/Ĺ|Ļ|Ľ|Ŀ|Ł|Λ|Л/' => 'L',
            '/ĺ|ļ|ľ|ŀ|ł|λ|л/' => 'l',
            '/М/' => 'M',
            '/м/' => 'm',
            '/Ñ|Ń|Ņ|Ň|Ν|Н/' => 'N',
            '/ñ|ń|ņ|ň|ŉ|ν|н/' => 'n',
            '/Ò|Ó|Ô|Õ|Ō|Ŏ|Ǒ|Ő|Ơ|Ø|Ǿ|Ο|Ό|Ω|Ώ|Ỏ|Ọ|Ồ|Ố|Ỗ|Ổ|Ộ|Ờ|Ớ|Ỡ|Ở|Ợ|О/' => 'O',
            '/ò|ó|ô|õ|ō|ŏ|ǒ|ő|ơ|ø|ǿ|º|ο|ό|ω|ώ|ỏ|ọ|ồ|ố|ỗ|ổ|ộ|ờ|ớ|ỡ|ở|ợ|о/' => 'o',
            '/П/' => 'P',
            '/п/' => 'p',
            '/Ŕ|Ŗ|Ř|Ρ|Р/' => 'R',
            '/ŕ|ŗ|ř|ρ|р/' => 'r',
            '/Ś|Ŝ|Ş|Ș|Š|Σ|С/' => 'S',
            '/ś|ŝ|ş|ș|š|ſ|σ|ς|с/' => 's',
            '/Ț|Ţ|Ť|Ŧ|τ|Т/' => 'T',
            '/ț|ţ|ť|ŧ|т/' => 't',
            '/Þ|þ/' => 'th',
            '/Ù|Ú|Û|Ũ|Ū|Ŭ|Ů|Ű|Ų|Ư|Ǔ|Ǖ|Ǘ|Ǚ|Ǜ|Ũ|Ủ|Ụ|Ừ|Ứ|Ữ|Ử|Ự|У/' => 'U',
            '/ù|ú|û|ũ|ū|ŭ|ů|ű|ų|ư|ǔ|ǖ|ǘ|ǚ|ǜ|υ|ύ|ϋ|ủ|ụ|ừ|ứ|ữ|ử|ự|у/' => 'u',
            '/Ý|Ÿ|Ŷ|Υ|Ύ|Ϋ|Ỳ|Ỹ|Ỷ|Ỵ|Й/' => 'Y',
            '/ý|ÿ|ŷ|ỳ|ỹ|ỷ|ỵ|й/' => 'y',
            '/В/' => 'V',
            '/в/' => 'v',
            '/Ŵ/' => 'W',
            '/ŵ/' => 'w',
            '/Ź|Ż|Ž|Ζ|З/' => 'Z',
            '/ź|ż|ž|ζ|з/' => 'z',
            '/Æ|Ǽ/' => 'AE',
            '/ß/' => 'ss',
            '/Ĳ/' => 'IJ',
            '/ĳ/' => 'ij',
            '/Œ/' => 'OE',
            '/ƒ/' => 'f',
            '/ξ/' => 'ks',
            '/π/' => 'p',
            '/β/' => 'v',
            '/μ/' => 'm',
            '/ψ/' => 'ps',
            '/Ё/' => 'Yo',
            '/ё/' => 'yo',
            '/Є/' => 'Ye',
            '/є/' => 'ye',
            '/Ї/' => 'Yi',
            '/Ж/' => 'Zh',
            '/ж/' => 'zh',
            '/Х/' => 'Kh',
            '/х/' => 'kh',
            '/Ц/' => 'Ts',
            '/ц/' => 'ts',
            '/Ч/' => 'Ch',
            '/ч/' => 'ch',
            '/Ш/' => 'Sh',
            '/ш/' => 'sh',
            '/Щ/' => 'Shch',
            '/щ/' => 'shch',
            '/Ъ|ъ|Ь|ь/' => '',
            '/Ю/' => 'Yu',
            '/ю/' => 'yu',
            '/Я/' => 'Ya',
            '/я/' => 'ya'
        );

        $str = preg_replace(array_keys($foreign_characters), array_values($foreign_characters), $str);

        $replace = ($separator == 'dash') ? '-' : '_';

        $trans = array(
            '&\#\d+?;' => '',
            '&\S+?;' => '',
            '\s+' => $replace,
            '[^a-z0-9\-\._]' => '',
            $replace . '+' => $replace,
            $replace . '$' => $replace,
            '^' . $replace => $replace,
            '\.+$' => ''
        );

        $str = strip_tags($str);

        foreach ($trans as $key => $val) {
            $str = preg_replace("#" . $key . "#i", $val, $str);
        }

        if ($lowercase === TRUE) {
            if (function_exists('mb_convert_case')) {
                $str = mb_convert_case($str, MB_CASE_LOWER, "UTF-8");
            } else {
                $str = strtolower($str);
            }
        }

        $str = preg_replace('#[^' . $CI->config->item('permitted_uri_chars') . ']#i', '', $str);

        return trim(stripslashes($str));
    }
}

function get_readable_date($date){
    $gunler = array(
        'Pazartesi',
        'Salı',
        'Çarşamba',
        'Perşembe',
        'Cuma',
        'Cumartesi',
        'Pazar'
    );
     
    $aylar = array(
        'Ocak',
        'Şubat',
        'Mart',
        'Nisan',
        'Mayıs',
        'Haziran',
        'Temmuz',
        'Ağustos',
        'Eylül',
        'Ekim',
        'Kasım',
        'Aralık'
    );
     
    $ay = $aylar[date('m', strtotime($date)) - 1];
    $gun = $gunler[date('N', strtotime($date)) - 1];
    
    return date('j ', strtotime($date)).$ay;
}