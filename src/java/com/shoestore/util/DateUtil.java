/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.shoestore.util;
import com.shoestore.src.DBConnection;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.text.ParseException;
import java.text.SimpleDateFormat;  
import java.util.Calendar;
import java.util.Date;  

/**
 *
 * @author moin
 */
public   class DateUtil {
    
   static   Date date = new Date();  
  static  SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
    public static  String getOrderDate(){
        
        String strDate= formatter.format(date);  
    System.out.println(strDate);
    return strDate;
    }
    
public static String getDeliverDate(){
    
    //Given Date in String format
	String oldDate = getOrderDate();
	//Specifying date format that matches the given date
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	Calendar c = Calendar.getInstance();
	try{
	   //Setting the date to the given date
	   c.setTime(sdf.parse(oldDate));
	}catch(ParseException e){
		e.printStackTrace();
	 }
	   
	//Number of Days to add
	c.add(Calendar.DAY_OF_MONTH, 7);  
	//Date after adding the days to the given date
	String deliveryDate = sdf.format(c.getTime());  
	//Displaying the new Date after addition of Days
	System.out.println("Date after Addition: "+deliveryDate);
        return deliveryDate;
   }
    
    public static String getProdImage(int productId){
       String imageName= null; 
         try
        {
        Connection con =DBConnection.getDBConnection();
        Statement st = con.createStatement();
        ResultSet rs = st.executeQuery("Select image from product where product_id="+productId);
        while(rs.next()){
           imageName = rs.getString(1);
        }
        }
         catch(Exception e)
        {
           System.out.println(e.getMessage());
        }
        return imageName;
        
        
    }
    


}  
 

