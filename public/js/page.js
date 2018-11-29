//$("#form").hide();

$(document).ready(function () {

});

function loadPage($id) {


    $.ajax({
        url : 'loadTiny/'+$id,
        type : 'GET',
        data : $id,
        success : function(data){
            document.getElementById("test").innerHTML = "Il s'agit de la page dont l'id est " + data + ".";
        },

        error : function(resultat, statut, erreur){

        }

    });
}
