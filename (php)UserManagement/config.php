<?php

    class Database
    {
        private $servername = "wheatley.cs.up.ac.za";
        private $username = "u20438614";
        private $password = "MWD6JNNKYKN3BBC6QYCMAJQUBXQA62LK";
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
                $this->connection->select_db("u20438614_Prac5COS221");
                $connStatus="Connection Success";

            }

            return $this->connection; 
        }

        public function disconnect ()
        {
            $this->connection->close();
        }

    

        public function addUser($id, $name, $surname, $email, $password, $admin)
        {
            $hashedPassword = base64_encode(sha1($password.$email, true)); 

            $selectquery = " SELECT *
            FROM UserManagement
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
        
                $insertquery = "INSERT INTO UserManagement(ID, Name, Surname, Email, password, Admin)
                                    VALUES('$id' ,'$name', '$surname', '$email', '$hashedPassword', '$admin')";
                
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
            FROM UserManagement
            WHERE ID = '$id'"; 
        
            $connection = new Database();
            $conn =$connection->connect();
        
            $result = $conn->query($selectquery);
        
            if($result->num_rows > 0)
            {
               $removeQuery = "DELETE FROM `UserManagement` WHERE ID='$id'";
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
            FROM UserManagement
            WHERE ID = '$id'"; 
        
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
            FROM UserManagement"; 
        
            $connection = new Database();
            $conn =$connection->connect();
        
            $result = $conn->query($selectquery);
            if( mysqli_num_rows($result) > 0)
            {
                for($x=0; $x< mysqli_num_rows($result); $x++)
                {
                    $arr = mysqli_fetch_array($result);
                    $array[$x]['id']= $arr['ID'];
                    $array[$x]['name']= $arr['Name'];
                    $array[$x]['surname']= $arr['Surname'];
                    $array[$x]['email']= $arr['Email'];
                    $array[$x]['admin']= $arr['Admin'];
          
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

    }
    
    
?>