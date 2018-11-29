<script src="https://cloud.tinymce.com/stable/tinymce.min.js"></script>
<script>tinymce.init({
    branding:'false',
    plugins:"autoresize",
    elementpath:'false',
    language_url:'../public/js/fr_FR.js',
    language:'fr_FR',
    selector:'textarea'
    //content_css:"css/content.css"
});</script>

{{ content() }}

<div class="page-header">
    <h1>Gestion des pages</h1>
</div>

<div class="dropdown">
    <button class="btn btn-default dropdown-toggle" type="button" id="dropdownMenu1" data-toggle="dropdown" aria-haspopup="true" aria-expanded="true">
        Sélectionner la page
        <span class="caret"></span>
    </button>
    <ul class="dropdown-menu" aria-labelledby="dropdownMenu1">
        {{ drop }}
    </ul>
</div>
<br>
<div>
    {{ form('pages/index', 'id': 'pageForm', 'onbeforesubmit': 'return false') }}

    <div class="control-group">
        <div class="controls">
            {{ form.render('Page', ['class': 'form-control']) }}
        </div>
    </div>
    <br>
    <div class="form-actions">
        {{ submit_button('Valider', 'class': 'btn btn-primary') }}
    </div>

</form>
</div>

{# <textarea>

Next, use our Get Started docs to setup Tiny! <br>


</textarea> #}
