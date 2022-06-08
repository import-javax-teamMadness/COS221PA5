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
                    On this page you may edit the start date, golf course ID and attendance of an event ID of your choice.
                <p>

                <p id="addEventForm">

                <form method="POST" action="editEvent.php">
                    <label for="id">ID of event to edit:</label>
                    <input type="text" id="eId" name="eventId"><br><br>
                    <label for="id">Attribute to edit:</label>
                    <select class="edit" id="editEvent_dropdown" name="editEvent_dropdown">
                        <option value="start_date_time">Start Date</option>
                        <option value="attendance">Attendance</option>
                    </select><br><br>
                    <label for="sdate">New attribte value:</label>
                    <input type="text" id="newVal" name="editedValue">
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

                if (isset($_POST['eventId']) && isset($_POST['editEvent_dropdown']) && isset($_POST['editedValue'])) {
                    echo $_POST['editEvent_dropdown'];
                    $query = "UPDATE events
                              SET '" . $_POST['editEvent_dropdown'] . "' = '" . $_POST['editedValue'] . "'
                              WHERE id = '" . $_POST['eventId'];
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