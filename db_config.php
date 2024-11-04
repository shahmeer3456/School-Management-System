<?php
//            --Citation/Reference
//https://github.com/chillerlan/php-database  
//https://www.w3schools.com/php/php_superglobals_post.asp

$servername = "localhost";
$username = "root";
$password = "";
$dbname = "school_db";

$conn = new mysqli($servername, $username, $password, $dbname);

if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}
?>
