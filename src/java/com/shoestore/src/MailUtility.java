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
import java.util.*;  
import javax.mail.*;  
import javax.mail.internet.*;  
import javax.activation.*;  
  
public class MailUtility  
{  
 public static boolean SendMail(String subject , String mailBody, String TO){  
     // String to = "smainuddin@gmail.com";//change accordingly  
      String from = "moinamazon123@gmail.com";//change accordingly  
      String host = "smtp.gmail.com";//or IP address  
      boolean mailFlag = false;
  
    Properties props = new Properties();    
          props.put("mail.smtp.host", StoreConstants.SMTP_HOST);    
          props.put("mail.smtp.socketFactory.port", StoreConstants.PORT);    
          props.put("mail.smtp.socketFactory.class",    
                    "javax.net.ssl.SSLSocketFactory");    
          props.put("mail.smtp.auth", "true");    
          props.put("mail.smtp.port", StoreConstants.PORT);    
          //get Session   
          Session session = Session.getDefaultInstance(props,    
           new javax.mail.Authenticator() {    
           protected PasswordAuthentication getPasswordAuthentication() {    
           return new PasswordAuthentication(StoreConstants.FROM,StoreConstants.PASSWORD_MAIL);  
           }    
          });    
          //compose message    
          try {    
           MimeMessage message = new MimeMessage(session);    
           message.addRecipient(Message.RecipientType.TO,new InternetAddress(TO));    
           message.setSubject(subject);    
           message.setText(mailBody);    
           //send message  
           Transport.send(message);   
            System.out.println("message sent successfully");   
           mailFlag = true;
         
           
          } catch (MessagingException e) {           mailFlag = false;
//return mailFlag; throw new RuntimeException(e);}    
             
    }  
            return mailFlag;
            }  
}