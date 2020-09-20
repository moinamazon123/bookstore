<%-- 
    Document   : addToCart
    Created on : 18 Sep, 2020, 9:55:33 AM
    Author     : moin
--%>

<%@page import="com.shoestore.src.DBConnection"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
         <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
          <link rel="stylesheet" href="css/store.css">
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.bundle.min.js" type="text/javascript"></script>


  <link rel="stylesheet" href="css/store.css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
    </head>
    <body>
         <% if ((Integer)session.getAttribute("userId")==null) { %>
      <div  id="login-alert" class="alert alert-danger col-sm-12"> Session Expired! <a href="login.jsp">Login</a></div>
        <%} else { %>    
        <%
            
             
              Statement st = null;
               ResultSet rs = null;
                PreparedStatement preparedStmt = null;
                
            
            try {  
               Connection con = DBConnection.getDBConnection();
               System.out.println("Connection successful");
               
               /** Delete Cart Item **/
     if(request.getParameter("event").equals("editCartItem")){
         
         
        
           System.out.println("inside edit cart "+request.getParameter("productIdHidden")+" and user_id="+(Integer)session.getAttribute("userId"));
             st = con.createStatement();
             String deleteCartSql = "DELETE FROM shoestore.cart " +
                   "WHERE product_id ='"+request.getParameter("productIdHidden")+"' and user_id="+(Integer)session.getAttribute("userId");
      st.executeUpdate(deleteCartSql);
             
            System.out.println("Delete Successful");
         
         
     }
               
         /** Add  Cart Item **/
     if(request.getParameter("event").equals("editCartItem")){
        
           System.out.println("inside add cart");
             
           if(Integer.parseInt(request.getParameter("editquantity"))!=0)   { 
            String query = " insert into shoestore.cart (product_id, price, quantity,user_id,totalValue)"
        + " values (?, ?, ?,?,?)";
  int userId =0;
     System.out.println("Product Id : "+request.getParameter("productIdHidden"));
        System.out.println("productPriceHidden Id : "+Integer.parseInt(request.getParameter("productPriceHidden")));
         System.out.println("quantity Id : "+request.getParameter("editquantity")!=null?request.getParameter("editquantity"):request.getParameter("quantity"));
          System.out.println("userId Id : "+(Integer)session.getAttribute("userId"));
        System.out.println("Event Name  : "+request.getParameter("event"));
      // create the mysql insert preparedstatement
       preparedStmt = con.prepareStatement(query);
      preparedStmt.setString (1, request.getParameter("productIdHidden"));
      preparedStmt.setInt (2, Integer.parseInt(request.getParameter("productPriceHidden")));
      preparedStmt.setInt   (3, Integer.parseInt(request.getParameter("editquantity")!=null?request.getParameter("editquantity"):request.getParameter("quantity")));
       preparedStmt.setInt   (4, (Integer)session.getAttribute("userId"));
        preparedStmt.setInt   (5,  Integer.parseInt(request.getParameter("editquantity")!=null?request.getParameter("editquantity"):request.getParameter("quantity")) * Integer.parseInt(request.getParameter("productPriceHidden")) );
      
       preparedStmt.execute();
           } else {
               System.out.println("Edit count Shoud Contain value"); %>
     <div  id="login-alert" class="alert alert-danger col-sm-12"> Please enter shome quantity </div>            
 <%          }
 System.out.println("update successful");
           
           
         
     }
     else if(request.getParameter("event").equals("prodDetail")){  
               
               
 String query = " insert into shoestore.cart (product_id, price, quantity,user_id,totalValue)"
        + " values (?, ?, ?,?,?)";
  int userId =0;
     System.out.println("Product Id : "+request.getParameter("productIdHidden"));
        System.out.println("productPriceHidden Id : "+Integer.parseInt(request.getParameter("productPriceHidden")));
         System.out.println("quantity Id : "+request.getParameter("editquantity")!=null?request.getParameter("editquantity"):request.getParameter("quantity"));
          System.out.println("userId Id : "+(Integer)session.getAttribute("userId"));
        System.out.println("Event Name  : "+request.getParameter("event"));
      // create the mysql insert preparedstatement
       preparedStmt = con.prepareStatement(query);
      preparedStmt.setString (1, request.getParameter("productIdHidden"));
      preparedStmt.setInt (2, Integer.parseInt(request.getParameter("productPriceHidden")));
      preparedStmt.setInt   (3, Integer.parseInt(request.getParameter("editquantity")!=null?request.getParameter("editquantity"):request.getParameter("quantity")));
       preparedStmt.setInt   (4, (Integer)session.getAttribute("userId"));
        preparedStmt.setInt   (5,  Integer.parseInt(request.getParameter("editquantity")!=null?request.getParameter("editquantity"):request.getParameter("quantity")) * Integer.parseInt(request.getParameter("productPriceHidden")) );
      
       preparedStmt.execute();
 System.out.println("add successful");
 
     }
 
    /** Count Cart Item **/
 
  String cartItemCountquery = "select SUM(quantity) as itemCount from  shoestore.cart where user_id= " +(Integer)session.getAttribute("userId");
  st = con.createStatement();
     rs = st.executeQuery(cartItemCountquery);
     int cartCount = 0;
     while(rs.next()){
         
         cartCount = rs.getInt(1);
         
     }
     
     
 System.out.println("cart count"+cartCount);
     session.setAttribute("cartItemCount", cartCount);
   
     RequestDispatcher dd = request.getRequestDispatcher("productDetail.jsp?prodId="+request.getParameter("productIdHidden")+"&msg=Successfully added to cart"+"&event=prodDetail");

                                dd.forward(request, response);
   
        } catch(Exception e){
           System.out.println( e.getMessage());
        }
/** finally{
           
            if(con!=null){con.close();}
                
            }
             
            if(rs!=null){rs.close();}
                
            }
            
            
        } **/



      

       
          //  response.sendRedirect("productDetail.jsp");
            
            
            
            %>
            <%} %>
    </body>
</html>
