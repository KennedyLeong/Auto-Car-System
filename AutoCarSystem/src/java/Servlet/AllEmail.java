/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlet;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.sql.*;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import Entity.Customer;
import java.util.ArrayList;
import java.util.List;
import javax.annotation.Resource;
import javax.persistence.Query;
import javax.transaction.UserTransaction;

/**
 *
 * @author asus
 */
@WebServlet(name = "AllEmail", urlPatterns = {"/AllEmail"})
public class AllEmail extends HttpServlet {
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
            
            Query customerQuery = em.createNamedQuery("Customer.findAll");
            List<Customer> customers = (List<Customer>) customerQuery.getResultList();
            List<String> emails = new ArrayList<String>();
            
            for (Customer customer : customers) {
                emails.add(customer.getCustomerEmail());
            }
            
            String emailStr = String.join(", ", emails);
            
            request.setAttribute("emailStr", emailStr);
            request.getRequestDispatcher("staff-send-notification.jsp").forward(request, response);
            
        } catch (Exception ex) {
            ex.printStackTrace();
        }
    }
    
}
