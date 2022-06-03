<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Manage Users</title>
    <link rel="stylesheet" href="manageUsers-styles.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
</head>
<body>


    <div>
    <a href="#"  id= "viewing" class="btn">View Users</a>
    <a href="#" id= "adding" class="btn">Add User</a>
    <a href="#" id="finding" class="btn">Find User</a>
    <a href="#" id="removing" class="btn">Remove User</a>

    </div>


    <div id= "userView">

    </div>

    <div id= "findUser">

        <div class="container">
                <form id="formC" >
                    <div class="row">
                        <h4>Find User</h4>
                        <div class="input-group ">
                            <input name="id" id="idfinding" type="text" placeholder="User ID"/>
                        </div>
                        
                    </div>
                    <div class="action">
                        <button id="found" class="action-button">Find User</button>
                    </div>
                
                </form>
                
            </div>
        
    </div>

    <div id= "addUser">

        <div class="container">
            <form id="formA" method="POST" action="addUser.php">
                <div class="row">
                    <h4>Add user Details</h4>
                    <div class="input-group ">
                        <input name="idnumber" type="text" placeholder="ID Number"/>
                    </div>
                    <div class="input-group ">
                        <input name="name" type="text" placeholder="Full Name"/>
                    </div>
                    <div class="input-group">
                        <input name="surname" type="text" placeholder="Surname"/>
                    </div>
                    <div class="input-group ">
                        <input name="email" type="text" placeholder="Email Adress"/>
                    </div>
                    <div class="input-group ">
                        <input name="password" type="text" placeholder="Password"/>
                    </div>
                    <div class="input-group">
                        <input name="admin" type="text" placeholder="Admin: true or false"/>
                    </div>
                    <div class="input-group">
                        <input name="adminCode" type="password" placeholder="Administation Code"/>
                    </div>
                </div>
                <div class="action">
                    <button id="added" class="action-button">Add User</button>
                </div>
            
            </form>
            
        </div>
    </div>

    <div id= "deleteUser">

        <div class="container">
            <form id="formB" method="POST" action="removeUser.php">
                <div class="row">
                    <h4>Remove User</h4>
                    <div class="input-group ">
                        <input name="idnumber" type="text" placeholder="User ID Number"/>
                    </div>
                    
                    <div class="input-group">
                        <input name="adminCode" type="password" placeholder="Administation Code"/>
                    </div>
                </div>
                <div class="action">
                    <button id="removed" class="action-button">Remove User</button>
                </div>
            
            </form>
            
        </div>
    </div>


    <script>

        document.getElementById("adding").onclick = function()
        {
            document.getElementById("addUser").style.display = "block";
            document.getElementById("userView").style.display= 'none';
            document.getElementById("findUser").style.display = 'none';
            document.getElementById("deleteUser").style.display = 'none';
        }

        document.getElementById("viewing").onclick = function()
        {
            
            document.getElementById("userView").style.display= 'none';
            document.getElementById("findUser").style.display = 'none';
            document.getElementById("deleteUser").style.display = 'none';


            $.ajax({
            url:"viewUsers.php",  
            success:function(result){
              console.log(result);
              var array = JSON.parse(result);
       
              var display = ` <table>
                            <thead>
                                <tr>
                                <th>ID Number</th>
                                <th>Name</th>
                                <th>SurName</th>
                                <th>Email</th>
                                <th>Admin</th>
                                </tr>
                            </thead>
                            <tbody>`;

                for(var x=0; x< array.length; x++)
                {
                    display += `<tr>
                    <td>${array[x].id}</td>
                    <td>${array[x].name}</td>
                    <td>${array[x].surname}</td>
                    <td>${array[x].email}</td>
                    <td>${array[x].admin}</td> 
                    </tr>`
                }

                display += `</tbody>
                </table>`;

                console.log(display);

                document.getElementById("userView").innerHTML = display;
              document.getElementById("userView").style.display= 'block';
            

                
                    
            }
            });
            
        }

        document.getElementById("removing").onclick = function()
        {
            document.getElementById("deleteUser").style.display = "block";
            document.getElementById("userView").style.display= 'none';
            document.getElementById("findUser").style.display = 'none';
            document.getElementById("addUser").style.display = 'none';
        }

        document.getElementById("finding").onclick = function()
        {
            document.getElementById("findUser").style.display = "block";
            document.getElementById("userView").style.display= 'none';
            document.getElementById("addUser").style.display = 'none';
            document.getElementById("deleteUser").style.display = 'none';

            
        }

        document.getElementById("found").onclick = function()
        {
           var id = document.getElementById("idfinding").value;

            $.ajax({
            url:"findUser.php",  
            type: "post",   
            dataType: 'json',
            data: {ID: id},
            success:function(result){
                console.log(result);
                display=`
                        <table>
                        <thead>
                            <tr>
                            <th>ID Number</th>
                            <th>Name</th>
                            <th>SurName</th>
                            <th>Email</th>
                            <th>Admin</th>
                            </tr>
                        </thead>
                        <tbody>
                        <tr>
                        <td>${result.id}</td>
                        <td>${result.name}</td>
                        <td>${result.surname}</td>
                        <td>${result.email}</td>
                        <td>${result.admin}</td> 
                        </tr>
                        </tbody>
                        </table>`;

              document.getElementById("userView").innerHTML = display;
              document.getElementById("userView").style.display= 'block';
              document.getElementById("findUser").style.display = 'none';

            

            }
            });
        }

            
            
        
        document.getElementById("added").onclick = function()
        {

            document.getElementById("formA").submit();
           
        }

        document.getElementById("removed").onclick = function()
        {

            document.getElementById("formB").submit();
           
        }
    </script>
</body>
</html>

