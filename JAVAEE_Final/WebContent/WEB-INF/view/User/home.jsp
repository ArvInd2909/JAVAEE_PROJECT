<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
	<title>ElectroMart</title>
	<link rel="stylesheet" href="UserResources/css/aboutcss.css">
	<link rel="stylesheet" href="UserResources/css/font.css">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script type="text/javascript" src="UserResources/Js/cycle.js"></script>
	<style>
	.slideshow{	
		width:100%;	
	}



</style>
	
	</head>
<body>
		
	<div id="hdr">
		<img id="logo" src="UserResources/images/ELECTROmart.png" alt="CAST_logo" width="20%" height="120px">
					
		<div class="wrapper">
					
			<a href="http://www.google.com"><i class="fa fa-2x fa-google-plus"></i></a>
			<a href="http://www.facebook.com"><i class="fa fa-2x fa-facebook-square"></i></a>
			<a href="http://www.twitter.com"><i class="fa fa-2x fa-twitter-square"></i></a>
			<a href="http://www.twitter.com"><i class="fa fa-2x fa-linkedin-square"></i></a>
			<br><h1 id="num">647-696-8998</h1>
					
		</div>
					
		<div id="main">
			<div class="topnav" id="myTopnav">
				<a href="#home" class="active">Home <i class="fa fa-home"></i></a>
				<div class="dropdown">
					<button class="dropbtn" onclick="window.location.href='shop.html';">Shop
						<i class="fa fa-caret-down"></i>
					</button>
					<div class="dropdown-content">
						<a href="type.html?category=Television">Television <i class="fa fa-tv"></i></a>
			            <a href="type.html?category=SmartPhones">Phone <i class="fa fa-mobile"></i></a>
			            <a href="type.html?category=Gadgets">Smart Watch <i class="fa fa-clock-o"></i></a>
			            <a href="type.html?category=Laptops">Laptop <i class="fa fa-laptop"></i></a>				  
					</div>
				</div> 
				<a href="#contact"><i class="fa fa-phone"></i> Contact Us</a>
				<% String S=(String)session.getAttribute("FName");
					String s1="Welcome, ";%>
				<a href="cart.html" id="Sign">Cart <i class="fa fa-1x fa-shopping-cart"></i></i></a>
				<div class="dropdown2">
					<button class="dropbtn"><%=s1+S%> <i class="fa fa-1x fa-user"></i>
						<i class="fa fa-caret-down"></i>
					</button>
					<div class="dropdown-content">
						<a href="spring_logout">Log Out <i class="fa fa-1x fa-sign-out"></i></a>					  
					</div>
				</div> 
				<!-- <a href="#" id="Sign"><%-- <%=User%> --%> <i class="fa fa-1x fa-user"></i></a>
				<a href="/logout" id="log">Log Out <i class="fa fa-1x fa-sign-out"></i></a>	 -->
				<%-- <%}%> --%>
				<!-- <a href="javascript:void(0);" style="font-size:15px;" class="icon" onclick="myFunction()">&#9776;</a> -->
			</div>
			<script>
							function myFunction() {
							  var x = document.getElementById("myTopnav");
							  if (x.className === "topnav") {
								x.className += " responsive";
							  } else {
								x.className = "topnav";
							  }
							}
						</script>
		</div>	
	</div>
				
						
	<div id="mainbody">
					
		<script type="text/javascript">

			$(document).ready(function(){
			  $('.slideshow').cycle({
					fx: 'fade' // choose your transition type, ex: fade, scrollUp, shuffle, etc...
				});
			  
			});
		</script>
		
		<div class="slideshow">
			
			<img src="UserResources/images/four.jpg" width="100%" height="600px" />
			<img src="UserResources/images/one.jpg" width="100%" height="600px"/>
			<img src="UserResources/images/three.jpg" width="100%" height="600px"/>
			<img src="UserResources/images/two.jpg" width="100%" height="600px" />
		</div>
		<!-- <button onclick="topFunction()" id="myBtn" title="Go to top"><strong>&#8811</strong></button>
		<script src="js/ScrollTop.js"></script>	 -->
	</div>
	<div class="footer">
		<small>
			<p>
				<a href="#home">Home</a> | <a href="#AboutUS">About US</a> |  <a href="#contact">Contact Us</a> | <a href="#blog">blog</a> | 
				<a href="#Customer Reviews">Customer Reviews</a> | <a href="#Return_Policy">Return Policy</a> |
				<a href="#SiteMap">Site Map</a>
			</p>
			<p>&copy; All Rights Reserved ElectroMart <br> Powered by CSAT ROCKERS
</p>
	    </small>
		<img id="footerlogo" src="images/flogo.png" alt="Influence Agency">
	</div>  

			
		
	</body>
</html>