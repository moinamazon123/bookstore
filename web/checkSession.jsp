<%-- 
    Document   : checkSession
    Created on : 20 Sep, 2020, 10:29:01 AM
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
        <% if ((String)session.getAttribute("userId")==null) { %>
        Session Expired!
        <%} else { %>
        Session Active!
        <%} %>
    </body>
</html>
