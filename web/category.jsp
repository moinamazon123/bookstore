<%-- 
    Document   : category
    Created on : 17 Sep, 2020, 8:58:27 PM
    Author     : moin
--%>

<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="com.shoestore.src.DBConnection"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
      
        
        <%  String category = request.getParameter("category");
        try {
         Connection con = DBConnection.getDBConnection(); 
              Statement st = null;
               ResultSet rs = null;
               List<String> subcategoryList = new ArrayList<String>();
        st= con.createStatement();rs =st.executeQuery("select sub_category_name FROM shoestore.category where category_name= '"+category+"'");
        
                    while(rs.next()){
                       
                       subcategoryList.add(rs.getString(1));
                       
                   }    
                 
      }catch(Exception e){
                           
                           e.getMessage();
                           
                   
               }
        
        %>
        
    </body>
</html>
