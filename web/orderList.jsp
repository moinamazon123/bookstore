<%-- 
    Document   : productDetail.jsp
    Created on : 18 Sep, 2020, 9:31:20 AM
    Author     : moin
--%>

<%@page import="com.shoestore.model.Order"%>
<%@page import="com.shoestore.model.Cart"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.shoestore.src.StoreConstants"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="com.shoestore.src.DBConnection"%>
<%@page import="com.shoestore.model.Product"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<!------ Include the above in your HEAD tag ---------->

<!DOCTYPE html>
<html lang="en">
  <head>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
          <link rel="stylesheet" href="css/store.css">
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.bundle.min.js" type="text/javascript"></script>


  <link rel="stylesheet" href="css/store.css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>


<!------ Include the above in your HEAD tag ---------->

<!DOCTYPE html>
<html lang="en">
  <head>
    
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>eCommerce Product Detail</title>
    <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Open+Sans:400,700" rel="stylesheet">
    
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
             <%
            Connection con = DBConnection.getDBConnection(); 
              Statement st = null;
               ResultSet rs = null;
            
                 %>
      
       <%if (((String) session.getAttribute("role")).equals("ADMIN")){%>      
        
<div class="topnav">
  <a class="active" href="#home">Home</a>
  <a  id ="productList" href="productList.jsp" >Product List</a>
  <a id ="addProduct" href="admin.jsp">Add Product</a>
  <a href="#about">Orders</a>
  
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
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
  <% } else { %>      
   <!-- Section For JSP -->
    
    <%
             con = DBConnection.getDBConnection(); 
               st = null;
                rs = null;
               List<String> categoryList = new ArrayList<String>();
               try{
                   st = con.createStatement();
                   rs = st.executeQuery("select distinct(category_name)  FROM shoestore.category");
                   while(rs.next()){
                       
                       categoryList.add(rs.getString(1));
                       
                   }    
                 
      }catch(Exception e){
                           
                           e.getMessage();
                           
                   
               }
        
        
        %>


<nav class="navbar navbar-expand-lg navbar-dark bg-primary">

  <a class="navbar-brand" href="#">Shoe Store</a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#main_nav">
    <span class="navbar-toggler-icon"></span>
  </button>
  <div class="collapse navbar-collapse" id="main_nav">

<ul class="navbar-nav">
	<li class="nav-item active"> <a class="nav-link" href="#">Home </a> </li>
	<li class="nav-item"><a class="nav-link" href="#"> About </a></li>
        <li class="nav-item"><a class="nav-link" href="productList.jsp"> Product </a></li>
        <li class="nav-item"><a class="nav-link" href="addToCart.jsp"> Cart </a></li>
	<li class="nav-item dropdown">
		<a class="nav-link dropdown-toggle" href="#" data-toggle="dropdown">  Categories  </a>
	    <ul class="dropdown-menu">
		<% for(String category : categoryList ){ %>
		  <li><a class="dropdown-item" href="category.jsp?category=<%=category%>"> <%=category%> </a>
                      
                      <% st= con.createStatement();rs =st.executeQuery("select sub_category_name FROM shoestore.category where category_name= '"+category+"'");
                      %>
		  	 <ul class="submenu dropdown-menu">
                             <% while(rs.next()) { %>
                             <li><a class="dropdown-item" href="subcategory.jsp?category=<%=category%>&subcat=<%=rs.getString(1)%>"><%=rs.getString(1)%></a></li>
			    
                            <%}%>
			   
			 </ul>
		  </li>
                  <%}%>
                    
		
	    </ul>
	</li>
	
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
                <a class="btn btn-success btn-sm ml-3" href="cartPage.jsp">
                    <i class="fa fa-shopping-cart"></i> Cart
                    <span class="badge badge-light"><%=(Integer)session.getAttribute("cartItemCount")%></span>
                </a>
             
                  <a class="btn btn-success btn-sm ml-3" href="signout.jsp">
                    <i class="fa fa-sign-out"></i> Log Out
                 
                </a>
            </form>
        
</ul>



  </div> <!-- navbar-collapse.// -->

</nav>
                  <%}%>
   
      
      
	
        <%
             con = DBConnection.getDBConnection(); 
               st = null;
                rs = null;
                      Order  order = null;
                      List<Order> orderList = new ArrayList<Order>();
          try {     
                st= con.createStatement();
        rs =st.executeQuery("select * from shoestore.order order by order_id ASC");
        
                    while(rs.next()){
                        
                    
                       order = new Order();
                      order.setOrder_id(rs.getInt("order_id"));
                      order.setOrder_status(rs.getString("order_status"));
                      order.setOrder_value(rs.getInt("order_value"));
                      order.setOrder_date(rs.getString("order_date"));
                      order.setUser_id(rs.getInt("user_id"));
                     orderList.add(order);
                   }    
           
          System.out.println(" Order Count "+orderList.size());
                 
             System.out.println("Login User Id "+(Integer)session.getAttribute("userId")) ;     

 
              session.setAttribute("orderList", orderList);
                
              
    
      %>  
 
    
      
      <%if(request.getParameter("msg")!=null) {%>
      
      <%=request.getParameter("msg")%> 
      
      <%} %>
	<div class="container">
		<div class="card">
			<div class="container-fliud">
                            
                            <table id="product" >
                                
                                <tr>
                                    <th>Order Id</th>
                                    <th> Order Value</th>
                                    <th>Status</th>
                                    <th>User Id</th>
                                    <th>Order Date</th>
                                  
                                    
                                    
                                </tr>
                                
                       <% for(Order orderObj:orderList)     { 
                       
                       %>
                       
                       <tr>
                           <td><%=orderObj.getOrder_id()%></td>
                           <td><%=orderObj.getOrder_value()%></td>
                                   <td><%=orderObj.getOrder_status()%></td>
                                      <td><%=orderObj.getUser_id()%></td>
                                        <td><%=orderObj.getOrder_date()%></td>
                                   
                                   </tr>
                       
                       
                       
                       <%}%>
                                
                          
                            </table>          
                            
                                     
				
			</div>
		</div>
	</div>
                                                  
     
   
   <%
                                                      
             
      }catch(Exception e){
                           
                           System.out.println(e.getMessage());
                           
                   
               }
        
                                                      %>
                                                      <% } %>
  </body>
</html>

