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
			var html = '<div class="col-lg-4 produit">';
			$.each(data, function (index, item) {
				html += '<h3>' + item.nom_Produit + '</h3>';
				html += '<img src="public/image_Produit/' + item.image_Produit + '">';
				html += '<h5><span>' + item.prix_Produit + '€ </span></h5>';
				html += '<p class="card-text descriLimit">' + item.descri_Produit + '</p>';
			});

			html += '</div>'
			$('.row_article').prev().html(html);
		}
	});
	listeNow = $article;
}

function filtre($id){
	articles = listeArticle.filter(article => article.id_Categorie == $id);
	console.log($id, articles);
	showArticle(articles);
}
