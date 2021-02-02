/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlet;

/**
 *
 * @author asus
 */

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.sql.*;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import Entity.*;
import java.util.List;
import javax.annotation.Resource;
import javax.persistence.Query;
import javax.transaction.UserTransaction;

@WebServlet(name = "CreateAccount", urlPatterns = {"/CreateAccount"})
public class CreateAccount extends HttpServlet{
     @PersistenceContext EntityManager em;
    @Resource UserTransaction utx;
    
    private String host = "jdbc:derby://localhost:1527/CarWorkshopDB";
    private String user = "nbuser";
    private String pass = "nbuser";
    
    private Connection conn;
    private PreparedStatement stmt;
    
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        try {
            
            String staffID = "";
            String name = request.getParameter("name");
            String phoneNumber = request.getParameter("phonenumber");
            String type = "STAFF";
            String email = request.getParameter("email");
            String password = request.getParameter("password");
            String status = "active";
            
            String message = "";
            
            Query query = em.createNamedQuery("Staff.findAll");
            List<Staff> staffList = query.getResultList();
            
            if(staffList.size() == 0){
                staffID = "ST" + String.format("%04d", staffList.size() + 1);
            } else {
                staffID = "ST" + String.format("%04d", staffList.size() + 1);
            }
            
            Query nameQuery = em.createNamedQuery("Staff.findByStaffName");
            nameQuery.setParameter("staffName", name);
            
            Query emailQuery = em.createNamedQuery("Staff.findByStaffEmail");
            emailQuery.setParameter("staffEmail", email);
            
            if(nameQuery.getResultList().isEmpty() && emailQuery.getResultList().isEmpty()) {
                
                conn = DriverManager.getConnection(host, user, pass);
                
                utx.begin();
                Staff staff = new Staff (staffID, name, phoneNumber, type, email, password, status);
                em.persist(staff);
                utx.commit();
                
                message += "Staff Account has been created";
                
                request.setAttribute("success", message);
                request.getRequestDispatcher("create-account.jsp").forward(request, response); 
                
            } else {
                
                message += "Error: Duplicate Name or Email Detected! Try Again";
                
                request.setAttribute("failed", message);
                request.getRequestDispatcher("create-account.jsp").forward(request, response); 
                
            }
            
        } catch (Exception ex) {
            ex.printStackTrace();
        }
    }
}
