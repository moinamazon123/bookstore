<%-- 
    Document   : editProductAction
    Created on : 18 Sep, 2020, 2:40:24 PM
    Author     : moin
--%>

<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="com.shoestore.model.Product"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <%@page import="com.shoestore.src.StoreConstants"%>
<%@page import="java.sql.PreparedStatement"%>



<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="com.shoestore.src.DBConnection"%>
<%@page import="java.sql.Connection"%>
    </head>
    <body>
        
         <% if ((Integer)session.getAttribute("userId")==null) { %>
      <div  id="login-alert" class="alert alert-danger col-sm-12"> Session Expired! <a href="login.jsp">Login</a></div>
        <%} else { %>    
        
          <%
                    Connection con = DBConnection.getDBConnection(); 
              Statement st = null;
               ResultSet rs = null;
               Product prod = null;
  
          try {     
              String sqlUpdate = "UPDATE shoestore.product "
                + "SET product_name = ? ,price=? ,quantity=?,size=?,category_name=?,sub_category_name=?,image=?,prod_desc=? "
                + "WHERE product_id = ?";
              
             
               PreparedStatement pstmt = con.prepareStatement(sqlUpdate) ;

            // prepare data for update
            
            pstmt.setString(1, request.getParameter("prodName"));
             pstmt.setInt(2, Integer.parseInt(request.getParameter("price")));
               pstmt.setInt(3, Integer.parseInt(request.getParameter("qty")));
                pstmt.setString(4, request.getParameter("size"));
              pstmt.setString(5, request.getParameter("category"));
               pstmt.setString(6, request.getParameter("subcategory"));
                  pstmt.setString(7, request.getParameter("file"));
                     pstmt.setString(8, request.getParameter("proddesc"));
            pstmt.setInt(9, Integer.parseInt(request.getParameter("prodId")));

            int rowAffected = pstmt.executeUpdate();
            System.out.println(String.format("Row affected %d", rowAffected));
            
             MultipartRequest m = new MultipartRequest(request, StoreConstants.IMAGE_SERVER_PATH);  
out.print("successfully uploaded"+request.getParameter("file"));  
            if(rowAffected>0){
                  session.setAttribute("editdbException", null);
            }
            
            } catch(Exception e){
                session.setAttribute("editdbException", e.getMessage());
           System.out.println( e.getMessage());
        } 
            RequestDispatcher dd = request.getRequestDispatcher("editProduct.jsp?msg=Product Edited successfully");

                                dd.forward(request, response);
          
            %>
            
            <% } %>
    </body>
</html>
