
{{ content() }}

<div class="jumbotron" style="background:url({{url()}}/images/tech-blue.png)">
    <h1 style="color:red;margin-left:10px;margin-bottom:44px">Erreur de page</h1>
    <img src="{{url()}}/images/erreur404V2.png" style="margin-left:120px" alt="erreur 404">
    <p style="color:red">Désolé,la page recherchée n’existe pas ou plus.</p>
    <p>{{ link_to('index', 'Home', 'class': 'btn btn-primary') }}</p>
</div>
