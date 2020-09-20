<%-- 
    Document   : upload
    Created on : 17 Sep, 2020, 11:03:13 PM
    Author     : moin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <script src="https://code.jquery.com/jquery-2.2.4.min.js" integrity="sha256-BbhdlvQf/xTY9gja0Dq3HiwQF8LaCRTXxZKRutelT44="
crossorigin="anonymous"></script>
 <script src="js/store.js"></script>
    </head>
    <body>
      <form action="uploadImage.jsp" method="post" enctype="multipart/form-data">  
Select File:<input type="file" name="fname"/><br/> 
<b id = "select_file" class="span3" style="font-weight: bold; cursor: pointer; ">Please select image</b>
<input type="submit"value="Upload"/>  
</form>  
    </body>
</html>
