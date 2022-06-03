<?php

include 'config.php';


$id= $_POST['ID'];

$connection = new Database();
$array = $connection->findUsers($id); 

echo json_encode(array("id"=> $array['ID'], "name"=> $array['Name'], "surname"=> $array['Surname'], "email"=> $array['Email'], "admin"=> $array['Admin']));


?>


