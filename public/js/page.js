$("#form").hide();
$("#titrePage").hide();
$("#dropdown").hide();
$("#delPageButton").hide();

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
            $("#delPageButton").show();
        },
        error : function(resultat, statut, erreur){
        }
    });
}

function savePage() {
    if ($("#idPage").val() != ""){
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
    } else if ($("#idPage").val() == ""){
        if ($("#dropdown").val() == 0) {
            $("#warndrop").show();
        }else {
            $dataPage = {
                "title" : $("#titrePage").val(),
                "content" : tinyMCE.activeEditor.getContent(),
                "idCate" : $("#dropdown").val()
            };
            $.ajax({
                url : 'addPage',
                type : 'POST',
                data : $dataPage,
                success : function(){
                    location.reload(true);
                },
                error : function(resultat, statut, erreur){
                }
            });
        }
    }
}

function addPage() {
    $("#dropdown").show();
    tinyMCE.activeEditor.setContent("");
    $("#titrePage").val("");
    $("#titrePage").show();
    $("#form").show();
    $("#idPage").val("");
}

function delPage(){
    if($("#idPage").val() != ""){
        $delPage = {
            "id" : $("#idPage").val(),
        };

        if (confirm("Voulez-vous effacer la page ?") === true) {
            $.ajax({
                url : 'delPage',
                type : 'GET',
                data : $delPage,
                success : function(){
                    location.reload(true);
                },
                error : function(resultat, statut, erreur){
                }
            });
        }
    } else {
        alert("L'opération est impossible");
    }
}
