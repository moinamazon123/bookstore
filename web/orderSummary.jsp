<%-- 
    Document   : orderSummary
    Created on : 18 Sep, 2020, 12:34:34 PM
    Author     : moin
--%>

<%@page import="com.shoestore.util.DateUtil"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="com.shoestore.model.Cart"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="com.shoestore.src.DBConnection"%>
<%@page import="java.sql.Connection"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="keywords" content="htmlcss bootstrap menu, navbar, mega menu examples" />
<meta name="description" content="Navigation  menu with submenu examples for any type of project, Bootstrap 4" />  

<title>Shoe Store Product Listing Page </title>

<!-- jQuery -->
<script src="https://code.jquery.com/jquery-2.2.4.min.js" integrity="sha256-BbhdlvQf/xTY9gja0Dq3HiwQF8LaCRTXxZKRutelT44="
crossorigin="anonymous"></script>

<!-- Bootstrap files (jQuery first, then Popper.js, then Bootstrap JS) -->
<link href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.bundle.min.js" type="text/javascript"></script>

<link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>


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
<body class="bg-light">

<header class="section-header py-4">
<div class="container">
    <h2>Welcome to Shoe Store !.</h2>
    Welcome Mr <h4> <%=(String)session.getAttribute("loginUser")%></h4>
</div>
</header> <!-- section-header.// -->

<!-- ========================= SECTION CONTENT ========================= -->

<div class="container">
    
    <!-- Section For JSP -->
    
    <%
         
        Connection con = DBConnection.getDBConnection(); 
              Statement st = null;
               ResultSet rs = null;
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



    <body>
        
         <%
             con = DBConnection.getDBConnection(); 
               st = null;
                rs = null;
               

                PreparedStatement preparedStmt = null;
            
            try {  
                con = DBConnection.getDBConnection();
               System.out.println("Connection successful");
 String query = " insert into shoestore.order (order_value, order_status, order_date, user_id,delivery_date)"
        + " values (?, ?, ?, ? ,?)";
  int userId =0;
      // create the mysql insert preparedstatement
       preparedStmt = con.prepareStatement(query);
      preparedStmt.setInt (1,(Integer)session.getAttribute("totalOrderValue"));
      preparedStmt.setString (2, "Pending");
      preparedStmt.setString   (3,DateUtil.getOrderDate());
      preparedStmt.setInt(4, (Integer)session.getAttribute("userId"));
         preparedStmt.setString(5, DateUtil.getDeliverDate());
       preparedStmt.execute();
 System.out.println(" Order add successful");
    
 /** Delete Cart Items **/
 System.out.println("Creating statement...");
      st = con.createStatement();
      String sql = "DELETE FROM cart " +
                   "WHERE user_id ="+(Integer)session.getAttribute("userId");
      st.executeUpdate(sql);
 
session.removeAttribute("cartIttemCount");
        } catch(Exception e){
           System.out.println( e.getMessage());
        }





               %>
        
   <%if (((String) session.getAttribute("role")).equals("ADMIN")){%>      
        
<div class="topnav">
  <a class="active" href="index.jsp">Home</a>
  <a  id ="productList" href="productList.jsp" >Product List</a>
  <a id ="addProduct" href="admin.jsp">Add Product</a>
  <a href="#about">Orders</a>
  
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
  <% } else { %>      
   <!-- Section For JSP -->
    
    <%
             con = DBConnection.getDBConnection(); 
               st = null;
                rs = null;
               List<String> categoryList1 = new ArrayList<String>();
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
	<li class="nav-item active"> <a class="nav-link" href="index.jsp">Home </a> </li>
	<li class="nav-item"><a class="nav-link" href="#"> About </a></li>
        <li class="nav-item"><a class="nav-link" href="productList.jsp"> Product </a></li>
        <li class="nav-item"><a class="nav-link" href="addToCart.jsp"> Cart </a></li>
	<li class="nav-item dropdown">
		<a class="nav-link dropdown-toggle" href="#" data-toggle="dropdown">  Categories  </a>
	    <ul class="dropdown-menu">
		<% for(String category : categoryList1 ){ %>
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
               
             
                  <a class="btn btn-success btn-sm ml-3" href="signout.jsp">
                    <i class="fa fa-sign-out"></i> Log Out
                 
                </a>
            </form>
        
</ul>



  </div> <!-- navbar-collapse.// -->

</nav>
                  <%}%>

<h2>Order Summary Page</h2>

<div class="row">
  <div class="col-75">
    <div class="container">
        Thanks For Your Order for Order Value <%=(Integer)session.getAttribute("totalOrderValue")%> Your order date <%=DateUtil.getOrderDate()%> your expected delivery date <%=DateUtil.getDeliverDate()%>
</html>
