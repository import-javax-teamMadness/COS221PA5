<?php

    class Database
    {
        private $servername = "localhost";
        private $username = "root";
        private $password = "Gobblx17";
        private $connection;

        public function connect()
        {
            $this->connection = null;
            
            $this->connection = new mysqli($this->servername, $this->username, $this->password);

            if($this->connection->connect_error)
            {
                $connStatus="Connection failure: ". $this->connection->connect_error;
                die();
            }
            else
            {
                $this->connection->select_db("golf_sportsdb");
                $connStatus="Connection Success";

            }

            return $this->connection; 
        }

        public function disconnect ()
        {
            $this->connection->close();
        }

    

        public function addUser($id, $name, $surname, $email, $password, $admin, $age)
        {
            $hashedPassword = base64_encode(sha1($password.$email, true)); 

            $selectquery = " SELECT *
            FROM users
            WHERE email = '$email'"; 
        
            $connection = new Database();
            $conn =$connection->connect();
        
            $result = $conn->query($selectquery);
        
            if($result->num_rows > 0)
            {
               echo '<script type= "text/javascript">
                    alert("Email already exists in database");
                    </script>';
        
            }
            else
            {
        
                $insertquery = "INSERT INTO users(uid, fname, sname, email, password, admin_priv, age)
                                    VALUES('$id' ,'$name', '$surname', '$email', '$hashedPassword', '$admin', '$age')";
                
                if($conn->query($insertquery)===true)
                {
                    echo '<script type= "text/javascript">
                    alert("Successful");
                    </script>';
                    header("Location: manageUsers.php");
                
                }
                else
                {
                    echo '<script type= "text/javascript">
                    alert("Connection Error");
                    </script>';
                    
                }
        
            }
        
            $connection->disconnect();

        }

        public function removeUser($id)
        {
           
            $selectquery = " SELECT *
            FROM users
            WHERE uid = '$id'"; 
        
            $connection = new Database();
            $conn =$connection->connect();
        
            $result = $conn->query($selectquery);
        
            if($result->num_rows > 0)
            {
               $removeQuery = "DELETE FROM `users` WHERE uid='$id'";
                if($conn->query($removeQuery)===true)
                {
                    echo '<script type= "text/javascript">
                    alert("Successful");
                    </script>';
                
                }
                else
                {
                    echo '<script type= "text/javascript">
                    alert("Connection Error");
                    </script>';
                    
                }

            }
            else
            {
                echo '<script type= "text/javascript">
                    alert("User not in database");
                    </script>';
        
            }
        
            $connection->disconnect();

        }

        public function findUsers($id)
        {

            $selectquery = " SELECT *
            FROM users
            WHERE uid = '$id'"; 
        
            $connection = new Database();
            $conn =$connection->connect();
        
            $result = $conn->query($selectquery);
        
            if($result->num_rows > 0)
            {
                $userInfo = mysqli_fetch_assoc($result);
            

                return $userInfo;

        
            }
            else
            {

                echo '<script type= "text/javascript">
                alert("User not in database");
                </script>';
        
        
            }
        
            $connection->disconnect();
        }

        public function viewUsers()
        {
            $selectquery = " SELECT *
            FROM users"; 
        
            $connection = new Database();
            $conn =$connection->connect();
        
            $result = $conn->query($selectquery);
            if( mysqli_num_rows($result) > 0)
            {
                for($x=0; $x< mysqli_num_rows($result); $x++)
                {
                    $arr = mysqli_fetch_array($result);
                    $array[$x]['id']= $arr['uid'];
                    $array[$x]['name']= $arr['fname'];
                    $array[$x]['surname']= $arr['sname'];
                    $array[$x]['email']= $arr['email'];
                    $array[$x]['admin']= $arr['admin_priv'];
                    $array[$x]['age']= $arr['age'];
          
                }
                
                return $array;
        
            }
            else
            {

                echo '<script type= "text/javascript">
                alert("No users in database");
                </script>';
        
        
            }
        
            $connection->disconnect();
        }


        public function isEventEmpty($eventID)
        {
            $connection = new Database();
            $conn =$connection->connect();

            $selectquery = " SELECT *
            FROM events
            WHERE id = '$eventID'"; 

            $result = $conn->query($selectquery);

            

            if( mysqli_num_rows($result) > 0)
            {
                $eventInfo = mysqli_fetch_assoc($result);
                
                if( $eventInfo['event_status']=='incomplete')
                {
        
                    $players= $connection->getPlayersInEvent($eventID);
                }
                else
                {
                    echo '<script type= "text/javascript">
                    alert("Scores for event already captured");
                    </script>';
                }
            }
            else
            {
                echo '<script type= "text/javascript">
                alert("Event non existent");
                </script>';
            }

            return $players;
            $connection->disconnect();
        }

        public function getPlayersInEvent($eventID)
        {
            $connection = new Database();
            $conn =$connection->connect();

            $selectquery = " SELECT player_id
            FROM golf_participates_in
            WHERE event_id = '$eventID'"; 

            $result = $conn->query($selectquery);

            if( mysqli_num_rows($result) > 0)
            {
                for($x=0; $x< mysqli_num_rows($result); $x++)
                {
                    $arr = mysqli_fetch_array($result);
                    $array[$x]= $arr['player_id'];

          
                }
                $y=0;
                foreach($array as $ID)
                {
                    $i = intval($ID);
                    
                    $selectquery2 = " SELECT *
                    FROM golf_player
                    WHERE id = '$i'"; 
                  
                    $result1 = $conn->query($selectquery2);
                    $a = mysqli_fetch_assoc($result1);
                    
                    $player[$y]['id']= $a['id'];
                    $player[$y]['events_won']= $a['events_won'];
                    $player[$y]['player_fname']= $a['player_fname'];
                    $player[$y]['player_sname']= $a['player_sname'];
                    $player[$y]['world_ranking']= $a['world_ranking'];
                    $player[$y]['handicap']= $a['handicap'];

                    
                    $y++;

                }
                
            
                return $player;
                
            }
            else
            {
                echo '<script type= "text/javascript">
                alert("No players allocated to event");
                </script>';
            }
        }

    }
    
    
?>