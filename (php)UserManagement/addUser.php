<?php

include 'config.php';

$id= $_POST['idnumber'];
$name= $_POST['name'];
$surname= $_POST['surname'];
$email= $_POST['email'];
$password= $_POST['password'];
$admin= $_POST['admin'];
$adminCode= $_POST['adminCode'];



$hashedadminCode = base64_encode(sha1($adminCode.$adminCode, true)); 
$adminCodeCheck= 'wSmzJK7mYrBOzPaLq7qFhRNG3/k=';
if($hashedadminCode==$adminCodeCheck)
{
    $connection = new Database();
    $connection->addUser($id, $name, $surname, $email, $password, $admin);
}
else
{
    echo "No admin priviledges";
}


?>