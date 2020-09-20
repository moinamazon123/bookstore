<%-- 
    Document   : login
    Created on : 17 Sep, 2020, 12:59:14 PM
    Author     : moin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!------ Include the above in your HEAD tag ---------->

<!DOCTYPE html>
<html>
<head>
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <link rel="stylesheet" href="css/store.css">
  <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  
  <link href="//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//netdna.bootstrapcdn.com/bootstrap/3.0.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
    <script src="js/store.js"></script>
</head>
<style>
    .body{
      font-family: arial;  
        
    }
    
.input-group-addon {
   color: #fff;
   background-color: #337ab7;
}


.form-control, .input-group-addon {
   border-radius: 0px;
}
label{
  text-align: left !important;
}
</style>
<body>

<div class="container">
      <div class="container">    
        <div id="loginbox" style="margin-top:50px;" class="mainbox col-md-5 col-md-offset-4 col-sm-7 col-sm-offset-3">                    
            <div class="panel panel-primary" >
                    <div class="panel-heading">
                        <div class="panel-title text-center"><i class="fa fa-sign-in" aria-hidden="true"></i> Sign In</div>
                        <div style="float:right; font-size: 80%; position: relative; top:-10px"><a href="#">Forgot password?</a></div>
                    </div>     
                
                <% if((String)session.getAttribute("erMsg")!=null){ %>
                <div  id="login-alert" class="alert alert-danger col-sm-12"><%=(String)session.getAttribute("erMsg")%></div>
                
                <%} %>
                 <% if(request.getParameter("msg")!=null){ %>
                <div  id="login-alert" class="alert alert-success col-sm-12"><%=request.getParameter("msg")%></div>
                
                <%} %>

                    <div style="padding-top:30px" class="panel-body" >

                        <div style="display:none" id="login-alert" class="alert alert-danger col-sm-12"></div>
                            
                        <form id="loginform" method="POST" action="LoginServlet" class="form-horizontal" role="form">
                                    
                            <div style="margin-bottom: 25px" class="input-group col-sm-offset-3 col-sm-7">
                                        <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
                                        <input id="login-username" type="text" class="form-control input-sm" name="username" value="" placeholder="username or email">                                        
                                    </div>
                                
                            <div style="margin-bottom: 25px" class="input-group col-sm-offset-3 col-sm-7">
                                        <span class="input-group-addon"><i class="glyphicon glyphicon-lock"></i></span>
                                        <input id="login-password" type="password" class="form-control input-sm" name="password" placeholder="password">
                                    </div>
                                    
                            <input type="hidden" name="event" value="login">
                          


                                <div style="margin-top:10px" class="form-group">
                                    <!-- Button -->

                                    <div class="col-sm-12 controls text-center">
                                      <button id="btn-login" href="#"  class="btn btn-primary btn-sm"> Login <i class="fa fa-sign-in" aria-hidden="true"></i>   </button>
&nbsp;&nbsp;Login As :                                      <!--<a id="btn-fblogin" href="#" class="btn btn-primary">Login with Facebook</a>-->
<select name="role" id="role">
     <option value="0">Select Role</option>
    <option value="ADMIN">Admin</option>
      <option value="USER">User</option>
        
</select>
                                    </div>
                                </div>


                                <div class="form-group">
                                    <div class="col-md-12 control">
                                        <div style="border-top: 1px solid#888; padding-top:15px; font-size:85%" >
                                            Don't have an account! 
                                        <a href="#" onClick="$('#loginbox').hide(); $('#signupbox').show()">
                                            Sign Up Here
                                        </a>
                                        </div>
                                    </div>
                                </div>    
                            </form>     



                        </div>                     
                    </div>  
        </div>
        <div id="signupbox" style="display:none; margin-top:50px" class="mainbox col-md-5 col-md-offset-4 col-sm-7 col-sm-offset-3">
                    <div class="panel panel-primary">
                        <div class="panel-heading">
                            <div class="panel-title text-center">Sign Up <i class="fa fa-user-plus"></i></div>
                            <div style="float:right; font-size: 85%; position: relative; top:-10px"><a id="signinlink" href="#" onclick="$('#signupbox').hide(); $('#loginbox').show()">Sign In</a></div>
                        </div>  
                        <div class="panel-body" >
                            <form id="signupform" action="LoginServlet" class="form-horizontal" role="form">
                                
                                <div id="signupalert" style="display:none" class="alert alert-danger">
                                    <p>Error:</p>
                                    <span></span>
                                </div>
                                    
                                 <input type="hidden" name="event" value="register">
                                  
                                <div class="form-group">
                                    <label for="email" class="col-md-4 control-label">Email</label>
                                    <div class="col-md-8">
                                        <input type="text" class="form-control input-sm" id="email" name="email" placeholder="Email Address">
                                    </div>
                                </div>
                                    
                                <div class="form-group">
                                    <label for="firstname" class="col-md-4 control-label">Full Name</label>
                                    <div class="col-md-8">
                                        <input type="text" class="form-control input-sm" name="firstname" placeholder="First Name">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="lastname" class="col-md-4 control-label">Password</label>
                                    <div class="col-md-8">
                                        <input type="password" class="form-control input-sm" id="pass" name="pass" placeholder="Last Name">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="password" class="col-md-4 control-label">Confirm Password</label>
                                    <div class="col-md-8">
                                        <input type="password" class="form-control input-sm"  id="confrmpasss" name="confrmpass" placeholder="Password">
                                    </div>
                                </div>
                                    
                                <div class="form-group">
                                    <label for="icode" class="col-md-4 control-label">Phone Number</label>
                                    <div class="col-md-8">
                                        <input type="text" class="form-control input-sm" name="phone" placeholder="">
                                    </div>
                                </div>

                                <div class="form-group">
                                    <!-- Button -->                                        
                                    <div class="col-md-offset-4 col-md-8">
                                        <button id="btn-signup" type="button"  class="btn btn-primary btn-sm"> Sign Up <i class="fa fa-user-plus"></i></button>
                                        <!--<span style="margin-left:8px;">or</span>  -->
                                    </div>
                                </div>
                                
                                <!--<div style="border-top: 1px solid #999; padding-top:20px"  class="form-group">
                                    
                                    <div class="col-md-offset-3 col-md-9">
                                        <button id="btn-fbsignup" type="button" class="btn btn-primary"><i class="icon-facebook"></i>   Sign Up with Facebook</button>
                                    </div>                                           
                                        
                                </div>-->
                                <div class="form-group">
                                    <div class="col-md-12 control">
                                        <div style="border-top: 1px solid#888; padding-top:15px; font-size:85%" >
                                            Do you have an account! 
                                        <a href="#" onClick="$('#signupbox').hide(); $('#loginbox').show()">
                                            Login Here
                                        </a>
                                        </div>
                                    </div>
                                </div>
                                
                                
                            </form>
                         </div>
                    </div>

               
               
                
         </div> 
    </div>
    
</div>

</body> 
</html>
-