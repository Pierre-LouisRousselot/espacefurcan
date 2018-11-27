
{{ content() }}

{{ form("users/create") }}
<h1>New User</h1>

{% set i = 0 %}
<div class="form-user">
    <fieldset>
        {% for element in form %}

        {% if is_a(element, 'Phalcon\Forms\Element\Hidden') %}

        {{ element }}

        {% else %}

        <div class="form-group form-{{i}}">
            {{ element.label(['class': 'col-sm-3 col-md-2']) }}
            {{ element.render(['class': 'controls-new col-sm-9 col-md-10']) }}
        </div>

        {% endif %}

        {% set i += 1 %}

        {% endfor %}

    </fieldset>

    <ul class="pager">
        <li class="">
            {{ submit_button("Save Changes", "class": "btn create") }}
        </li>
        <li class="">
            {{ link_to("users", "Cancel", "class": "btn cancel") }}
        </li>
    </ul>
</form>
</div>
{{ assets.outputCss() }}
{{ this.flashSession.output() }}
