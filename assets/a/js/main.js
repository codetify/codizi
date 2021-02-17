$(document).ready(function(){

    $("#dizi").on("change", function(){

        var diziID = $(this).val();
        if(diziID){
            $.ajax({
                type:'POST',
                url:api+'/diziSec',
                data:'diziID='+diziID,
                success:function(html){
                    $('#sezon').html(html);
                    $('#bolum').html('<option value="">Bölüm Seçiniz...</option>');
                }
            }); 
        }else{
            $('#sezon').html('<option value="">Sezon Seçiniz...</option>');
            $('#bolum').html('<option value="">Bölüm Seçiniz...</option>');
        }

    });

    $("#sezon").on("change", function(){

        var sezonID = $(this).val();
        if(sezonID){
            $.ajax({
                type:'POST',
                url:api+'/diziSec',
                data:'sezonID='+sezonID,
                success:function(html){
                    $('#bolum').html(html);
                }
            }); 
        }else{
            $('#bolum').html('<option value="">Bölüm Seçiniz...</option>');
        }

    });

});