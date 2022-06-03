<?php

include 'config.php';


$connection = new Database();
$array = $connection->viewUsers(); 
echo json_encode($array);

?>