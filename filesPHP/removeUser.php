<?php

include 'config.php';

$id= $_POST['idnumber'];
$adminCode= $_POST['adminCode'];



$hashedadminCode = base64_encode(sha1($adminCode.$adminCode, true)); 
$adminCodeCheck= 'wSmzJK7mYrBOzPaLq7qFhRNG3/k=';
if($hashedadminCode==$adminCodeCheck)
{
    $connection = new Database();
    $connection->removeUser($id);
}
else
{
    echo "No admin priviledges";
}


?>