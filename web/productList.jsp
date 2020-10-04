<%-- 
    Document   : productList
    Created on : 18 Sep, 2020, 1:00:49 AM
    Author     : moin
--%>

<%@page import="com.shoestore.src.StoreConstants"%>
<%@page import="com.shoestore.model.Product"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
        
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="com.shoestore.src.DBConnection"%>
<%@page import="java.sql.Connection"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Product List Page</title>
         <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
          <link rel="stylesheet" href="css/store.css">
          <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">
  <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
          <link rel="stylesheet" href="css/store.css">
          <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.bundle.min.js" type="text/javascript"></script>
   <script src="js/store.js"></script>

  <link rel="stylesheet" href="css/store.css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
 <script src="js/store.js"></script>
 <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  <link rel="stylesheet" href="/resources/demos/style.css">
  <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
   <script>
  $( function() {
 
       var availableTags=[];  
        $.ajax({
		url: "SearchServlet",
		type: 'POST',
		dataType: 'json',
		//data: JSON.stringify(article),
		contentType: 'application/json',
		mimeType: 'application/json',
		error : function(e) {

                console.log("Error Occured",e);
            },
            success : function(data) {
                var receivedData = [];
               
                availableTags = data;
                 $( "#tags" ).autocomplete({
      source: availableTags
               });
              /**  $.each(data.jsonArray, function(index) {
                    $.each(data.jsonArray[index], function(key, value) {
                        var point = [];

                            point.push(key);
                            point.push(value);
                            receivedData.push(point);

                        }); 
                });**/

            }
	});
        
       console.log(availableTags);  
   
  } );
  </script> 

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

    
      
<style>
#product {
  font-family: "Trebuchet MS", Arial, Helvetica, sans-serif;
  border-collapse: collapse;
  width: 100%;
}

#product td, #customers th {
  border: 1px solid #ddd;
  padding: 8px;
}

#product tr:nth-child(even){background-color: #f2f2f2;}

#product tr:hover {background-color: #ddd;}

#product th {
  padding-top: 12px;
  padding-bottom: 12px;
  text-align: left;
  background-color: #4CAF50;
  color: white;
}
</style>


<script type="text/javascript">
/// some script

// jquery ready start
$(document).ready(function() {
	// jQuery code

	//////////////////////// Prevent closing from click inside dropdown
    $(document).on('click', '.dropdown-menu', function (e) {
      e.stopPropagation();
    });

    // make it as accordion for smaller screens
    if ($(window).width() < 992) {
	  	$('.dropdown-menu a').click(function(e){
	  		e.preventDefault();
	        if($(this).next('.submenu').length){
	        	$(this).next('.submenu').toggle();
	        }
	        $('.dropdown').on('hide.bs.dropdown', function () {
			   $(this).find('.submenu').hide();
			})
	  	});
	}
	
}); // jquery end
</script>

<style type="text/css">
	@media (min-width: 992px){
		.dropdown-menu .dropdown-toggle:after{
			border-top: .3em solid transparent;
		    border-right: 0;
		    border-bottom: .3em solid transparent;
		    border-left: .3em solid;
		}

		.dropdown-menu .dropdown-menu{
			margin-left:0; margin-right: 0;
		}

		.dropdown-menu li{
			position: relative;
		}
		.nav-item .submenu{ 
			display: none;
			position: absolute;
			left:100%; top:-7px;
		}
		.nav-item .submenu-left{ 
			right:100%; left:auto;
		}

		.dropdown-menu > li:hover{ background-color: #f1f1f1 }
		.dropdown-menu > li:hover > .submenu{
			display: block;
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
        
   <%if (((String) session.getAttribute("role"))!=null) {%>
   
   <%if (((String) session.getAttribute("role")).equals("ADMIN") ){%>      
        
<div class="topnav">
  <a class="active" href="index.jsp">Home</a>
  <a  id ="productList" href="productList.jsp" >Product List</a>
  <a id ="addProduct" href="admin.jsp">Add Product</a>
<a href="orderList.jsp">Orders</a>
  
  &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
           <form id="searchFRM" action="productList.jsp"  class="form-inline my-2 my-lg-0">
                <div class="input-group input-group-sm">
                    <input type="text" class="form-control" id="searchBtn" aria-label="Small" id="searchKW" name="searchKW" aria-describedby="inputGroup-sizing-sm" placeholder="Search...">
                    <div class="input-group-append">
                        <button type="button" id="searchBtn1" class="btn btn-secondary btn-number">
                            <i  class="fa fa-search"></i>
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

  <a class="navbar-brand" href="#"><img style="margin-top:-5%" height="240%" width="50%"src="images/logo.PNG"></a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#main_nav">
    <span class="navbar-toggler-icon"></span>
  </button>
  <div class="collapse navbar-collapse" id="main_nav">

<ul class="navbar-nav">
	<li class="nav-item active"> <a class="nav-link" href="#">Home </a> </li>
	<li class="nav-item"><a class="nav-link" href="index.jsp"> About </a></li>
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
                 <% if((Integer)session.getAttribute("cartItemCount")==0){ %>
      
        <div  id="login-alert" class="alert alert-danger col-sm-12"> You have  <%=(Integer)session.getAttribute("cartItemCount")%> Items in the cart!</div>
      <%} %>
                  <%} } else {%>
                  <div  id="login-alert" class="alert alert-success col-sm-12">Yor Session has Expeired <a href="login.jsp">Login</a></div>
                  
                  <% } %>
   
                <div id="productListPage" style="display:block">
                   
       
      <%  String category = request.getParameter("category");
        List<Product> products = new ArrayList<Product>();
        try {
          con = DBConnection.getDBConnection(); 
               st = null;
                rs = null;
             
        st= con.createStatement();
        if(request.getParameter("searchKW")!=null){
              rs =st.executeQuery("select * from shoestore.product where product_name='"+request.getParameter("searchKW")+"'");
        }else {
        rs =st.executeQuery("select * from shoestore.product");
        }
        
                    while(rs.next()){
                       Product prod = new Product();
                       prod.setCategory_name(rs.getString("category_name"));
                       prod.setSub_category_name(rs.getString("sub_category_name"));
                       prod.setPriceint(rs.getInt("price"));
                       prod.setQuantity(rs.getInt("quantity"));
                       prod.setImage(rs.getString("image"));
                       prod.setProduct_name(rs.getString("product_name"));
                       prod.setProduct_id(rs.getInt("product_id"));
                       products.add(prod);
                   }    
                    
                    System.out.println(products.size());
                 
      }catch(Exception e){
                           
                           e.getMessage();
                           
                   
               }
        
      %>  
      <% if((String)session.getAttribute("dbException")!=null){ %>
      
      <div  id="login-alert" class="alert alert-danger col-sm-12">   <%=(String)session.getAttribute("dbException")%></div>
      <%}%>
     
      <table id="product"> 
          
          <tr>  
          <th></th>
          <th>Product Name</th>
           <th>Product Price</th>
            <th>Product Quantity</th>
            <th>Category</th>
             <%if (((String) session.getAttribute("role")).equals("USER")){%>  
            
            <th>Add</th>
            <%}%>
              <%if (((String) session.getAttribute("role")).equals("ADMIN")){%>  
            
            <th> <i class="fa fa-edit">Edit</i></th>
               <th> <i class="fa fa-thrash">Delete</i></th>
            <%}%>
          </tr> 
          
       <%   for(Product product : products) { %>
        
       <tr><td><img height="30%" width="15%" src ="<%=StoreConstants.IMAGE_RELATIVE_PATH%>/<%=product.getImage()%>"></td>
        <td><%=product.getProduct_name()%></td>
            <td><%=product.getPriceint()%></td>
               <td><%=product.getQuantity()%></td>
             <td><%=product.getCategory_name()%></td>
             
                 <%if (((String) session.getAttribute("role")).equals("USER")){%>  
            
                 <th><a href="productDetail.jsp?prodId=<%=product.getProduct_id()%>&event=prodDetail" class="btn btn-primary">Product Detail</a></th>
            <%}%>
                 
                  <%if (((String) session.getAttribute("role")).equals("ADMIN")){%>  
            
                  <th><a href="editProduct.jsp?prodId=<%=product.getProduct_id()%>" class="btn btn-primary"><span class="fa fa-edit">Edit</i></a></th>
                  <th><a href="deleteProduct.jsp?prodId=<%=product.getProduct_id()%>" class="btn btn-danger"><span class="fa fa-thrash">Delete</i></a></th>
            <%}%>
       
       </tr>
             
          <%}%>
          
      </table>
                </div>   
    
    
    
</div>
<%} %>
    </body>
</html>
