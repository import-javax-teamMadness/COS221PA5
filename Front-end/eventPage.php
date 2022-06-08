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
        <div class=eventpage-flex-container-ongoingEvents>
            <div class="box9" id="loginForm">
                <h2 class=ongoingEvents>
                    Ongoing events:
                </h2>
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

                <table style="margin: auto; background-color: black;" border='3' ; id='events'>
                    <th>ID</th>
                    <th>Start Date and Time</th>
                    <th>Site ID</th>
                    <th>Event Status</th>
                    <th>Attendance</th>
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
                        $query = "SELECT id, start_date_time, site_id, event_status, attendance from events ORDER BY id DESC Limit 10";

                        $result = mysqli_query($conn, $query);
                        $list = array();

                        if (mysqli_num_rows($result) > 0) {
                            while ($row = $result->fetch_assoc()) {
                                if ($row['event_status'] != 'Complete') {
                                    echo "<script>var table = document.getElementById('events');
                                    var row = table.insertRow();
                
                                    var cell1 = row.insertCell(0);
                                    var cell2 = row.insertCell(1);
                                    var cell3 = row.insertCell(2);
                                    var cell4 = row.insertCell(3);
                                    var cell5 = row.insertCell(4);
                
                                    cell1.innerHTML = " . $row['id'] . ";
                                    cell2.innerHTML = '" . $row['start_date_time'] . "';
                                    cell3.innerHTML = '" . $row['site_id'] . "';
                                    cell4.innerHTML = '" . $row['event_status'] . "';
                                    cell5.innerHTML = '" . $row['attendance'] . "';
                                    </script>";
                                }
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





                    <!--
        <div class="eventpage-flex-container-eventStats">
            <div class="box10" id="eventStats">
                <h2>
                    Event Statistics:
                </h2>
                
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
                -->

                    <div>
                        <div>
                            <form>
                                <input type=text name=get_players placeholder="Enter Event ID">
                                <button>Get Players</button>
                            </form>
                        </div>
                        <h2>
                            Search for players by Event ID
                        </h2>
                        <table style="margin: auto; background-color: black;" border='3' ; id='players_in_event'>
                            <th>ID</th>
                            <th>Player Name</th>
                            <th>Handicap</th>
                        </table>
                    </div>

                    <?php
                    if (isset($_POST['get_players'])) {
                        $query = "Select golf_participatesIn.Player_id, golf_player.player_fname, golf_player.player_sname,golf_player.handicap 
                    from golf_participatesIn 
                    Inner join golf_player ON golf_participatesIn.Player_id = golf_player.id where golf.participatesIn.Event_id = '" . $_POST['get_players'] . "'";
                        $result = mysqli_query($conn, $query);
                        $list = array();

                        if (mysqli_num_rows($result) > 0) {
                            while ($row = $result->fetch_assoc()) {
                                echo "<script>var table = document.getElementById('players_in_event');
                        var row = table.insertRow();
                
                        var cell1 = row.insertCell(0);
                        var cell2 = row.insertCell(1);
                        var cell3 = row.insertCell(2);
                
                        cell1.innerHTML = " . $row['Player_id'] . ";
                        cell2.innerHTML = " . $row['player_fname'] . " " . $row['player_fname'] . ";
                        cell3.innerHTML = '" . $row['handicap'] . ";
                        </script>";
                            }
                        }
                    }
                    ?>

            </div>

    </main>

    <body>

</html>