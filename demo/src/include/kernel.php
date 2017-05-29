<?php

mysqli_report(MYSQLI_REPORT_ERROR | MYSQLI_REPORT_STRICT);

ini_set('display_errors', 1);
ini_set('display_startup_errors', 1);
error_reporting(E_ALL);

$req = isset($_REQUEST['action']) ? $_REQUEST['action'] : '';
switch ($req) {
    case 'register':
        $view = "src/views/register.php";
        break;
    default:
        $view = "src/views/main.php";
        break;
}
