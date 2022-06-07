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
        <div class="eventpage-flex-container">

            <div class="eventpage-flex-container-ongoingEvents">
                <div class="box9" id="ongoingEvents">
                    <h2>
                        Ongoing events:
                    </h2>
                    <?php
                    $servername = 'wheatley.cs.up.ac.za';
                    $username = 'u20431122';
                    $password = 'E37VCXZWH5LZ3W6RCTHKYKJWSEDIT7DR';
                    $conn = new mysqli($servername, $username, $password);

                    if ($conn->connect_error) {
                        die('Connection failed: ' . $conn->connect_error);
                    } else {
                        $conn->select_db("u20431122_");
                        echo "<script>console.log('Database connected Successfully')</script>";
                    }

                    if (!isset($_POST['data'])) {
                        $query = "Select * from events";
                        $result = mysqli_query($conn, $query);
                        $list = array();

                        if (mysqli_num_rows($result) > 0) {
                            while ($row = $result->fetch_assoc()) {
                                echo "<script>var table = document.getElementById('events');
                        var row = table.insertRow();
                
                        var cell1 = row.insertCell(0);
                        var cell2 = row.insertCell(1);
                
                        cell1.innerHTML = " . $row['id'] . ";
                        cell2.innerHTML = '" . $row['start_date_time'] . ";
                        </script>";
                            }
                        } else {
                            echo "No data available";
                        }
                        unset($_POST['data']);
                    } else {
                        echo "No data available";
                    }
                    $conn->close();
                    ?>
                </div>
            </div>

            <div class="eventpage-flex-container-eventStats">
                <div class="box10" id="eventStats">
                    <h2>
                        Event Statistics:
                    </h2>
                    <?php
                    $servername = 'wheatley.cs.up.ac.za';
                    $username = 'u20431122';
                    $password = 'E37VCXZWH5LZ3W6RCTHKYKJWSEDIT7DR';
                    $conn = new mysqli($servername, $username, $password);

                    if ($conn->connect_error) {
                        die('Connection failed: ' . $conn->connect_error);
                    } else {
                        $conn->select_db("u20431122_");
                        echo "<script>console.log('Database connected Successfully')</script>";
                    }

                    if (!isset($_POST['data'])) {
                        $query = "Select * from  event_stats";
                        $result = mysqli_query($conn, $query);
                        $list = array();

                        if (mysqli_num_rows($result) > 0) {
                            while ($row = $result->fetch_assoc()) {
                                echo "<script>var table = document.getElementById('golf_event_stats');
                        var row = table.insertRow();
                
                        var cell1 = row.insertCell(0);
                        var cell2 = row.insertCell(1);
                        var cell3 = row.insertCell(2);
                        var cell4 = row.insertCell(3);
                
                        cell1.innerHTML = " . $row['event_id'] . ";
                        cell2.innerHTML = '" . $row['best_stroke'] . ";
                        cell3.innerHTML = '" . $row['Money_won'] . ";
                        cell4.innerHTML = '" . $row['event_winner_id'] . ";
                        </script>";
                            }
                        } else {
                            echo "No data available";
                        }
                        unset($_POST['data']);
                    } else {
                        echo "No data available";
                    }
                    ?>
                </div>
            </div>
            <p>
            <form action="addEvent.php" method="POST">
                <input type="submit" value="Add Event">
            </form>
            </p>
            <p>
            <form action="editEvent.php" method="POST">
                <input type="submit" value="Edit Event">
            </form>
            </p>
        </div>
    </main>

    <body>

</html>