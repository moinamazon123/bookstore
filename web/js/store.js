/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


$(document).ready(function(){
   // window.location.reload();
    $("#btn-login").click(function(){
        var erMsg ='';
     if($("#login-username").val() == ''){
         erMsg+='Please Enter login email'+"<br>";
     }
      if($("#login-password").val() == ''){
         erMsg+='Please Enter login password'+"<br>";
     }
     if($("#role option:selected").text() == 'Select Role'){
          erMsg+='Please Select your role';
        }
     if(erMsg!=null && erMsg!='') {
      $("#login-alert").show();
     $("#login-alert").html(erMsg);
    return false;
 } else {
     $("#login-alert").hide();
  //   alert('Login Success');
     $("#loginform").submit();
     
 }
     
    });
    
    
    $("#btn-signup").click(function(){
        var erMsg ='';
     if($("#email").val() == ''){
         erMsg+='Please Enter  email'+"<br>";
           $("#email").addClass('input-sm-invalid');
     }else{
            $("#email").removeClass('input-sm-invalid');
     }
      if($("#pass").val() == ''){
         erMsg+='Please Enter  password'+"<br>";
           $("#pass").addClass('input-sm-invalid');
     }else{
          $("#pass").removeClass('input-sm-invalid');
     }
      if($("#confrmpasss").val() == ''){
         erMsg+='Please Enter Confirm  password'+"<br>";
           $("#confrmpasss").addClass('input-sm-invalid');
     }else{
          $("#confrmpasss").removeClass('input-sm-invalid');
     }
     
     if($("#pass").val()!=null && $("#confrmpasss").val()!=null ){
         
         if($("#pass").val() !=  $("#confrmpasss").val() ){
             
               erMsg+='Password and Confirm password should match'+"<br>";
         }
         
         
     }
     
     
   
     
     if(erMsg!=null && erMsg!='') {
      $("#signupalert").show();
     $("#signupalert").html(erMsg);
 } else {
     $("#signupalert").hide();
    // alert('Login Success');
     $("#signupform").submit();
     
 }
     
    });
    
  $("#confrmpasss1").blur(function (){
  
      var erMsg ='';
       if($("#pass").val() !=  $("#confrmpasss").val() ){
           console.log($("#pass").val() +  $("#confrmpass").val() );
           $("#pass").addClass('input-sm-invalid');
           $("#confrmpass").addClass('input-sm-invalid');
             
               erMsg+='Password and Confirm password should match'+"<br>";
         } 
        if(erMsg!=null && erMsg!='') {
      $("#signupalert").show();
     $("#signupalert").html(erMsg);
      
        }
    });
    
     $('#addProdSubmit').click(function() {
       
        var filename = $('#image_file').val();
        var x = filename.split('\\')[2];
     //  alert(x);
      
      $('#addProdFrm').attr('action', 'addProductAction.jsp?file='+x+'&prodName='
              +$("#prodname").val()+
              '&qty='+$("#quantity option:selected").text()
      +'&price='
              +$("#prodprice").val()+'&size='
              +$("#shoesize option:selected").text()+
              '&category='
              +$("#category option:selected").text()+
                '&subcategory='
              +$("#subcategory option:selected").text()+'&desc='+$("#proddesc").val());

      // $('#addProdFrm').attr('action', 'addProductAction.jsp');
       $('#addProdFrm').submit();
       
    });
    
    
    
      $('#editProdSubmit').click(function() {
         //alert();
        var filename = $('#image_file').val();
        var x = filename.split('\\')[2];
     //  alert(x);
      
      $('#editProdFrm').attr('action', 'editProductAction.jsp?file='+x+'&prodName='
              +$("#prodname").val()+
              '&qty='+$("#quantity option:selected").text()
      +'&price='
              +$("#prodprice").val()+'&size='
              +$("#shoesize option:selected").text()+
              '&category='
              +$("#category option:selected").text()+
                '&subcategory='
              +$("#subcategory option:selected").text()+'&desc='+$("#proddesc").val()+'&prodId='+$('#proId').val());

      // $('#addProdFrm').attr('action', 'addProductAction.jsp');
       $('#editProdFrm').submit();
       
    });
  
  $("#searchBtn").click(function(){
    
        $('#searchFRM').attr('action', 'productList.jsp?searchKW='+$("#searchKW").val());
         $('#searchFRM').submit();
  });
    
});