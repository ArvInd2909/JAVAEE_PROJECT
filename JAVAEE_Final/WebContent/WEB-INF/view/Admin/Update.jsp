<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@taglib prefix="f" uri="http://www.springframework.org/tags/form"%>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>ElectroCloud: Inventory Management</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <!-- <link rel="stylesheet" href="AdminResources//css/indexcss.css" type="text/css"> -->
    <link rel="stylesheet" href="AdminResources/css/indexcs2.css" type="text/css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
</head>
 
<body>
    <div id="title">
        <h1>Update Product_Details</h1>
    </div>
    <div class="topnav">
        <a href="/logout">Log OUT  <i class="fa fa-1x fa-sign-out">  </i></a> 
    </div>
    
    <hr>
    
    <div class="row">
    <c:forEach items="${product}" var="i">
        <div class="column1" >
        
            <f:form action="updateProduct.html" method="POST" enctype="multipart/form-data" modelAttribute="data">
            <div style="display: none">
            	<f:input type="text" path="productId"/>
            </div>
                <div>
                    <label for="name">Product Title</label>
                    <f:input type="text" id="name" value="" path="product_name" readonly="true" name="name" required=""></f:input>
                </div>
                <div>
                    <label for="name">Price</label>
                    <f:input type="text" id="price" placeholder="Enter the price of the product "
                           value="" path="price" name="price" required="true"></f:input>
                </div>
                <div>
                    <label for="quantity">Quantity</label>
                    <f:input type="number" id="quantity" min="1"  path="quantity" value="" name="quantity" placeholder="Enter the Quantity" required="true"></f:input>
                </div>
                <div>
                    <label for="desc">Product Description</label><br>
                    <f:textarea id="desc" name="desc" rows="3" cols="50" path="product_desc" placeholder="Provide a description of the product" style="resize: none;"></f:textarea>
                </div>
                <div>
                    <label for="Cat">Product Category : ${i.product_type}</label><br>
                    <f:select id="type" name="category" path="product_type">
                        <option value="Laptops">Laptops</option>
                        <option value="SmartPhones">SmartPhones</option>
                        <option value="Gadgets">Gadgets</option>
                        <option value="Television">SmartTV</option>
                    </f:select>
                </div>
                <div>
                    <button type="submit" class="button1">Submit</button>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="Inventory.html">Back to Inventory</a>    
                </div>
                
            </f:form>
           
        </div>
        
        <div class="column2">
            <img id="prd_img" src="data:image/jpeg;base64,${i.product_picAsBase64}" alt="${i.product_name}"
             width="300px" height="350px"/>
        </div>
        </c:forEach>
      </div>
      <script>
        function UpdateInv()
        {
            var name=$("#name").val();
            var price=$("#price").val();
            var quantity=$("#quantity").val();
            var desc=$("#desc").val();
            var category=$("#type").val();
            console.log(name,price,quantity,desc,category);
            var urlEnd="http://127.0.0.1:3000/updateProduct";
            $.ajax({
                    
                type:'post',
                url: urlEnd,
                dataType: 'json',
                contentType:'application/json',
                success: function(data,status){
                    alert("Product Updated Successfully");
                    window.location.href="/inventory"
                },
                error: function(status,jqXhr,textStatus){
                    
                    alert("Message: Error")
                },
                data: '{"name":"'+name+'","price":"'+price+'","desc":"'+desc+'","quantity":"'+quantity+'","category":"'+category+'"}'
            });
        }
        </script>
</body>
 
</html>