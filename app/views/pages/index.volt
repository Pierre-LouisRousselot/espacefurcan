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

{{ form('pages/index', 'id': 'pageForm', 'onbeforesubmit': 'return false') }}

<div class="control-group">
    <div class="controls">
        {{ form.render('Page', ['class': 'form-control']) }}
    </div>
</div>
<br>
<div class="form-actions">
    {{ submit_button('Valider', 'class': 'btn btn-primary') }}
    <p class="help-block">En vous inscrivant, vous acceptez les termes d'utilisations et de confidentialités.</p>
</div>

</form>

{# <textarea>

    Next, use our Get Started docs to setup Tiny! <br>


</textarea> #}
