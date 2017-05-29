<?php
require_once "src/include/kernel.php";
?>
<html>
    <head>
        <title>Generate account</title>
        <script
            src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
            integrity="sha256-k2WSCIexGzOj3Euiig+TlR8gA0EmPjuc79OEeY5L45g="
        crossorigin="anonymous"></script>
        <!-- bootstrap -->
        <link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous"> 
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>

        <!-- google recaptcha -->
        <script src='https://www.google.com/recaptcha/api.js'></script>

        <!-- personal -->
        <link href="src/css/style.css" rel="stylesheet">
    </head>
    <body>
        <nav class="navbar navbar-default">
            <div class="container-fluid">
                <div class="navbar-header">
                    <a class="navbar-brand" href="#">                    
                        <a class="navbar-brand" href="http://www.azerothcore.org">
                            <div class="logo"><img src="data/images/logo-small.png" alt="AzerothCore logo small"/></div> <div class="title">AzerothCore</div>
                        </a>
                </div>
                <ul class="nav navbar-nav">
                    <li><a href="http://www.azerothcore.org">Home</a></li>
                    <li class="active"><a href="/demo/">Registration</a></li>
                </ul>
            </div>
        </nav>

        <div class="container">
            <?php include $view; ?>
        </div>
    </body>
</html>