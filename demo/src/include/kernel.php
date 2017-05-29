<?php

mysqli_report(MYSQLI_REPORT_ERROR | MYSQLI_REPORT_STRICT);

ini_set('display_errors', 1);
ini_set('display_startup_errors', 1);
error_reporting(E_ALL);


require_once "conf/conf.php";
require_once "ErrorHandler.php";

$req = isset($_REQUEST['action']) ? $_REQUEST['action'] : '';
switch ($req) {
    case 'register':
        $view = "src/views/register.php";
        break;
    default:
        $view = "src/views/main.php";
        break;
}
