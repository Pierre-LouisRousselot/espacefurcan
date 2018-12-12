$("#form").hide();
$("#titrePage").hide();
$("#dropdown").hide();
$("#delPageButton").hide();
$("#idPage").val("");

$(document).ready(function () {
  /**
   * Initialisation du CMS tinyMCE
   */
    tinymce.init({
        //content_css:"css/content.css"
        selector:'textarea',
        branding:'false',
        plugins:"autoresize, image",
        elementpath:'false',
        language_url:'../public/js/fr_FR.js',
        language:'fr_FR',
        paste_data_images:'true',
        images_upload_handler: function (blobInfo, success, failure) {
            var xhr, formData;

            xhr = new XMLHttpRequest();
            xhr.withCredentials = false;
            xhr.open('POST', 'postAcceptor');

            xhr.onload = function() {
                var json;

                if (xhr.status != 200) {
                    failure('HTTP Error: ' + xhr.status);
                    return;
                }

                json = JSON.parse(xhr.responseText);

                if (!json || typeof json.location != 'string') {
                    failure('Invalid JSON: ' + xhr.responseText);
                    return;
                }

                success(json.location);
            };

            formData = new FormData();
            formData.append('file', blobInfo.blob(), blobInfo.filename());

            xhr.send(formData);
        }
    });
});

/**
 * Permet de charger une page dans le CMS TinyMCE
 * @param  {int} $id [id de la page à charger]
 */
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

/**
 * Permet de sauvegarder une page inscrite dans le form et le CMS
 */
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

/**
 * Permet de réveler les elements nécessaire à l'ajout de page
 */
function addPage() {
    $("#dropdown").show();
    tinyMCE.activeEditor.setContent("");
    $("#titrePage").val("");
    $("#titrePage").show();
    $("#form").show();
    $("#idPage").val("");
}

/**
 * Permet de supprimer la page dont l'id est donné
 */
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
