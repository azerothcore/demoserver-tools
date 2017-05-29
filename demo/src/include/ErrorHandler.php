<?php

class ErrorHandler {
    
    public static function raiseError($error) {
        include "src/views/error.php";
        die();
    }
}
