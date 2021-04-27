<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Images Uploading</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="AdminResources/css/indexcss.css" type="text/css">
    <link rel="stylesheet" href="AdminResources/css/font.css" type="text/css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script>
        function deleteInve(item)
        {
            alert(item)
            var urlEnd="http://127.0.0.1:3000/removeProduct";
            $.ajax({
                    
                type:'post',
                url: urlEnd,
                dataType: 'json',
                contentType:'application/json',
                success: function(data,status){
                    alert("Item Removed Successfully");
                    window.location.href="/inventory"
                },
                error: function(status,jqXhr,textStatus){
                    
                    alert("Message: Error")
                },
                data: '{"product_name":"'+item+'"}'
            });
        }
        function checkInv(){
            var urlEnd="http://127.0.0.1:3000/inventory";
            var item=$("#type").val();
            alert(item)
            $.ajax({
                    
                type:'post',
                url: urlEnd,
                dataType: 'json',
                contentType:'application/json',
                success: function(data,status){
                    // alert("Item Removed Successfully");
                    // window.location.href="/inventory"
                    alert("done");
                },
                error: function(status,jqXhr,textStatus){
                    
                    alert("Message: Error")
                },
                data: '{"category":"'+item+'"}'
            });
        }
    </script>
</head>
 
<body>

	 <script type="text/javascript">
		var Update ='<%=session.getAttribute("Update")%>';
		var Delete ='<%=session.getAttribute("Delete")%>';
		    if (Update != "null") {
				 function alertMSG(){
				 	alert(Update);
				 } 
		 	}
		    else if(Delete !="null"){
		    	function alertMSG(){
					 alert(Delete);
					 } 
		    }
	 </script>
	 <script type="text/javascript"> window.onload = alertMSG; </script>
	 <% session.removeAttribute("Update");
	 session.removeAttribute("Delete");%>
					 
    <div class="row1">
        <div class="column1" >
            <form action="Typeinventory.html" method="POST">
                <div>
                <label id="label" for="Cat">Product Category</label><br>
                <select id="type" name="category">
                    <option value="All">All Products</option>
                    <option value="Laptops">Laptops</option>
                    <option value="SmartPhones">SmartPhones</option>
                    <option value="Gadgets">Gadgets</option>
                    <option value="Television">SmartTV</option>
                </select>
                </div>
                <div id="check">
                <button type="submit" >Check</button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</div>
                <div id="link">
                    <a id="link" href="admin.html" style="margin: auto;">Add Products</a>    
                </div>
            </form>
        </div>
    </div>
    <div class="topnav">
        <a href="spring_logout">Log OUT  <i class="fa fa-1x fa-sign-out">  </i></a> 
    </div>
    
    <div class="inv_items">
            <c:forEach items="${List}" var="i">
            <div class="card">
                <img id="prd_img" src="data:image/jpeg;base64,${i.product_picAsBase64}" alt="${i.product_name}" >
                <h1 id="pr_name">${i.product_name}</h1>
                <p id="price">${i.price}</p>
                <p id="pr_desc">${i.product_desc}</p>
                <%-- <c:when test="${i.quantity>1}"> --%>
                <p><button style="background-color: red;"><a href="deleteproduct.html?id=${i.productId}" style="text-decoration: none; color:black">Delete Product</a></button></p>
                <p><button style="background-color: Blue;"><a href="updateproduct.html?id=${i.productId}" style="text-decoration: none; color:white">Update Product</a></button></p>
                <%-- </c:when> --%>
               <%--  <c:otherwise>
                <p><button style="background-color: red; color: black; font-weight: bolder;" onclick="deleteInve('${i.product_name}')">Out Of stock.. Click to Delete</button></p>
                </c:otherwise> --%>
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
		<img id="footerlogo" src="AdminResources/images/flogo.png" alt="Influence Agency">
	</div>  
</body>
 
</html>