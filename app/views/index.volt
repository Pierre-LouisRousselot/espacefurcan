<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    {{ get_title() }}
    {{ stylesheet_link('css/bootstrap.min.css') }}
    {{ stylesheet_link('css/style.css') }}
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="author" content="Pierre-Louis">
</head>
<body>
    <!-- Début du header -->

<div class="container-fluid">
    <div class="row fond">

        <div class="col-lg-3 logo">
            <img class="logoImage" src="images/mm.png" alt="">
        </div>
        <div class="col-lg-3 headerPhone">
            <img class="logoPhone" src="images/phone-icon-2-256.png" alt="">
           <a class="typoNumPhone" href="tel:+3222568549" ><b>02 256 85 49</b><br></a>
        </div>
        <div class="col-lg-3 headerMail">
            <img class="logoMail" src="images/mailLogo.png" alt="">
           <a class="typoMail" href="mailto:info@espacefurcan.be" ><b>info@espacefurcan.be</b></a>
        </div>
        <div class="col-lg-3 connecte">
                <img src="images/" alt="">
        </div>
    </div>
</div>

<!-- Fin du header -->
    {{ content() }}

    {{ javascript_include('js/jquery.min.js') }}
    {{ javascript_include('js/bootstrap.min.js') }}
    {{ javascript_include('js/utils.js') }}



<!-- début du carroussel -->

<div id="myCarousel" class="carousel slide" data-ride="carousel">
  <!-- Indicators -->
  <ol class="carousel-indicators">
    <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
    <li data-target="#myCarousel" data-slide-to="1"></li>
    <li data-target="#myCarousel" data-slide-to="2"></li>
  </ol>

  <!-- Wrapper for slides -->
  <div class="carousel-inner">
    <div class="item active">
      <img src="images/salle-1920x300" alt="espace_furcan_asbl1">
    </div>

    <div class="item">
      <img src="images/salle-1920x300" alt="espace_furcan_asbl2">
    </div>

    <div class="item">
      <img src="images/salle-1920x300" alt="espace_furcan_asbl3">
    </div>
  </div>

  <!-- Left and right controls -->
  <a class="left carousel-control" href="#myCarousel" data-slide="prev">
    <span class="glyphicon glyphicon-chevron-left"></span>
    <span class="sr-only">Previous</span>
  </a>
  <a class="right carousel-control" href="#myCarousel" data-slide="next">
    <span class="glyphicon glyphicon-chevron-right"></span>
    <span class="sr-only">Next</span>
  </a>
</div>

<!-- fin du carroussel -->

<!-- Affichage du body -->

<div class="titre">
    <h1>Nos objectifs</h1>
    <p>
L'association "Espace Furcan" a pour but de promouvoir la Formation et l’Action sociale<br/>
 particulièrement en mettant en œuvre des activités de lutte contre la fracture numérique<br/>
  les difficultés scolaires et l’exclusion sociale.<br/>
Pour atteindre ces buts, l’association développera les activités suivantes :</p>
</div>
<!-- premiere ligne avec icon et texte du la page d'accueil-->

<div class="row iconBody">

    <div class="col-lg-4 icon1">
            <img src="images/images.png" alt="">
            <p>Fourniture et assistance<br/>
                numérique pour les<br/>
                 faibles revenus</p>
    </div>
    <div class="col-lg-4 icon2">
            <img src="images/images.png" alt="">
            <p>Aide à l'utilisation<br/>
                du numérique pour les<br/>
                 adultes et les jeunes</p>
    </div>
    <div class="col-lg-4 icon3">
            <img src="images/images.png" alt="">
            <p>Soutien scolaire et aide <br/>
                aux devoirs pour les jeunes<br/>
                 en besoin</p>
    </div>

</div>

<!-- Deuxieme ligne avec icon et texte du la page d'accueil-->
<div class="row iconBody">

    <div class="col-lg-4 icon1">
            <img src="images/images.png" alt="">
            <p>Aide et guidance<br/>
                via l'nternet pour trouver<br/>
                 logement et emploi</p>
    </div>
    <div class="col-lg-4 icon2">
            <img src="images/images.png" alt="">
            <p>Aide et guidance<br/>
               pour un projet de vie<br/>
                pour les adultes</p>
    </div>
    <div class="col-lg-4 icon3">
            <img src="images/images.png" alt="">
            <p>Activités de loisirs et<br/>
                créatives pour les jeunes<br/>
                 et les seniors</p>
    </div>

</div>
<!--Fin d'affichage du body -->


</body>
<!-- Debut du footer -->
<footer>

    <div class="container containerFooter bg-dark">
        <div class="row">
            <div class="col-xl-12 text-white footerText">
            <p>
           L'association "Espace Furcan" a pour but de promouvoir la Formation et l’Action sociale, particulièrement en mettant en œuvre des activités de lutte contre la fracture numérique, les difficultés scolaires et l’exclusion sociale.
            <address>
              <b>Espace Furcan - Rue Notre dame 123, 1140 Bruxelles</b> <br>
              <a class="text-white mb-3" href="tel:+3222568549" ><b>Téléphone : +32 02 256 85 49</b><br></a>
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
             <a href="https://m.facebook.com/espacefurcan/" target="_blank">
                   <img class="logoFacebook" src="images/facebook-logo.png">
             </a>
         </div>
        <div>
             <a href="https://twitter.com/AsblEspace" target="_blank">
                   <img class="logoTwitter" src="images/twitter-logo-100x100.png">
             </a>
         </div>
         <div>
             <a href="https://www.instagram.com/espace_furcan_asbl/" target="_blank">
                   <img class="logoInstagram" src="images/logo-instagram.png">
             </a>
         </div>
         <div>
             <a href="https://www.instagram.com/espace_furcan_asbl/" target="_blank">
                   <img class="logoLinkedin" src="images/linkedin-icon-25.png">
             </a>
         </div>

    </div>
</div>

    <div class="container text-center">
        <div class="row">
            <div class="col-md-3">
              © Copyright 2018 Espace Furcan
            </div>
            <div class="col-md-3">
                  <a class="text-white" href="#">Politique de confidentialité
                  </a>
            </div>
            <div class="col-md-3">
              <a class="text-white" href="image/conditions-generales.jpg"

              target="_blank">Conditions générales de vente</a>

            </div>
            <div class="col-md-3">
                   Mentions légales
            </div>
        </div>
    </div>

<!-- Fin du footer -->
</footer>

</html>
