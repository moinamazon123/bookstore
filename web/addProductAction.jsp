<%-- 
    Document   : uploadImage
    Created on : 17 Sep, 2020, 11:04:17 PM
    Author     : moin
--%>

<%@page import="com.shoestore.src.StoreConstants"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>


<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="com.shoestore.src.DBConnection"%>
<%@page import="java.sql.Connection"%>
  <%@ page import="com.oreilly.servlet.MultipartRequest" %> 
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
      
<%--

  
--%>  

       
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
 String query = " insert into shoestore.product (product_name, price, quantity, image, size,category_name,sub_category_name,prod_desc)"
        + " values (?, ?, ?, ?, ?,?,?,?)";
  int userId =0;
      // create the mysql insert preparedstatement
       preparedStmt = con.prepareStatement(query);
      preparedStmt.setString (1, request.getParameter("prodName"));
      preparedStmt.setInt (2, Integer.parseInt(request.getParameter("price")));
      preparedStmt.setInt   (3, Integer.parseInt(request.getParameter("qty")));
      preparedStmt.setString(4, request.getParameter("file"));
      preparedStmt.setString    (5, request.getParameter("size"));
      //preparedStmt.setString(6, "lskl");
      preparedStmt.setString    (6, request.getParameter("category"));
      preparedStmt.setString    (7, request.getParameter("subcategory"));
       preparedStmt.setString    (8, request.getParameter("desc"));
      
       preparedStmt.execute();
 System.out.println("add successful");
     MultipartRequest m = new MultipartRequest(request, StoreConstants.IMAGE_SERVER_PATH);  
out.print("successfully uploaded"+request.getParameter("file"));  
          

        } catch(Exception e){
           System.out.println( e.getMessage());
        }
/** finally{
           
            if(con!=null){con.close();}
                
            }
             
            if(rs!=null){rs.close();}
                
            }
            
            
        } **/


RequestDispatcher dd = request.getRequestDispatcher("admin.jsp?msg=Product added successfully");

                                dd.forward(request, response);
      

       %> 
   <%} %>     
    </body>
</html>
