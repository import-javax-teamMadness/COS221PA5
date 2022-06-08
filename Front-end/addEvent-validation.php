<?php
$servername = 'wheatley.cs.up.ac.za';
$username = 'u20431122';
$password = 'E37VCXZWH5LZ3W6RCTHKYKJWSEDIT7DR';

$conn = new mysqli($servername, $username, $password);
if ($conn->connect_error) {
    die('Connection failed: ' . $conn->connect_error);
} else {
    $conn->select_db("u20431122_");
}

$query = "Select MAX(id) as MaxID from events";
$result = mysqli_query($conn, $query);
$row = $result->fetch_assoc();
$id = $row['MaxID'] + 1;

echo "<script>
                var textField = document.getElementById('eId');
                textField.value = '" . $id . "';
              </script>";

if (isset($_POST['eventId']) && isset($_POST['startDate']) && isset($_POST['golfCourseId']) && isset($_POST['attendance'])) {
    $query = "INSERT INTO events (id, start_date_time, site_id, event_status, attendance)
                VALUES ('" . $_POST['eventId'] . "', '" . $_POST['startDate'] . "', '" . $_POST['golfCourseId'] . "', 'incomplete', '" . $_POST['attendance'] . "')";
    $result = mysqli_query($conn, $query);
    session_start();
    $conn->close();
    if (mysqli_num_rows($result) == 0) {
    } else {
        echo '<span class="error-span" id="pass-error">Cannot create event.</span>';
    }
    $_POST = array();
}
