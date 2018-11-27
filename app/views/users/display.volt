{{ content() }}

<h1>
    {{user.title}}
</h1>

<p class="content">
    {{user.content}}
</p>

<p class="published">
    Published on {{user.date}}
</p>

{{ link_to("./", "Return to Homepage", "class": "link") }}
 {{ assets.outputCss() }}
