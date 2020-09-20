<%-- 
    Document   : signout
    Created on : 17 Sep, 2020, 6:32:40 PM
    Author     : moin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Log Out</h1>
        
        <%  session.removeAttribute("loginUser"); 
        session.invalidate();
       
response.sendRedirect("login.jsp?msg=Successfully Log out");
        
        %>
        
        
        
        
    </body>
</html>
