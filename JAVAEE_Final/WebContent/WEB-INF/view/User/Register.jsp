<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">

<%@taglib prefix="f" uri="http://www.springframework.org/tags/form"%>

<head>
  <!-- <link rel="stylesheet" href="css/style.css"> -->
  <link href="https://fonts.googleapis.com/css?family=Ubuntu" rel="stylesheet">
  <meta name="viewport" content="width=device-width, initial-scale=1" />
  <link rel="stylesheet" href="UserResources/css/LoginForm.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script type="text/javascript" src="js/Valid.js"></script>
  <script type="text/javascript" src="js/Reg.js"></script>
  <title>Sign in</title>
</head>

<body>
  <div class="registermain">
    <p class="sign" align="center">Enter Your Details To Register!</p>
    <p style="color: red" align="center">  
    	<%
         	String s=(String)session.getAttribute("Cnf_pass");
         	if(s != null)
         	{
         		out.print(s);
         		session.removeAttribute("Cnf_pass");
       	}%>
    </p>
    <f:form action="Register.html" class="form1" method="post" modelAttribute="data">
        <f:input class="un " type="text" name="fname" id="fname" path="firstname" placeholder="Enter Firstname" required="true"/><br>
        <f:input class="un " type="text" name="lname" id="lname" path="lastname" placeholder="Enter Lastname" required="true"/><br>
        <f:input class="un " type="email" name="user_id" id="user_id" path="loginVo.username" placeholder="Enter your email"/><br>
		<f:input class="un " type="number"  min="0" name="contact_no" id="contact_no" path="contact" placeholder="Enter your contact Number"/><br>
        <f:input class="pass" type="password" name="password" id="password" path="loginVo.password" placeholder="Enter your password"/><br>
        <input class="repass" type="password" name="r_password" id="r_password" placeholder="Confirm your password"/></br>
		<button class="submit" type="submit">Register</button></br>
		<a class="Log_Red" href="login.html"> Already Registered!!! Please click here to Login</a>
  </f:form>
    </div>
     
</body>

</html>