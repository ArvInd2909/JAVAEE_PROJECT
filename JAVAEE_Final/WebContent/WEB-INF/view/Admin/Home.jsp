<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">

<%@taglib prefix="f" uri="http://www.springframework.org/tags/form"%>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Images Uploading</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <!-- <link rel="stylesheet" href="css/indexcss.css" type="text/css"> -->
    <link rel="stylesheet" href="AdminResources/css/indexcs.css" type="text/css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
</head>
 
<body>
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
	    <div id="title">
        <h1>Product Inventory</h1>
    </div>
    <div class="topnav">
        <a href="spring_logout">Log OUT  <i class="fa fa-1x fa-sign-out">  </i></a> 
    </div>
    
    <hr>
    <div class="row">
        <div class="column1" >
            <f:form action="Add.html" method="post" enctype="multipart/form-data" modelAttribute="data">
                <div>
                    <label for="name">Product Title</label>
                    <f:input type="text" id="name" path="product_name" placeholder="Enter the name product"
                           value="" name="name" required="true"/>
                </div>
                <div>
                    <label for="name">Price</label>
                    <f:input type="text" id="price" path="price" placeholder="Enter the price of the product "
                           value="" name="price" required="true"/>
                </div>
                <div>
                    <label for="quantity">Quantity</label>
                    <f:input type="number" id="quantity" path="quantity" min="1" value="" name="quantity" placeholder="Enter the Quantity" required="true"/>
                </div>
                <div>
                    <label for="desc">Product Description</label><br>
                    <f:textarea id="desc" name="desc" rows="3" cols="50" value="" path="product_desc" placeholder="Provide a description of the product" style="resize: none;"></f:textarea>
                </div>
                <div>
                    <label for="Cat">Product Category</label><br>
                    <f:select id="type" name="category" path="product_type">
                        <option value="Laptops">Laptops</option>
                        <option value="SmartPhones">SmartPhones</option>
                        <option value="Gadgets">Gadgets</option>
                        <option value="Television">SmartTV</option>
                    </f:select>
                </div>
                <label>Select a image for product</label>
                <div class="file-input">
                    <br>
                    <label for="image">Upload Image<p class="file-name">No file chosen</p></label>
                    <input type="file" id="image" class="file" name="image" value="" required><br><br>
                </div>
                <div>
                    <button type="submit" class="button1">Submit</button>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="Inventory.html">Click to check Inventory</a>    
                </div>
                
            </f:form>
        
          
        </div>
        
      </div>
</body>
 
</html>