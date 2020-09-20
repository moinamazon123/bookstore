<%-- 
    Document   : searchACtion
    Created on : 18 Sep, 2020, 3:18:13 PM
    Author     : moin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@page import="com.shoestore.src.StoreConstants"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="com.shoestore.src.DBConnection"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.shoestore.model.Product"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
          <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
          <link rel="stylesheet" href="css/store.css">
          <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.bundle.min.js" type="text/javascript"></script>
   <script src="js/store.js"></script>

  <link rel="stylesheet" href="css/store.css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
        
    </head>
    <body>
        <%
            
            String category = request.getParameter("category");
        List<Product> products = new ArrayList<Product>();
        try {
            Connection con = DBConnection.getDBConnection(); 
              Statement st = null;
               ResultSet rs = null;   
                      Product prod = null;
        st= con.createStatement();
        rs =st.executeQuery("select * from shoestore.product where product_name ="+request.getParameter("searchKW")+"'");
        
                    while(rs.next()){
                        prod = new Product();
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
 
      <table id="customer"> 
          
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
            
                 <th><a href="productDetail.jsp?prodId=<%=product.getProduct_id()%>" class="btn btn-primary">Product Detail</a></th>
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
    </body>
</html>
