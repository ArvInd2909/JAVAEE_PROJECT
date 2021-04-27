<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Images Uploading</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="UserResources/css/indexcss.css" type="text/css">
    <link rel="stylesheet" href="UserResources/css/font.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script>
        function addTocart(item)
        {
            alert(item)
            var urlEnd="http://127.0.0.1:3000/addCart";
            var user=$("#user_id").html();
            console.log(user)
            if(typeof user=='undefined')
            {
                alert("Please Login First and Then try Again...");
                window.location.href="/login";
            }
            else{
                $.ajax({
                    
                    type:'post',
                    url: urlEnd,
                    dataType: 'json',
                    contentType:'application/json',
                    success: function(data,status){
                        alert(data.cart+" added to cart successfully")
                    },
                    error: function(status,jqXhr,textStatus){
                        
                        alert("Message: Already in cart")
                    },
                    data: '{"product_name":"'+item+'"}'
                });
            }
        }    
    </script>
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
        <div class="navbar">
        <a href="user.html">Home <i class="fa fa-home"></i></a>
        <div class="dropdown">
          <button class="dropbtn" onclick="window.location.href='#';">Shop 
            <i class="fa fa-caret-down"></i>
          </button>
          <div class="dropdown-content">
            <a href="type.html?category=Television">Television <i class="fa fa-tv"></i></a>
            <a href="type.html?category=SmartPhones">Phone <i class="fa fa-mobile"></i></a>
            <a href="type.html?category=Gadgets">Smart Watch <i class="fa fa-clock-o"></i></a>
            <a href="type.html?category=Laptops">Laptop <i class="fa fa-laptop"></i></a>
          </div>
         
        </div> 
        <a href="#Contact"><i class="fa fa-phone"></i> Contact us</a>
        	<% String S=(String)session.getAttribute("FName");
					String s1="Welcome, ";									
				%>
				 <script type="text/javascript">
					var Msg ='<%=session.getAttribute("cart")%>';
					    if (Msg != "null") {
							 function alertName(){
							 alert(Msg);
							 } 
					 	}
				 </script>
				 <script type="text/javascript"> window.onload = alertName; </script>
				 <% session.removeAttribute("cart"); %>
            <!-- <a href="/login" id="rre">Login  <i class="fa fa-1x fa-user"></i></a>
            <a href="/Register" id="re">Sign up  <i class="fa fa-1x fa-sign-in"></i></a> 

            <div id="re"> -->
            <div class="dropdown2">
                <button class="dropbtn" id="user_id" onclick="window.location.href='#';"><%=s1+S%>  
                    <i class="fa fa-caret-down"></i>
                </button>
                <div class="dropdown-content">
                    <a href="spring_logout">Log Out <i class="fa fa-1x fa-sign-out"></i></a>	
                </div>
            </div>
            <a href="cart.html" id="rre">Cart <i class="fa fa-1x fa-sign-out"></i></a>	
            </div>
            
            <!-- <a href="#" id="re"> <i class="fa fa-1x fa-user"></i></a> -->
           <%--  <%}%> --%>
      </div>
    </div>
    </div>
    <div class="items">
            <c:forEach items="${List}" var="i">
            <div class="card">
                <img id="prd_img" src="data:image/jpeg;base64,${i.product_picAsBase64}" alt="${i.product_name}" >
                <h1 id="pr_name">${i.product_name}</h1>
                <p id="price">${i.price}</p>
                <p id="pr_desc">${i.product_desc}</p>
                <c:choose>
                <c:when test="${i.quantity>0}">
                <p><button style="background-color:#1FF4AD;"><a href="addTocart.html?id=${i.productId}" style="text-decoration: none; color:black">Add to Cart</a></button></p>
                </c:when>
               	<c:otherwise>
                <p><button style="background-color: red; color: black; font-weight: bolder;" onclick="deleteInve('${i.product_name}')">Out Of stock.. Click to Delete</button></p>
                </c:otherwise>
                </c:choose>
            </div>
            </c:forEach>
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