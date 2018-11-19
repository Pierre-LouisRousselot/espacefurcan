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
            <img class="logoImage" src="../images/mm.png" alt="">
        </div>
        <div class="col-lg-3 headerPhone">
            <img class="logoPhone" src="../images/phone-icon-2-256.png" alt="">
           <a class="typoNumPhone" href="tel:+3222568549" ><b>02 256 85 49</b><br></a>
        </div>
        <div class="col-lg-3 headerMail">
            <img class="logoMail" src="../images/mailLogo.png" alt="">
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
                   <img class="logoFacebook" src="../images/facebook-logo.png">
             </a>
         </div>
        <div>
             <a href="https://twitter.com/AsblEspace" target="_blank">
                   <img class="logoTwitter" src="../images/twitter-logo-100x100.png">
             </a>
         </div>
         <div>
             <a href="https://www.instagram.com/espace_furcan_asbl/" target="_blank">
                   <img class="logoInstagram" src="../images/logo-instagram.png">
             </a>
         </div>
         <div>
             <a href="https://www.instagram.com/espace_furcan_asbl/" target="_blank">
                   <img class="logoLinkedin" src="../images/linkedin-icon-25.png">
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


</body>




</html>
