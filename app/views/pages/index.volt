<script src="https://cloud.tinymce.com/stable/tinymce.min.js"></script>
{{ content() }}
{{ stylesheet_link('css/pages.css') }}

<div class="page-header">
    <h1>Gestion des pages</h1>
</div>
<div class="page_menu">
    <div class="dropdown">
        <button class="btn btn-primary dropdown-toggle" type="button" id="dropdownMenu1"
        data-toggle="dropdown" aria-haspopup="true" aria-expanded="true">
            Modifier une page existante
            <span class="caret"></span>
        </button>
        <div class="dropdown-menu" aria-labelledby="dropdownMenu1">
            {{ drop }}
        </div>
    </div>
    <div>
        <button id="addPageButton" class="btn btn-add-page" onclick="addPage()"><i class="material-icons">add_box</i></button>
    </div>
    <div>
        <input id="titrePage" class="sel-titre" placeholder="Titre page"></input>
    </div>
    <div>
        <button id="delPageButton" class="btn btn-del-page" onclick="delPage()"><i class="material-icons">delete_forever</i></button>
    </div>
</div>
<div>
    <div>
        <span id="warndrop" hidden>Veuillez sélectionner une catégorie.</span>
    </div>
    <div>
        <select id="dropdown" class="sel-categ">
            <option value="0">Sélectionner une catégorie</option>
            <option value="1">Services</option>
            <option value="2">Informatique</option>
        </select>
    </div>
</div>
<br>


<div id="form">
    {{ form('pages/index', 'id': 'pageForm', 'onbeforesubmit': 'return false') }}
    <div class="control-group">
        <div class="controls">
            {{ form.render('idPage', ['class': 'form-control']) }}
            {{ form.render('idCatePage', ['class': 'form-control']) }}
            {{ form.render('Page', ['class': 'form-control']) }}
        </div>
    </div>
    <br>
</form>
<div class="btn-val-page">
    <button id="val-page" class="btn btn-primary" onclick="savePage()">Valider</button>
</div>
</div>
<br>
<script src="../public/js/jquery.min.js"></script>
<script src="../public/js/page.js"></script>
