/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.shoestore.src;

/**
 *
 * @author moin
 */
public interface StoreConstants {
    
    public static final String JDBC_DRIVER="com.mysql.jdbc.Driver";
     public static final String Connection_URL="jdbc:mysql://localhost/";
      public static final String USER="root";
       public static final String Password="moin";
        public static final String Database="shoestore";
        public static final String IMAGE_SERVER_PATH ="C:/Users/moin/Documents/Work_Space/ShoeStore/web/productImages";
          public static final String IMAGE_RELATIVE_PATH ="productImages";
          public static final String SMTP_HOST = "smtp.gmail.com";
             public static final String FROM = "moinamazon123@gmail.com";
               public static final String PASSWORD_MAIL = "moin1234";
                 public static final String PORT = "465";
                 public static final String MAIL_SUBJECT_WELCOME="WelCome to Shoe Store";
                    public static final String MAIL_BODY_WELCOME="WelCome to Shoe Store"+"\\n"+"Login : <a href='http://localhost:8080//ShoeStore//login.jsp'>http://localhost:8080//ShoeStore//login.jsp</a>";
          
    
    
}
