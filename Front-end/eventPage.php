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
                        Create User
                    </p>
                </h1>
            </div>
            <div class="box3" id="loginForm">
                <p id=intro>
                    On this page you may create a user who will use the Golf Galore web application.
                <p>

                <p id="createUserForm">
                <form action="createUser-validation.php" method="POST">
                    <label for="user">Email:</label>
                    <input type="text" id="user" name="email">
                    <label for="pass">Password:</label>
                    <input type="text" id="pass" name="pass"><br><br>
                    <label for="user">First Name:</label>
                    <input type="text" id="user" name="fname">
                    <label for="pass">Surame:</label>
                    <input type="text" id="pass" name="sname"><br><br>
                    <label for="user">Age:</label>
                    <input type="text" id="user" name="age">
                    <label for="admin">Admin privilages?</label>
                    <input type="checkbox" name="admin_priv" id="admin"><br><br>
                    <input type="submit" value="Submit">
                </form>
                </p>
            </div>
    </main>

    <body>

</html>