$('.changePart').click(function(e){
    e.preventDefault();
    var part_name = $(this).data('part');
    getPart(video_id, part_name, 0);
});

$("ul.video-parts").on("click", ".changePartNumber", function(e){
    e.preventDefault();
    var page = $(this).data('page');
    var part_name = $(this).data('part');
    getPart(video_id, part_name, page);
});
function like(formId){
    var filmID = $(formId).data('id'),
        data = $(formId).serialize() + '&like=' + filmID;
    $.get(api_url + '/oylama', data, function (response) {
        if (response.error){
            $('#like-msg').removeClass().addClass('alert alert-danger').html(response.error).show();
        } else if (response.success) {
            $('#like-msg').removeClass().addClass('alert alert-success').html(response.success).show();
            $(formId + ' input, ' + formId + ' a').val('');
        } else {
            $('#like-msg').hide().removeClass().html('');
        }
    }, 'json');
}

$(document).ready(function(){

    $('#dahafazlabolum').click(function(){
        var val = document.getElementById("gelenbolumler").value;
        $.ajax({
        type: 'post',
        url: 'dahafazla',
        data: {
         getresult:val
        },
        success: function (response) {
         var content = document.getElementById("bolumler");
         content.innerHTML = content.innerHTML+response;
         document.getElementById("gelenbolumler").value = Number(val)+bolumadet;
        }
        });
    });

});