<%-- 
    Document   : sessionClear
    Created on : 18 Sep, 2020, 11:13:58 AM
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
        <%
            
session.removeAttribute("erMsg");
session.removeAttribute("msg");
session.invalidate();
            %>
    </body>
</html>
