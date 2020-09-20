<%-- 
    Document   : deleteProduct
    Created on : 18 Sep, 2020, 2:07:42 PM
    Author     : moin
--%>

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
    </head>
    <body>
       
        <%
    try {        
 Connection con = DBConnection.getDBConnection(); 
              Statement st = null;
               ResultSet rs = null;
               

  
 /** Delete Cart Items **/
 System.out.println("Creating statement...");
      st = con.createStatement();
      String sql = "DELETE FROM shoestore.product " +
                   "WHERE product_id ='"+request.getParameter("prodId")+"'";
      st.executeUpdate(sql);
  session.setAttribute("dbException", null);

        } catch(Exception e){
            session.setAttribute("dbException", e.getMessage());
           System.out.println( e.getMessage());
        }



RequestDispatcher dd = request.getRequestDispatcher("productList.jsp");

                                dd.forward(request, response);


            %>
        
        
        
    </body>
</html>
