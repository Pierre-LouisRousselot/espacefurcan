<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    {{ get_title() }}
    {{ stylesheet_link('css/bootstrap.min.css') }}
    {{ stylesheet_link('css/style.css') }}
    <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/v/dt/jq-3.3.1/dt-1.10.18/datatables.min.css"/>


    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="author" content="Pierre-Louis">


</head>
<body>
    <!-- Début du header -->

    <!--  icon du logo dans le header -->

    <div class="container-fluid">
        <div class="row fond">

            <div class="col-lg-3 logo">
                {{  link_to("index", image("/images/mm.png", "class": "logoImage"))}}
            </div>

            <!--  icon du phone dans le header -->

            <div class="col-lg-3 headerPhone">
                {{ image("/images/phone-icon-2-256.png", "class": "logoPhone") }}
                {{ link_to("tel:+3222568549", "<b>02 256 85 49</b>", "class": "typoNumPhone")}}
            </div>

            <!--  icon du mail dans le header -->
            <div class="col-lg-3 headerMail">
                {{ image("/images/mailLogo.png", "class": "logoMail") }}
                {{ link_to("mailto:info@espacefurcan.be", "<b>info@espacefurcan.be</b>", "class": "typoMail")}}
            </div>

            <!--  icon du panier dans le header -->

            <div class="col-lg-3 panier">
                <!--  <a href=""><img src="{{ url() }}/images/icon-panier" alt=""></a> -->
                {{ link_to("", image('/images/icon-panier.png')) }}
            </div>
        </div>
    </div>
    <nav class="navbar  navbar-expand-lg navbar-light top-navbar" data-toggle="sticky-onscroll">
        <a class="navbar-brand" href="#">Espace Furcan</a>
        {{ elements.getMenu() }}
    </nav>


    <!-- Fin du header -->
    {{ content() }}

    {#
    {{ javascript_include('js/bootstrap.min.js') }}

    {{ javascript_include('https://code.jquery.com/jquery-3.3.1.min.js')}}
    <script type="text/javascript" src="https://cdn.datatables.net/v/dt/dt-1.10.18/datatables.min.js"></script> #}
    {{ javascript_include('js/jquery.min.js') }}
    {{ javascript_include('js/utils.js') }}
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>


    <!-- Debut du footer -->
    <footer>

        <div class="container containerFooter">
            <div class="row">
                <div class="col-xl-12 text-white footerText">
                    <p>
                        L'association "Espace Furcan" a pour but de promouvoir la Formation et l’Action sociale, particulièrement en mettant en œuvre des activités de lutte contre la fracture numérique, les difficultés scolaires et l’exclusion sociale.
                        <address>
                            <b>Espace Furcan - Rue Notre dame 123, 1140 Bruxelles</b> <br>
                            {{ link_to("tel:+3222568549", "<b>Téléphone : +32 02 256 85 49</b>", "class": "text-white mb-3")}}
                        </address>
                    </p>
                </div>
            </div>
        </div>

        <!--     une div qui enveloppe le logo et tout les logos sociaux
        affichage du logo dans le footer.
    -->
    <!-- <div class="row"> -->
    <div class="col-md-6">
        <div>
            <!--         <img class="logoFurcan" src="../images/mm.png" alt="image">
        -->        </div>
    </div>

    <!--  fin d'affichage du logo dans le footer. -->

    <div class="col-md-6 sociaux">
        <div class="facebook">
            {{ link_to("https://facebook.com/espacefurcan/", "target": "_blank","local": FALSE, image('/images/facebook-logo.png', "class": "logoFacebook")) }}
        </div>
        <div>
            {{ link_to("https://twitter.com/AsblEspace", "target": "_blank","local": FALSE, image('/images/twitter-logo-100x100.png', "class": "logoTwitter")) }}
        </div>
        <div>
            {{ link_to("https://www.instagram.com/espace_furcan_asbl/", "target": "_blank","local": FALSE, image('/images/logo-instagram.png', "class": "logoInstagram")) }}
        </div>
        <div>
            {{ link_to("https://www.instagram.com/espace_furcan_asbl/", "target": "_blank","local": FALSE, image('/images/linkedin-icon-25.png', "class": "logoLinkedin")) }}
        </div>
    </div>
</div>

<div class="container text-center">
    <div class="row">
        <div class="col-md-3">
            © Copyright 2018 Espace Furcan
        </div>
        <div class="col-md-3">
            {{ link_to("#", "Politique de confidentialité", "class": "text-white")}}
        </div>
        <div class="col-md-3">
            {{ link_to("image/conditions-generales.jpg", "Conditions générales de vente", "target": "_blank", "class": "text-white")}}
        </div>
        <div class="col-md-3">
            Mentions légales
        </div>
    </div>
</div>
<!-- Fin du footer -->
</footer>
</body>
</html>
