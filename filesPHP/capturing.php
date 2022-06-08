<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Capture score</title>
    <link rel="stylesheet" href="manageUsers-styles.css">
</head>
<body>


    <div id="scoring">

    </div>



        <script>

            var  arr = <?php echo json_encode($playersInEvent) ?> 
            
           var display="";

           for(var r=0; r< arr.length; r++)
           {
                display+=` <form id="formA">
                    <div class="row">
                    <h4>Capturing Scores</h4>
                    <div class="input-group ">
                        <h4>${arr[r]['player_fname']}</h4>
                        <input name="hole1" class="holy" id="hole1" type="text" placeholder="Hole 1"/><br>
                        <input name="hole2" class="holy"id="hole2" type="text" placeholder="Hole 2"/><br>
                        <input name="hole3" class="holy"id="hole3" type="text" placeholder="Hole 3"/><br>
                        <input name="hole4" class="holy"id="hole4" type="text" placeholder="Hole 4"/><br>
                        <input name="hole5" class="holy"id="hole5" type="text" placeholder="Hole 5"/><br>
                        <input name="hole6" class="holy"id="hole6" type="text" placeholder="Hole 6"/><br>
                        <input name="hole7" class="holy"id="hole7" type="text" placeholder="Hole 7"/><br>
                        <input name="hole8" class="holy"id="hole8" type="text" placeholder="Hole 8"/><br>
                        <input name="hole9" class="holy"id="hole9" type="text" placeholder="Hole 9"/><br>
                        <input name="hole10" class="holy" id="hole10" type="text" placeholder="Hole 10"/><br>
                        <input name="hole11" class="holy" id="hole11" type="text" placeholder="Hole 11"/><br>
                        <input name="hole12" class="holy" id="hole12" type="text" placeholder="Hole 12"/><br>
                        <input name="hole13" class="holy" id="hole13" type="text" placeholder="Hole 13"/><br>
                        <input name="hole14" class="holy" id="hole14" type="text" placeholder="Hole 14"/><br>
                        <input name="hole15"class="holy" id="hole15" type="text" placeholder="Hole 15"/><br>
                        <input name="hole16" class="holy" id="hole16" type="text" placeholder="Hole 16"/><br>
                        <input name="hole17" class="holy" id="hole17" type="text" placeholder="Hole 17"/><br>
                        <input name="hole18" class="holy" id="hole18" type="text" placeholder="Hole 18"/><br>

                    </div></div>
                <div class="action">
                <button id="captureScore" class="action-button value='${arr[r]['id']}'">Capture</button>
                </div><br>
            </form>`;
           }
           
           document.getElementById('scoring').innerHTML= display;

           document.getElementById('captureScore').onclick = function()
           {
                console.log(document.getElementById('captureScore').value);
           }
         

        </script>
</body>
</html>


