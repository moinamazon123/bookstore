/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.shoestore.src;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author moin
 */
@WebServlet(name = "LoginServlet", urlPatterns = {"/LoginServlet"})
public class LoginServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. 
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet LoginServlet</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet LoginServlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>"); **/
            
            String event = request.getParameter("event");
             Connection con = DBConnection.getDBConnection();
             HttpSession session = request.getSession();
              Statement st = null;
               ResultSet rs = null;
              int cartCount = 0;
            if(event.equals("login")){
                System.out.println("%%%%%%%%%%%%%%%%%% Event "+event);
                
            String username = request.getParameter("username");
            String password = request.getParameter("password");
            boolean loginFlag = false;
            
             st = con.createStatement();
             rs = st.executeQuery("Select email,password from user where email='"+username+"' and password='"+password+"'");
            
            while(rs.next()){
                if(username.equals(rs.getString(1)) && password.equals(rs.getString(2))){
                    loginFlag = true;
                    session.setAttribute("loginUser", username);
                }else{
                    loginFlag = false;
                }
                
            }
            
            /** Check Role of login User **/
            String rolename = null;
            int userId=0;
            rs = st.executeQuery("select u.email,rl.role_name,u.user_id from shoestore.user u inner join shoestore.user_role ur on u.user_id=ur.user_id inner join shoestore.role rl on rl.role_id=ur.role_id  where u.email='"+username+"'");
             while(rs.next()){
                 
                 rolename = rs.getString(2);
                 userId = rs.getInt(3);
             }
             session.setAttribute("role", rolename);
                 session.setAttribute("userId", userId);
            if(loginFlag){
      
                if(rolename.equals(request.getParameter("role")) && rolename.equals("ADMIN")){
                  //   response.sendRedirect("admin.jsp"); 
                               RequestDispatcher dd = request.getRequestDispatcher("admin.jsp");

                                dd.forward(request, response);
                               
                     
                }
                if(rolename.equals(request.getParameter("role")) && rolename.equals("USER")){
                   //  response.sendRedirect("index.jsp");  
                   
                             RequestDispatcher dd = request.getRequestDispatcher("index.jsp");

                            dd.forward(request, response);
                }
                
               // request.getServletContext().getRequestDispatcher("/index.jp").forward(request,response);
              // response.sendRedirect("index.jsp");  
              
              
              /** Count Cart Item **/
 
  String cartItemCountquery = "select SUM(quantity) as itemCount from  shoestore.cart where user_id= "+userId;
  st = con.createStatement();
     rs = st.executeQuery(cartItemCountquery);
   
     while(rs.next()){
         
         cartCount = rs.getInt(1);
         
     }
 System.out.println("cart count"+cartCount);
     session.setAttribute("cartItemCount", cartCount);
              
              
           
            } else {
                // request.getServletContext().getRequestDispatcher("/login.jp").forward(request,response);
                session.setAttribute("erMsg", "Invalid Credentials");
                RequestDispatcher dd = request.getRequestDispatcher("login.jsp?cartCount="+cartCount);

                            dd.forward(request, response);
               // response.sendRedirect("login.jsp?erMsg=Invalid Credentials");  
            }
            
            } else if(event.equals("register"))  {
                String existingEmail =null;
                  Statement emailQuery = con.createStatement();
             rs = emailQuery.executeQuery("Select email from user where email='"+request.getParameter("email")+"'");
      
          while(rs.next()){
                existingEmail = rs.getString(1);
            }
                
                
                System.out.println("%%%%%%%%%%%%%%%%%% Event "+event+existingEmail);
      // the mysql insert statement
      if(existingEmail!=null) {
              session.setAttribute("erMsg", "Email address already Taken  ! Please Register Again");
            response.sendRedirect("login.jsp");    
      }
      }else {
      String query = " insert into user (email, fullName, password, repassword, phone)"
        + " values (?, ?, ?, ?, ?)";
  int userId =0;
      // create the mysql insert preparedstatement
      PreparedStatement preparedStmt = con.prepareStatement(query);
      preparedStmt.setString (1, request.getParameter("email"));
      preparedStmt.setString (2, request.getParameter("firstname"));
      preparedStmt.setString   (3, request.getParameter("pass"));
      preparedStmt.setString(4, request.getParameter("confrmpass"));
      preparedStmt.setString    (5, request.getParameter("phone"));
      
       preparedStmt.execute();
       
       MailUtility.SendMail(StoreConstants.MAIL_SUBJECT_WELCOME, "Thanks for registering with our Site", request.getParameter("email"));
       /** Fetching User id **/
       
      Statement userIdst = con.createStatement();
             rs = userIdst.executeQuery("Select user_id from user where email='"+request.getParameter("email")+"'");
      
          while(rs.next()){
                userId = rs.getInt(1);
            }
          
          /** Insert Into user roles table **/
          
           String rolequery = " insert into user_role (user_id,role_id)"
        + " values (?, ?)";
  
      // create the mysql insert preparedstatement
   PreparedStatement    preparedStmt1 = con.prepareStatement(rolequery);
      preparedStmt1.setInt (1, userId);
      preparedStmt1.setInt (2,1);
      
       preparedStmt1.execute();
        //  con.close();
          
          response.sendRedirect("login.jsp?msg=Registration Successful ! Please Login");    
            
        }
          
    }
    }
    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(LoginServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(LoginServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
