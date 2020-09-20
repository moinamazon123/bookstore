<%-- 
    Document   : editProduct
    Created on : 18 Sep, 2020, 2:21:11 PM
    Author     : moin
--%>

<%@page import="java.sql.PreparedStatement"%>
<%@page import="com.shoestore.src.StoreConstants"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="com.shoestore.src.DBConnection"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.shoestore.model.Product"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    <script src="https://code.jquery.com/jquery-2.2.4.min.js" integrity="sha256-BbhdlvQf/xTY9gja0Dq3HiwQF8LaCRTXxZKRutelT44="
crossorigin="anonymous"></script>

<!-- Bootstrap files (jQuery first, then Popper.js, then Bootstrap JS) -->
<link href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.bundle.min.js" type="text/javascript"></script>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
          <script src="https://code.jquery.com/jquery-2.2.4.min.js" integrity="sha256-BbhdlvQf/xTY9gja0Dq3HiwQF8LaCRTXxZKRutelT44="
crossorigin="anonymous"></script>
 <script src="js/store.js"></script>
    
        <style>
* {
  box-sizing: border-box;
}

input[type=text], select, textarea {
  width: 100%;
  padding: 12px;
  border: 1px solid #ccc;
  border-radius: 4px;
  resize: vertical;
}

label {
  padding: 12px 12px 12px 0;
  display: inline-block;
}

input[type=submit] {
  background-color: #4CAF50;
  color: white;
  padding: 12px 20px;
  border: none;
  border-radius: 4px;
  cursor: pointer;
  float: right;
}

input[type=submit]:hover {
  background-color: #45a049;
}

.container {
  border-radius: 5px;
  background-color: #f2f2f2;
  padding: 20px;
}

.col-25 {
  float: left;
  width: 25%;
  margin-top: 6px;
}

.col-75 {
  float: left;
  width: 75%;
  margin-top: 6px;
}

/* Clear floats after the columns */
.row:after {
  content: "";
  display: table;
  clear: both;
}

/* Responsive layout - when the screen is less than 600px wide, make the two columns stack on top of each other instead of next to each other */
@media screen and (max-width: 600px) {
  .col-25, .col-75, input[type=submit] {
    width: 100%;
    margin-top: 0;
  }
}
</style>
<style>
body {
  margin: 0;
  font-family: Arial, Helvetica, sans-serif;
}

.topnav {
  overflow: hidden;
  background-color: #333;
}

.topnav a {
  float: left;
  color: #f2f2f2;
  text-align: center;
  padding: 14px 16px;
  text-decoration: none;
  font-size: 17px;
}

.topnav a:hover {
  background-color: #ddd;
  color: black;
}

.topnav a.active {
  background-color: #4CAF50;
  color: white;
}
</style>

</head>
<body>

     <% if ((Integer)session.getAttribute("userId")==null) { %>
      <div  id="login-alert" class="alert alert-danger col-sm-12"> Session Expired! <a href="login.jsp">Login</a></div>
        <%} else { %>    
    
<div class="topnav">
  <a class="active" href="#home">Home</a>
  <a  id ="productList" href="productList.jsp" >Product List</a>
  <a id ="addProduct" href="admin.jsp">Add Product</a>
  <a href="orderList.jsp">Orders</a>
  
  &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
            <form class="form-inline my-2 my-lg-0">
                <div class="input-group input-group-sm">
                    <input type="text" class="form-control" aria-label="Small" aria-describedby="inputGroup-sizing-sm" placeholder="Search...">
                    <div class="input-group-append">
                        <button type="button" class="btn btn-secondary btn-number">
                            <i class="fa fa-search"></i>
                        </button>
                    </div>
                </div>
             
           
                
            </form>
  
</div>

      <a style="margin-left: 90%;margin-top: -13%" href="signout.jsp">
                    <i class="fa fa-sign-out"></i> Log Out
                 
                </a> 
   
    
<div style="padding-left:16px">

    <div id="addProductPage" style="display:block">
        
      


<h2>Edit Product for <%=request.getParameter("prodId")%></h2>
 <% if(request.getParameter("msg")!=null){ %>
                <div  id="login-alert" class="alert alert-success col-sm-12"><%=request.getParameter("msg")%></div>
                
                <%} %>
                
                
                <%
                      Connection con = DBConnection.getDBConnection(); 
              Statement st = null;
               ResultSet rs = null;   
                      Product prod = null;
      
                      try {     
                con = DBConnection.getDBConnection(); 
                st= con.createStatement();
        rs =st.executeQuery("select * from shoestore.product where product_id='"+request.getParameter("prodId")+"'");
        
                    while(rs.next()){
                        prod = new Product();
                       prod.setCategory_name(rs.getString("category_name"));
                       prod.setSub_category_name(rs.getString("sub_category_name"));
                       prod.setPriceint(rs.getInt("price"));
                       prod.setQuantity(rs.getInt("quantity"));
                       prod.setImage(rs.getString("image"));
                       prod.setSize(rs.getString("size"));
                       prod.setProduct_name(rs.getString("product_name"));
                       prod.setProduct_id(rs.getInt("product_id"));
                       prod.setDesc(rs.getString("prod_desc"));
                     
                   }    
                    System.out.println(prod.getDesc());
                 
              
          }catch(Exception e) {
              
              System.out.println(e.getMessage());
          }   
                    
                    %>

                      <% if((String)session.getAttribute("editdbException")!=null){ %>
      
      <div  id="login-alert" class="alert alert-danger col-sm-12">   <%=(String)session.getAttribute("editdbException")%></div>
      <%}%>
                    
<div class="container">
  <form  id="editProdFrm" method="post" enctype="multipart/form-data" >
      <input value=<%=request.getParameter("prodId")%>  id="proId" name="prodId" type="hidden">
    <div class="row">
      <div class="col-25">
        <label for="fname">Product Name</label>
      </div>
      <div class="col-75">
        <input type="text" id="prodname" value=<%=prod.getProduct_name()%> name="prodname" placeholder="Product name..">
      </div>
    </div>
         <div class="row">
      <div class="col-25">
        <label for="fname">Product Price</label>
      </div>
      <div class="col-75">
        <input type="text" id="prodprice" name="prodprice" value=<%=prod.getPriceint()%> placeholder="Product Price..">
      </div>
    </div>
      
    <div class="row">
      <div class="col-25">
        <label for="lname">Product Description</label>
      </div>
      <div class="col-75">
          <textarea id="proddesc" name="proddesc" placeholder="Product description.."><%=prod.getDesc()%></textarea>
      </div>
    </div>
    <div class="row">
      <div class="col-25">
        <label for="country">Size</label>
      </div>
      <div class="col-75">
        <select id="shoesize" name="shoesize">
            <% if(prod.getSize()!=null) { %>
               <option selected value="M"><%=prod.getSize()%></option>
               <%}%>
          <option value="M">Medium</option>
          <option value="L">Large</option>
          <option value="XL">XLarge</option>
           <option value="8">8</option>
          <option value="9">9</option>
          <option value="10">10</option>
        </select>
      </div>
    </div>
      
       <div class="row">
      <div class="col-25">
        <label for="quantity">Quantity</label>
      </div>
      <div class="col-75">
        <select id="quantity" name="quantity">
              <% if(prod.getQuantity()!=0) { %>
               <option selected value="M"><%=prod.getQuantity()%></option>
               <%}%>
          <option value="10">10</option>
          <option value="20">20</option>
          <option value="30">30</option>
            <option value="50">50</option>
            <option value="100">100</option>
          <option value="200">200</option>
          
        </select>
      </div>
    </div>
      
      
       <div class="row">
      <div class="col-25">
        <label for="category">Category</label>
      </div>
      <div class="col-75">
        <select id="category" name="category">
              <% if(prod.getCategory_name()!=null) { %>
               <option selected value="M"><%=prod.getCategory_name()%></option>
               <%}%>
          <option value="Men">Men</option>
          <option value="Women">Women</option>
          <option value="Kid">Kid</option>
          
        </select>
      </div>
    </div>
        <div class="row">
      <div class="col-25">
        <label for="subcategory">Sub -Category</label>
      </div>
      <div class="col-75">
        <select id="subcategory" name="subcategory">
             <% if(prod.getSub_category_name()!=null) { %>
               <option selected value="M"><%=prod.getSub_category_name()%></option>
               <%}%>
          <option value="Casuals">Casuals</option>
          <option value="Loafers">Loafers</option>
          <option value="Formals">Formals</option>
           <option value="Casuals">Sandal</option>
          <option value="Loafers">Boots</option>
          <option value="Formals">Sneakers</option>
          
        </select>
      </div>
    </div>
   
      <div class="row">
         
      <div class="col-25">
        <label for="lname">Product Image</label>
      </div>
      <div class="col-75">
          <input type="file" id="image_file" name=fname">
          <%if(prod.getImage()!=null){ %>
          <%=prod.getImage()%>
          <%}%>
      </div>
                 
      
    </div>
    

    <div class="row">
      <input type="submit" id="editProdSubmit" value="Submit">
    </div>
  </form>
</div>

        
        
        
        
    </div>
<% } %>    

</body>
</html>
