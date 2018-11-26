
{{ content() }}

<div class="profile left">
    {{ form('profile/informations', 'id': 'profileForm', 'onbeforesubmit': 'return false') }}
        <div class="clearfix">
            <label for="name">Votre nom:</label>
            <div class="input">
                {{ text_field("name", "size": "30", "class": "span6") }}
                <div class="alert" id="name_alert">
                    <strong>Warning!</strong> Please enter your full name
                </div>
            </div>
        </div>
        <div class="clearfix">
            <label for="name">Votre prénom</label>
            <div class="input">
                {{ text_field("prenom", "size": "30", "class": "span6") }}
                <div class="alert" id="name_alert">
                    <strong>Warning!</strong> Please enter your full name
                </div>
            </div>
        </div>
        <div class="clearfix">
            <label for="name">Votre prénom</label>
            <div class="input">
                {{ text_field("tel", "size": "30", "class": "span6") }}
                <div class="alert" id="name_alert">
                    <strong>Warning!</strong> Please enter your full name
                </div>
            </div>
        </div>
        <div class="clearfix">
            <label for="email">Email Address:</label>
            <div class="input">
                {{ text_field("email", "size": "30", "class": "span6") }}
                <div class="alert" id="email_alert">
                    <strong>Warning!</strong> Please enter your email
                </div>
            </div>
        </div>
        <div class="clearfix">
            <label for="email">Email Address:</label>
            <div class="input">
                {{ text_field("adresse", "size": "30", "class": "span6") }}
                <div class="alert" id="email_alert">
                    <strong>Warning!</strong> Please enter your email
                </div>
            </div>
        </div>
        <div class="clearfix">
            <label for="email">Email Address:</label>
            <div class="input">
                {{ text_field("ville", "size": "30", "class": "span6") }}
                <div class="alert" id="email_alert">
                    <strong>Warning!</strong> Please enter your email
                </div>
            </div>
        </div>
        <div class="clearfix">
            <label for="email">Email Address:</label>
            <div class="input">
                {{ text_field("postal", "size": "30", "class": "span6") }}
                <div class="alert" id="email_alert">
                    <strong>Warning!</strong> Please enter your email
                </div>
            </div>
        </div>
        <div class="clearfix">
            <label for="email">Mot de passe actuel</label>
            <div class="input">
                {{ password_field("password", "size": "30", "class": "span6") }}
                <div class="alert" id="email_alert">
                    <strong>Warning!</strong> Please enter your email
                </div>
            </div>
        </div>
        <div class="clearfix">
            <label for="email">Nouveau mot de passe </label>
            <div class="input">
                {{ password_field("newPassword", "size": "30", "class": "span6") }}
                <div class="alert" id="email_alert">
                    <strong>Warning!</strong> Please enter your email
                </div>
            </div>
        </div><div class="clearfix">
            <label for="email">Répéter le nouveau mot de passe</label>
            <div class="input">
                {{ password_field("repeatNewPassword", "size": "30", "class": "span6") }}
                <div class="alert" id="email_alert">
                    <strong>Warning!</strong> Please enter your email
                </div>
            </div>
        </div>
        <div class="clearfix">
            <input type="button" value="Update" class="btn btn-primary btn-large btn-info" onclick="Profile.validate()">
            &nbsp;
            {{ link_to('profile/index', 'Cancel') }}
        </div>
    </form>
</div>
