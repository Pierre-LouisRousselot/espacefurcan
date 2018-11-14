<nav class="navbar navbar-default navbar-inverse" role="navigation">
    <div class="container-fluid">
        {{ elements.getMenu() }}
    </div>
</nav>

<div class="container">
    {{ flash.output() }}
    {{ content() }}
    <hr>
</div>
