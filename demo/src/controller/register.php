<?php


function randomPassword($length) {
    $alphabet = 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890';
    $pass = array(); //remember to declare $pass as an array
    $alphaLength = strlen($alphabet) - 1; //put the length -1 in cache
    for ($i = 0; $i < $length; $i++) {
        $n = rand(0, $alphaLength);
        $pass[] = $alphabet[$n];
    }
    return implode($pass); //turn the array into a string
}


if(isset($_POST['g-recaptcha-response']))
$captcha=$_POST['g-recaptcha-response'];

if(!$captcha){
echo '<h2>Please check the the captcha form.</h2>';
exit;
}
$response=json_decode(file_get_contents("https://www.google.com/recaptcha/api/siteverify?secret=".RECAPTCHA_SECRET."&response=".$captcha."&remoteip=".$_SERVER['REMOTE_ADDR']), true);
if($response['success'] == false)
{
    ErrorHandler::raiseError("Recaptcha error, please retry!");
}

require_once "conf/conf.php";

$mysqli = new mysqli(AC_HOST,AC_USER,AC_PASS);
if ($mysqli->connect_error) {
    die('Connection error (' . $mysqli->connect_errno . ') '
    . $mysqli->connect_error);
}

$query = "SELECT MAX(id) AS latest_id FROM ".AC_DB_AUTH.".account;";

if ($result = $mysqli->query($query)) {

    /* fetch object array */
    $obj = $result->fetch_object();
    
    $id = $obj->latest_id;
    $id= (intval($id))+1;
    
    $user= "demo".$id;
    $pass=randomPassword(5);
    
    $hash = sha1(strtoupper($user.':'.$pass));
    
    $query="INSERT INTO ".AC_DB_AUTH.".account (username,sha_pass_hash) VALUES('$user','$hash')";
    $mysqli->query($query);
        
    $query="INSERT INTO ".TC_DB_AUTH.".account (username,sha_pass_hash) VALUES('$user','$hash')";
    $mysqli->query($query);
    
    
    /* free result set */
    $result->close();
}

/* close connection */
$mysqli->close();
