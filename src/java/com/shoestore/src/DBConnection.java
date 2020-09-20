/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.shoestore.src;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

/**
 *
 * @author moin
 */
public class DBConnection {
    
    
    static Connection con=null;
    public static Connection getDBConnection()
    {
        if (con != null) return con;
        // get db, user, pass from settings file
        return getConnection();
    }

    private static Connection getConnection()
    {
        try
        {
            Class.forName("com.mysql.jdbc.Driver");
            con=DriverManager.getConnection(StoreConstants.Connection_URL+StoreConstants.Database+"?user="+StoreConstants.USER+"&password="+StoreConstants.Password);
            System.out.println("Database Connection Succesful");
        }
        catch(Exception e)
        {
           // e.printStackTrace();
               System.out.println("Database Connection Failure due to "+e.getMessage());
        }

        return con;        
    }
    
    public static void main(String[] args){
        
       
        try
        {
        Connection con =DBConnection.getConnection();
        Statement st = con.createStatement();
        ResultSet rs = st.executeQuery("Select * from user");
        while(rs.next()){
            System.out.println("User name "+rs.getString("phone"));
        }
        }
         catch(Exception e)
        {
            e.printStackTrace();
        }
    }
    
    
}
