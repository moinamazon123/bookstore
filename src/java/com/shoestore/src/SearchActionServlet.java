/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.shoestore.src;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.google.gson.Gson;
import com.shoestore.model.Product;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.json.JSONArray;
import org.json.JSONObject;

/**
 *
 * @author moin
 */
@WebServlet(name = "SearchServlet", urlPatterns = {"/SearchServlet"})
public class SearchActionServlet extends HttpServlet {

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
        List<String>  searchSuggestionList = new ArrayList<String>();
        try (PrintWriter out = response.getWriter()) {
            Connection con = DBConnection.getDBConnection(); 
              Statement st = null;
               ResultSet rs = null;   
                      Product prod = null;
        st= con.createStatement();
        rs =st.executeQuery("select * from shoestore.product");
        
                    while(rs.next()){
                        prod = new Product();
                       prod.setCategory_name(rs.getString("category_name"));
                       prod.setSub_category_name(rs.getString("sub_category_name"));
                       prod.setPriceint(rs.getInt("price"));
                       prod.setQuantity(rs.getInt("quantity"));
                       prod.setImage(rs.getString("image"));
                       prod.setProduct_name(rs.getString("product_name"));
                       prod.setProduct_id(rs.getInt("product_id"));
                     searchSuggestionList.add(prod.getProduct_name());
        }
                    
                     rs =st.executeQuery("select * from shoestore.order");
        
                    while(rs.next()){
                      
                     searchSuggestionList.add(String.valueOf(rs.getInt("order_id")));
        }
             String jsonList = new Gson().toJson(searchSuggestionList);
       
      response.setContentType("application/json");
      response.getWriter().write(jsonList);
     
                    
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
            Logger.getLogger(SearchActionServlet.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(SearchActionServlet.class.getName()).log(Level.SEVERE, null, ex);
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
