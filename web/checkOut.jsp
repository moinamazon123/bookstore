<%-- 
    Document   : productDetail.jsp
    Created on : 18 Sep, 2020, 9:31:20 AM
    Author     : moin
--%>

<%@page import="com.shoestore.util.DateUtil"%>
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
body {
  font-family: Arial;
  font-size: 17px;
  padding: 8px;
}

* {
  box-sizing: border-box;
}

.row {
  display: -ms-flexbox; /* IE10 */
  display: flex;
  -ms-flex-wrap: wrap; /* IE10 */
  flex-wrap: wrap;
  margin: 0 -16px;
}

.col-25 {
  -ms-flex: 25%; /* IE10 */
  flex: 25%;
}

.col-50 {
  -ms-flex: 50%; /* IE10 */
  flex: 50%;
}

.col-75 {
  -ms-flex: 75%; /* IE10 */
  flex: 75%;
}

.col-25,
.col-50,
.col-75 {
  padding: 0 16px;
}

.container {
  background-color: #f2f2f2;
  padding: 5px 20px 15px 20px;
  border: 1px solid lightgrey;
  border-radius: 3px;
}

input[type=text] {
  width: 100%;
  margin-bottom: 20px;
  padding: 12px;
  border: 1px solid #ccc;
  border-radius: 3px;
}

label {
  margin-bottom: 10px;
  display: block;
}

.icon-container {
  margin-bottom: 20px;
  padding: 7px 0;
  font-size: 24px;
}



a {
  color: #2196F3;
}

hr {
  border: 1px solid lightgrey;
}

span.price {
  float: right;
  color: grey;
}

/* Responsive layout - when the screen is less than 800px wide, make the two columns stack on top of each other instead of next to each other (also change the direction - make the "cart" column go on top) */
@media (max-width: 800px) {
  .row {
    flex-direction: column-reverse;
  }
  .col-25 {
    margin-bottom: 20px;
  }
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
        <li class="nav-item"><a class="nav-link" href="#"> Cart </a></li>
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
<% } %>
<h2> Checkout Form</h2>
<p>Resize the browser window to see the effect. When the screen is less than 800px wide, make the two columns stack on top of each other instead of next to each other.</p>
<div class="row">
  <div class="col-75">
    <div class="container">
      <form action="/orderSummary.jsp">
      
        <div class="row">
          <div class="col-50">
            <h3>Billing Address</h3>
            <label for="fname"><i class="fa fa-user"></i> Full Name</label>
            <input type="text" id="fname" name="firstname" placeholder="John M. Doe">
            <label for="email"><i class="fa fa-envelope"></i> Email</label>
            <input type="text" id="email" name="email" placeholder="john@example.com">
            <label for="adr"><i class="fa fa-address-card-o"></i> Address</label>
            <input type="text" id="adr" name="address" placeholder="542 W. 15th Street">
            <label for="city"><i class="fa fa-institution"></i> City</label>
            <input type="text" id="city" name="city" placeholder="New York">

            <div class="row">
              <div class="col-50">
                <label for="state">State</label>
                <input type="text" id="state" name="state" placeholder="NY">
              </div>
              <div class="col-50">
                <label for="zip">Zip</label>
                <input type="text" id="zip" name="zip" placeholder="10001">
              </div>
            </div>
          </div>

          <div class="col-50">
            <h3>Payment</h3>
            <label for="fname">Accepted Cards</label>
            <div class="icon-container">
              <i class="fa fa-cc-visa" style="color:navy;"></i>
              <i class="fa fa-cc-amex" style="color:blue;"></i>
              <i class="fa fa-cc-mastercard" style="color:red;"></i>
              <i class="fa fa-cc-discover" style="color:orange;"></i>
            </div>
            <label for="cname">Name on Card</label>
            <input type="text" id="cname" name="cardname" placeholder="John More Doe">
            <label for="ccnum">Credit card number</label>
            <input type="text" id="ccnum" name="cardnumber" placeholder="1111-2222-3333-4444">
            <label for="expmonth">Exp Month</label>
            <input type="text" id="expmonth" name="expmonth" placeholder="September">
            <div class="row">
              <div class="col-50">
                <label for="expyear">Exp Year</label>
                <input type="text" id="expyear" name="expyear" placeholder="2018">
              </div>
              <div class="col-50">
                <label for="cvv">CVV</label>
                <input type="text" id="cvv" name="cvv" placeholder="352">
              </div>
            </div>
          </div>
          
        </div>
        <label>
          <input type="checkbox" checked="checked" name="sameadr"> Shipping address same as billing
        </label>
      <button class="btn btn-primary btn-lg btn-block" type="button"><a style="color: white"  href="orderSummary.jsp">Continue to Checkout</a></button> 
      </form>
    </div>
  </div>
  <div class="col-25">
    <div class="container">
      <h4>Cart <span class="price" style="color:black"><i class="fa fa-shopping-cart"></i> <b><%= (Integer)session.getAttribute("cartItemCount")%></b></span></h4>
    
      <% List<Cart> cartItemList = (List<Cart>)session.getAttribute("cartItemList");
      
      for(Cart cartItem :cartItemList ) {
      %>
      
      <p><a href="productDetail.jsp?prodId=<%=cartItem.getProduct_id()%>&event=editCart"><%=cartItem.getProduct_id()%></a> <span style="margin-left: -50%;" class="price"><%=cartItem.getPriceint() * cartItem.getQuantity()%></span></p>
      
      <%}%>
      <hr>
      <p>Total <span class="price" style="color:black"><b><%=(Integer)session.getAttribute("totalOrderValue")%></b></span></p>
    </div>
  </div>
</div>
<%  }%>
</body>
</html>
