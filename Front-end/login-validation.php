<?php
$servername = 'wheatley.cs.up.ac.za';
$username = 'u20466570'; 
$password = 'K6DPHULGOAA5U2WA2UPBVIVSHFHEY263';

$conn = new mysqli($servername, $username, $password);
if ($conn->connect_error) {
    die('Connection failed: ' . $conn->connect_error);
} else {
    $conn->select_db("u20466570");
}

if (isset($_POST['username']) && isset($_POST['password'])) {
    $query = "SELECT email, password FROM ijtm_USERS WHERE email='" . $_POST['username'] . "' AND password='" . $_POST['password'] . "'";
    $result = mysqli_query($conn, $query);
    if (mysqli_num_rows($result) > 0) {
        session_start();
        $_SESSION["login"] = true;
        $_SESSION["username"] = $_POST['username'];
        $conn->close();
        header("Location: tournamentPage.php");
    } else {
        echo '<span class="error-span" id="pass-error">Invalid username or password</span>';
    }
}
?>