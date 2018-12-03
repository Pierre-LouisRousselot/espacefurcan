$("#form").hide();
$("#titrePage").hide();

$(document).ready(function () {

});

function loadPage($id) {
    $.ajax({
        url : 'loadTiny/'+$id,
        type : 'GET',
        success : function(data){
            data = JSON.parse(data);
            tinyMCE.activeEditor.setContent(data.content);
            $("#titrePage").val(data.titre);
            $("#idPage").val($id);
            $("#idCatePage").val(data.cate),
            $("#form").show();
            $("#titrePage").show();
        },
        error : function(resultat, statut, erreur){
        }
    });
}

function savePage() {

    $dataPage = {
        "id" : $("#idPage").val(),
        "title" : $("#titrePage").val(),
        "content" : tinyMCE.activeEditor.getContent(),
        "idCate" : $("#idCatePage").val()
    };

    $.ajax({
        url : 'savePage',
        type : 'POST',
        data : $dataPage,
        success : function(){
            location.reload(true);
        },
        error : function(resultat, statut, erreur){
        }
    });
}
