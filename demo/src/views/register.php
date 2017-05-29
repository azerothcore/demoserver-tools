<?php

require_once "src/controller/register.php";
?>

<div class="row">
    <div class="col-md-4"></div>
    <div class="col-md-4">
        <div class="row">
            <div class="col-md-12">
                Please <b>write down this account</b>. <br>This will no longer be shown to you.
            </div>
        </div>
        <div class="row">
            <div class="col-md-6">
                User:
            </div>
            <div class="col-md-6">
                <?=$user?>
            </div>
        </div>
        <div class="row">
            <div class="col-md-6">
                Pass:
            </div>
            <div class="col-md-6">
                <?=$pass?>
            </div>
        </div>
    </div>
    <div class="col-md-4"></div>
</div>

