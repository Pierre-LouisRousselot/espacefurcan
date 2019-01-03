var doc = "";

$(document).ready(function() {

  var req = new XMLHttpRequest();
  req.open("GET", "../caracteristiques.json", false);
  req.send(null);

  doc = eval('(' + req.responseText + ')');
});

function selectProduct(){
  var cate = $("#SelectCat").val();
  var cara = doc[cate];
  var count = 0;

  $.ajax({
    url : 'getCate/'+ cate,
    type : 'GET',
    success : function(data){
      data = JSON.parse(data);
    },
  });

  var html = "";

  $.each(cara, function (index, item) {
    html += '<div class="info'+ count +'">';

    html += '<label for="'+ count +'Produit">''</label>'

    html += '</div>';

    count = count + 1;
  });

  console.log(cara);

}
