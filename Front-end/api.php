<?php
$servername = 'wheatley.cs.up.ac.za';
$username = 'u20466570'; 
$password = 'K6DPHULGOAA5U2WA2UPBVIVSHFHEY263';

$conn = new mysqli($servername, $username, $password);
if ($conn->connect_error) {
    die('Connection failed: ' . $conn->connect_error);
} else {
    echo "Success";
    $conn->select_db("u20466570");
    echo "Success"; 
}
?>