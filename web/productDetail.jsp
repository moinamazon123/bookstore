<%-- 
    Document   : productDetail.jsp
    Created on : 18 Sep, 2020, 9:31:20 AM
    Author     : moin
--%>

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
                <a class="btn btn-success btn-sm ml-3" href="cartPage.jsp?prodId=<%=request.getParameter("prodId")%>"
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
                      Product prod = null;
                          Cart cart = null;
        
                          
       if( request.getParameter("event").equals("prodDetail")) {
                                
          try {     
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
           
          }catch(Exception e){
                           
                          System.out.println( e.getMessage());
                           
                   
               }
          
       }
                  if(request.getParameter("event").equals("editCart")){
                       
                try {      
                    
                st= con.createStatement();
        rs =st.executeQuery("select * ,SUM(quantity) as totQuantity from shoestore.cart where user_id="+(Integer)session.getAttribute("userId") +" and product_id='"+request.getParameter("prodId")+"' group by product_id ");
        
                    while(rs.next()){     
                    
                       cart = new Cart();
                       cart.setPriceint(rs.getInt("price"));
                        
                       cart.setQuantity(rs.getInt("totQuantity"));
                       cart.setProduct_id(rs.getInt("product_id"));
                       cart.setUsert_id(rs.getInt("user_id"));
                       cart.setTotalValue(rs.getInt("totalValue"));
                      
                         System.out.println(" While Product Id "+rs.getInt("user_id")) ; 
                   }  
               /** To Fetch Product details for Edit cart page **/
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
           
                       
                       
                   } catch(Exception e){
                           
                          System.out.println( e.getMessage());
                           
                   
               }
                  }      
    
      %>  
 
    
      
      <%if(request.getParameter("msg")!=null) {%>
      
      <div  id="login-alert" class="alert alert-success col-sm-12">  <%=request.getParameter("msg")%> </div>
      
      <%} %>
	<div class="container">
		<div class="card">
			<div class="container-fliud">
				<div class="wrapper row">
					<div class="preview col-md-6">
					<form name="prodDetailFrm" method="GET" action="addToCart.jsp"	id="prodDetailFrm">
						<div class="preview-pic tab-content">
						  <div class="tab-pane active" id="pic-1"><img src="<%=StoreConstants.IMAGE_RELATIVE_PATH%>/<%=prod.getImage()%>" /></div>
						  <div class="tab-pane" id="pic-2"><img src="http://placekitten.com/400/252" /></div>
						  <div class="tab-pane" id="pic-3"><img src="http://placekitten.com/400/252" /></div>
						  <div class="tab-pane" id="pic-4"><img src="http://placekitten.com/400/252" /></div>
						  <div class="tab-pane" id="pic-5"><img src="http://placekitten.com/400/252" /></div>
						</div>
						<ul class="preview-thumbnail nav nav-tabs">
						  <li class="active"><a data-target="#pic-1" data-toggle="tab"><img src="<%=StoreConstants.IMAGE_RELATIVE_PATH%>/<%=prod.getImage()%>" /></a></li>
						  <li><a data-target="#pic-2" data-toggle="tab"><img src="<%=StoreConstants.IMAGE_RELATIVE_PATH%>/<%=prod.getImage()%>" /></a></li>
						  <li><a data-target="#pic-3" data-toggle="tab"><img src="<%=StoreConstants.IMAGE_RELATIVE_PATH%>/<%=prod.getImage()%>" /></a></li>
						  <li><a data-target="#pic-4" data-toggle="tab"><img src="<%=StoreConstants.IMAGE_RELATIVE_PATH%>/<%=prod.getImage()%>" /></a></li>
						  <li><a data-target="#pic-5" data-toggle="tab"><img src="<%=StoreConstants.IMAGE_RELATIVE_PATH%>/<%=prod.getImage()%>" /></a></li>
						</ul>
						
					</div>
					<div class="details col-md-6">
						<h3 class="product-title"><%=prod.getProduct_name()%></h3>
						<div class="rating">
							<div class="stars">
								<span class="fa fa-star checked"></span>
								<span class="fa fa-star checked"></span>
								<span class="fa fa-star checked"></span>
								<span class="fa fa-star"></span>
								<span class="fa fa-star"></span>
							</div>
							<span class="review-no">41 reviews</span>
						</div>
						<p class="product-description"><%=prod.getDesc()!=null?prod.getDesc():"Description Not Set"%>.</p>
						<h4 class="price">current price: <span><%=prod.getPriceint()%></span></h4>
                                            
                                                <input type="hidden" name="productIdHidden" value=<%=prod.getProduct_id()%>>
                                                       <input type="hidden" name="productPriceHidden" value=<%=prod.getPriceint()%>>
                                                         <h4 class="price">current Quantity <span><%=prod.getQuantity()%></span></h4>
                                                    <%   if(request.getParameter("event").equals("prodDetail")){ %>  
                                                     <input type="hidden" name="event" value="prodDetail">
                                                <h4 class="price">  Enter Quantity: <input type="text"  size="3" name="quantity"></h4>
                                               <% } else { %>
                                                  <input type="hidden" name="event" value="editCartItem">
                                                    <input type="hidden" name="cartId" value=<%=cart.getCart_id()%>>
                                                 <h4 class="price">  Enter Quantity: <input type="text" value=<%=cart.getQuantity()!=0?cart.getQuantity():0%> size="3" name="editquantity"></h4>
                                                <%} %> 
						<p class="vote"><strong>91%</strong> of buyers enjoyed this product! <strong>(87 votes)</strong></p>
						<h5 class="sizes">sizes:
							<span class="size" data-toggle="tooltip" title="small"> <%=prod.getSize()%>  </span>
							<!-- <span class="size" data-toggle="tooltip" title="medium">m</span>
							<span class="size" data-toggle="tooltip" title="large">l</span>
							<span class="size" data-toggle="tooltip" title="xtra large">xl</span>-->
						</h5>
                                                       
						<!--<h5 class="colors">colors:
							<span class="color orange not-available" data-toggle="tooltip" title="Not In store"></span>
							<span class="color green"></span>
							<span class="color blue"></span>
						</h5>-->
						<div class="action">
							<button class="add-to-cart btn btn-default" type="submit">add to cart</button>
							<!--<button class="like btn btn-default" type="button"><span class="fa fa-heart"></span></button>-->
						</div>
                                        </form>
					</div>
				</div>
			</div>
		</div>
	</div>
                                                  
     
   <% } %>

  </body>
</html>
