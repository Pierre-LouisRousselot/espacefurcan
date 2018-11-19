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





<!-- Fin du footer -->
</footer>

</html>
