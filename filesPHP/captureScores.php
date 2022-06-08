<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Capture Scores</title>
    <link rel="stylesheet" href="manageUsers-styles.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
</head>
<body>


    <div id='capture-Score'>


    </div>
    
    <div id='getevent' class="container">
            <form id="formA" method="post" action="playersInEvent.php">
                <div class="row">
                    <h4>Capturing Score for which event</h4>
                    <div class="input-group ">
                        <input name="eventId" id="eventId" type="text" placeholder="EventID"/>
                    </div>
                    
                </div>
                <div class="action">
                    <button id="capture" class="action-button">Start</button>
                </div><br>
                
            
            </form>
                <div class="viewEvents">
                    <button id="viewEvent"  class="action-button"><a href="###########################">View Events Without Scores</a></button>
                </div>
        </div>
    

    </div>

    <script>

        document.getElementById("capture").onclick = function()
        { 
            
            var id = document.getElementById("formA").submit();

            
            
        }
            
 
           
             
           


    </script>
</body>
</html>

