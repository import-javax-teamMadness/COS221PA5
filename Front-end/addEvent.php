<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="../COS 221 - PA5/css/style.css">
</head>

<body>
    <main>
        <div class="login-page-flex-container">
            <div class="box" id="headings">
                <h1>
                    Golf Galore
                    <p id=subheading>
                        Add Event
                    </p>
                </h1>
            </div>
            <div class="box3" id="loginForm">
                <p id=intro>
                    On this page you may create an event in which golf players will participate in.
                <p>

                <p id="addEventForm">
                <form method="POST" action="eventPage.php">
                    <label for="id">id:</label>
                    <input type="text" id="eId" name="eventId" readonly="readonly">
                    <label for="sdate">Start date:</label>
                    <input type="text" id="sdate" name="startDate"><br><br>
                    <label for="gcId">Golf Course ID:</label>
                    <input type="text" id="gcId" name="golfCourseId"><br><br>
                    <label for="attendance">Attendance:</label>
                    <input type="text" id="attendance" name="attendance">
                    <input type="submit" value="Submit">
                </form>
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
                    mysqli_query($conn, $query);
                    session_start();
                    $conn->close();

                    $_POST = array();
                }

                $_POST = array();
                ?>
                </p>
            </div>
    </main>

    <body>

</html>