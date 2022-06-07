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
            COS 221 - Practical Assignment 5
          </p>
        </h1>
      </div>
      <div class="box2" id="loginForm">
        <p id=intro>
          Hi, welcome to Golf Galore; a platform whereby you can host golf events, add players to these events as well as capture and view data for these events and players. Please login to continue.
        <p>

        <p>
        <form action="tournamentPage.php" method="POST">
          <label for="user">Username:</label>
          <input type="text" id="user" name="username">
          <label for="pass">Password:</label>
          <input type="text" id="pass" name="password"><br></br>
          <input type="submit" value="Submit">
        </form>
        </p>
      </div>
  </main>

  <body>

</html>