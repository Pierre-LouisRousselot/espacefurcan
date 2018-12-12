$(document).ready(function() {

	
	
	
	
});

function detailCat($id){

		$.ajax({
			url : 'cat/' + $id,
			type : 'GET',
			success : function(data){
				

			},
			error : function(resultat,status,erreur){

			}
		});

	}