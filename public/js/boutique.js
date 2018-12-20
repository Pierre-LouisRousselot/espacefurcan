var listeArticle = "";
var listeNow = "";

$(document).ready(function() {

	$.ajax({
		url : 'showArticle',
		type : 'GET',
		success : function(data){
			data = JSON.parse(data);
			showArticle(data);
			listeArticle = data;
		},
	});
});

function showArticle($article){
	$('.row_article').pagination({
		dataSource: $article,
		pageSize : 6,
		callback: function(data, pagination) {
			// template method of yourself

			var html ="";

			$.each(data, function (index, item) {
			 	html += '<div class="col-lg-4 produit" style="display:inline-block">';
				html += '<h3>' + item.nom_Produit + '</h3>';
				html += '<img style="width:200px;height:200px;" src="/espacefurcan/public/image_Produit/' + item.image_Produit + '">';
				html += '<h5><span>' + item.prix_Produit + '€ </span></h5>';
				html += '<p class="card-text descriLimit">' + item.descri_Produit + '</p>';
				html += '<button type="button" class="large material-icons" onclick ="detailProduct('+ item.id_Produit +')"> loupe </button>';
				html += '<button type="button" class="large material-icons" onclick="addCart(' + item.id_Produit + ')"> add_shopping_cart </button>';
				html += '</div>'

			});

			$('.data-container').html(html);
		}
	});
	listeNow = $article;
}

function detailProduct($id){
	window.location.href ='/espacefurcan/boutique/produit/' + $id;
}

function refresh(){
	showArticle(listeArticle);
	$("#SelectCat").val("0");
	$("#SelectMarque").val("0");
}

function filtre(){
	var marque = $("#SelectMarque").val();
	var cate = $("#SelectCat").val();
	var liste = listeArticle;
	console.log(marque);
	console.log(cate);
	if (marque != null) {
		liste = liste.filter(article => article.id_Marque == marque);
	}

	if (cate != null){
		liste = liste.filter(article => article.id_Categorie == cate);
	}
	showArticle(liste);
}
