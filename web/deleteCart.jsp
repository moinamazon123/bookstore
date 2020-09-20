<%-- 
    Document   : deleteCart
    Created on : 20 Sep, 2020, 11:19:19 AM
    Author     : moin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        

<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="com.shoestore.src.DBConnection"%>
<%@page import="java.sql.Connection"%>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
      
              <%
    try {        
 Connection con = DBConnection.getDBConnection(); 
              Statement st = null;
               ResultSet rs = null;
                int cartCount = 0;

  
 /** Delete Cart Items **/
 System.out.println("Creating statement...");
      st = con.createStatement();
      String sql = "DELETE FROM shoestore.cart " +
                   "WHERE cart_id ='"+request.getParameter("cartId")+"'";
      st.executeUpdate(sql);
  session.setAttribute("dbException", null);


   /** Count Cart Item **/
 
  String cartItemCountquery = "select SUM(quantity) as itemCount from  shoestore.cart where user_id= " +(Integer)session.getAttribute("userId");
  st = con.createStatement();
     rs = st.executeQuery(cartItemCountquery);
    
     while(rs.next()){
         
         cartCount = rs.getInt(1);
         
     }
     
    
 System.out.println("cart count"+cartCount);
     session.setAttribute("cartItemCount", cartCount);
   

        } catch(Exception e){
            session.setAttribute("dbException", e.getMessage());
           System.out.println( e.getMessage());
        } 
    
 RequestDispatcher dd = request.getRequestDispatcher("cartPage.jsp");
                                dd.forward(request, response);
        
        
                                %>
        
        
    </body>
</html>
