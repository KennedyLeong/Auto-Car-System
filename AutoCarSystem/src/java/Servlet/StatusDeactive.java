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

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import Entity.*;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import javax.annotation.Resource;
import javax.transaction.UserTransaction;

@WebServlet (name = "StatusDeactive", urlPatterns = {"/StatusDeactive"})
public class StatusDeactive extends HttpServlet{
    @PersistenceContext EntityManager em;
    @Resource UserTransaction utx;
    
    private String host = "jdbc:derby://localhost:1527/CarWorkshopDB";
    private String user = "nbuser";
    private String pass = "nbuser";
    
    private Connection conn;
    private PreparedStatement stmt;
    
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        try {
            
            String staffID = request.getParameter("id");
            String status = "Deactive";
            String message = "";
            
            Staff staff = em.find(Staff.class, staffID);
            
            conn = DriverManager.getConnection(host, user, pass);
            
            utx.begin();
            staff.setStaffStatus(status);
            em.merge(staff);
            utx.commit();
            
            message += "Status Update";
            
            request.setAttribute("message", message);
            request.getRequestDispatcher("all-staff.jsp").forward(request, response);
            
        } catch (Exception ex) {
            ex.printStackTrace();
        }
    }
}
