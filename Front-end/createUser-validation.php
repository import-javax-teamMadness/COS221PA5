<?php
$servername = 'wheatley.cs.up.ac.za';
$username = 'u20466570';
$password = 'K6DPHULGOAA5U2WA2UPBVIVSHFHEY263';

$conn = new mysqli($servername, $username, $password);
if ($conn->connect_error) {
    die('Connection failed: ' . $conn->connect_error);
} else {
    $conn->select_db("u20466570");
    echo "Heree";
}

if (isset($_POST['email']) && isset($_POST['pass']) && isset($_POST['fname']) && isset($_POST['sname']) && isset($_POST['age']) && isset($_POST['admin_priv'])) {
    echo "Here";
    $admin = 0;
    if ($_POST['admin_priv'] == 'on') {
        $admin = 1;
    }
    $query = "INSERT INTO ijtm_USERS (uid, email, password, fname, sname, age, admin_priv)
                VALUES (null, '" . $_POST['email'] . "', '" . $_POST['pass'] . "', '" . $_POST['fname'] . "', '" . $_POST['sname'] . "', '" . $_POST['age'] . "', '" . $admin . "')";
    $result = mysqli_query($conn, $query);
    session_start();
    $conn->close();
    header("Location: Login.php");
    if (mysqli_num_rows($result) == 0) {
    } else {
        echo '<span class="error-span" id="pass-error">User exists.</span>';
    }
}
