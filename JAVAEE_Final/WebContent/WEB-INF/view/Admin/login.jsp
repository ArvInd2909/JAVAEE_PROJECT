<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">

<head>
<link href="https://fonts.googleapis.com/css?family=Ubuntu" rel="stylesheet">
  <meta name="viewport" content="width=device-width, initial-scale=1" />
  <link rel="stylesheet" href="AdminResources/css/LoginForm.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script type="text/javascript" src="js/Valid.js"></script>
  <script type="text/javascript" src="js/Login.js"></script>
  <title>Sign in</title>
</head>
<body>
  <div class="loginmain">
    <p class="sign" align="center">Sign in</p>
    <form class="form1" action="spring_verify" method="post">
      <input class="un " id="user_id" type="text" name="username" placeholder="Please enter your email">
      <input class="pass" id="password" type="password" name="password" placeholder="Please enter your password">
      <button type="submit" class="submit">Login</button>
    <p class="newuser" align="center"><a href="loadreg.html">New User? Click here to sign-up</p>
    </form>
  </div> 
</body>
</html>