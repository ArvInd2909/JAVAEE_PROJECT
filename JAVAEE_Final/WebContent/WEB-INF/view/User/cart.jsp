<%@page import="com.mysql.cj.Session"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
  <head>
    <!-- <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1"> -->
    <title>ElectroCloud</title> 
    <link rel="stylesheet" href="UserResources/css/cartstyle.css" media="screen" title="no title" charset="utf-8">
    <script src="https://code.jquery.com/jquery-3.6.0.js" crossorigin="anonymous" charset="utf-8"></script>
    <script type="text/javascript" src="UserResources/Js/cart.js" charset="utf-8"></script>
    <!-- <meta name="robots" content="noindex,follow" /> -->
  </head>
  <body>
    <div class="shopping-cart">
      <!-- Title -->
      <div class="title">
        Shopping Bag | 		<a href="shop.html" style="text-decoration: none;">GO Back</a>
      </div>
      <div class="status">
        </br>
        <img src="UserResources/images/thumbs-up.jpeg" alt="Success" style="height: 300; width: 300px;">
        </br>
        <h3 class="msg" style="color: green;">Your Order has Been Placed Successfully!!</h3>
        <a href="shop.html" style="color: brown;">Continue Shopping...</a>
      </div>
      <!-- Product #1 -->
     
      <script type="text/javascript">
      var Msg ='<%=session.getAttribute("Checkout")%>';
	    if (Msg != "null") {
			 function alertName(){
				 $(".status").show();
			        $(".item").hide();
			        $(".total-price").hide();
			        $("#btn").hide();
			        $(".empty").hide();
			 } 
	 	}
      </script>
      <script type="text/javascript"> window.onload = alertName; </script>
      <% session.removeAttribute("Checkout"); %>
        <c:forEach items="${Item}" var="p">
      <div class="item">
            
            <div class="buttons">
            <span class="delete-btn" onclick="location='cartdelete.html?id=${p.productId}'"></span>
            <span class="like-btn"></span>
            </div>
            <div class="image">
                <img id="cart_image" src="data:image/jpeg;base64,${p.product_picAsBase64}" alt="${p.product_name}">
            </div>
            <div class="description">
                <span class="item-name">${p.product_name} </span>
                <span calss="item-description">${p.product_desc} </span>
            </div>
            <div class="quantity">
                <button class="plus-btn" type="button" name="button">
                    <img src="UserResources/images/plus.svg" alt="add" />
                </button>
                <input type="text" class="order_qnty" name="ordered_qnty" value="1">
                <button class="minus-btn" type="button" name="button">
                    <img src="UserResources/images/minus.svg" alt="remove" />
                </button>
                <input class="qnty" name="name1" value="${p.quantity}">
               
            </div>
            
            <input class="qnty-price" name="price" type="text" value="$${p.price}" readonly>
            <input class="temp-price" name="price" type="text" value="${p.price}" style="display: none;">
         </div>
        </c:forEach>
        <c:choose>
	        <c:when test="${fn:length(Item)>0}">
		        <div class="total-price">
		            <label style="font-family: cursive; color: rgb(42, 36, 66); font-weight: bolder;">Total Price:</label>
		            <input class="order_Total" type="text" value="0">
		        </div>
		        
		        <div id="btn">
		            <button class="button button1" onclick="location='checkout.html'">Proceed To Checkout</button>
		        </div>
	        </c:when>
        	<c:otherwise>
            <div class="empty">
              <img class="center" src="UserResources/images/cart.jpg" alt="cart">
              <h1 style="text-align: center; color: red;"> Cart Is Empty !!!</h1>
              <h3 style="text-align: center; color: rgb(42, 36, 66);"><a href="shop.html" style="text-decoration: none;">Please add some items in cart</a></h3>
            </div>
          </c:otherwise>
          </c:choose>
        </div>
        
  </body>
</html>
