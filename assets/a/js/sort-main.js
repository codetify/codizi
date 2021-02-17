$(document).ready(function(){

    $(".sortable").sortable();

    $(".content-container").on("sortupdate", '.sortable',  function(event, ui){

        var $data = $(this).sortable("serialize");
        var $data_url = $(this).data("url");

        $.post($data_url, {data:$data}, function(){})
    })
});