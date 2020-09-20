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
                  <%}%>
   
      
      
	
        <%
             con = DBConnection.getDBConnection(); 
               st = null;
                rs = null;
                      Cart cart = null;
                      List<Cart> cartList = new ArrayList<Cart>();
          try {     
                st= con.createStatement();
        rs =st.executeQuery("select * , SUM(quantity) as totQuantity from shoestore.cart where user_id="+(Integer)session.getAttribute("userId")+" group by product_id");
        
                    while(rs.next()){
                        
                    
                       cart = new Cart();
                       cart.setPriceint(rs.getInt("price"));
                        
                       cart.setQuantity(rs.getInt("totQuantity"));
                       cart.setProduct_id(rs.getInt("product_id"));
                       cart.setUsert_id(rs.getInt("user_id"));
                       cart.setTotalValue(rs.getInt("totalValue"));
                       cart.setCart_id(rs.getInt("cart_id"));
                       cartList.add(cart);
                         System.out.println(" While Product Id "+rs.getInt("user_id")) ; 
                   }  
                    
                    
                    
             System.out.println("Product Id "+request.getParameter("prodId")+cartList.size()) ;      
          System.out.println(" Query "+cartList.size());
                 
             System.out.println("Login User Id "+(Integer)session.getAttribute("userId")) ;     

 st= con.createStatement();
        rs =st.executeQuery("select SUM(totalValue) as totalOrderValue from  shoestore.cart where user_id="+(Integer)session.getAttribute("userId"));
        int totalOrderValue=0;
                    while(rs.next()){
                        totalOrderValue = rs.getInt("totalOrderValue");
                    }
                    
              session.setAttribute("cartItemList", cartList);
                  session.setAttribute("totalOrderValue", totalOrderValue);
              
    
      %>  
 
    
      
      <%if(request.getParameter("msg")!=null) {%>
      
      <%=request.getParameter("msg")%> 
      
      <%} %>
	<div class="container">
		<div class="card">
			<div class="container-fliud">
                            
                            <table style="border-style: solid" id="product" >
                                
                                <tr>
                                     <th></th>
                                    <th>Product Id</th>
                                    <th> Product Price</th>
                                         <th>Quantity</th>
                                         <th>Total</th>
                                         <th></th>
                                          <th>Action &nbsp;</th>
                                    
                                    
                                </tr>
                                
                       <% for(Cart cartObj: cartList)     { %>
                       
                       <tr>
                           <%  
                               String image = DateUtil.getProdImage(cartObj.getProduct_id());
                               
                               %>
                           
                           <td><img height="20%" width="20%" src="<%=StoreConstants.IMAGE_RELATIVE_PATH%>/<%=image%>" /></td>
                           <td><%=cartObj.getProduct_id()%></td>
                             <td><%=cartObj.getPriceint()%></td>
                                   <td><%=cartObj.getQuantity()%></td>
                                    <td><%=cartObj.getQuantity() * cartObj.getPriceint() %></td>
                                    <td>  <button class="btn btn-primary" type="submit"><a style="color: white"  href="productDetail.jsp?prodId=<%=cartObj.getProduct_id()%>&event=editCart&cartId=<%=cartObj.getCart_id()%>">Edit</a></button> </td>
                                    <td>      <button class="btn btn-danger" type="submit"><a style="color: white"  href="deleteCart.jsp?cartId=<%=cartObj.getCart_id()%>">Remove</a></button> </td> 
                                   </tr>
                       
                       
                       
                       <%     }%>
                                
                       <tr><td> Total Order Value: </td><td></td><td></td><td></td><td></td><td></td><td><%=totalOrderValue%></td></tr>       
                            </table>          
                            
                       <button class="btn btn-primary btn-lg btn-block" type="submit"><a style="color: white"  href="checkOut.jsp">Continue to Payment</a></button>              
				
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
