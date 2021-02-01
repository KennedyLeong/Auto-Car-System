/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.sql.*;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import Entity.Customer;
import java.util.List;
import javax.annotation.Resource;
import javax.persistence.Query;
import javax.transaction.UserTransaction;

/**
 *
 * @author asus
 */

@WebServlet(name = "StaffCustomerRegistration", urlPatterns = {"/StaffCustomerRegistration"})
public class StaffCustomerRegistration extends HttpServlet{
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
            
            String customerID = "";
            String name = request.getParameter("name");
            String phoneNumber = request.getParameter("phonenumber");
            String address = request.getParameter("address");
            String email = request.getParameter("email");
            String password = request.getParameter("password");
            
            String message = "";
            
            Query query = em.createNamedQuery("Customer.findAll");
            List<Customer> customerList = query.getResultList();
            
            if(customerList.size() == 0){
                customerID = "CS" + String.format("%04d", customerList.size() + 1);
            } else {
                customerID = "CS" + String.format("%04d", customerList.size() + 1);
            }
          
          	Query nameQuery = em.createNamedQuery("Customer.findByCustomerName");
          	nameQuery.setParameter("customerName", name);
          
          	Query emailQuery = em.createNamedQuery("Customer.findByCustomerEmail");
          	emailQuery.setParameter("customerEmail", email);
         	  
            if (nameQuery.getResultList().isEmpty() && emailQuery.getResultList().isEmpty()) { // no duplicates found
              
               conn = DriverManager.getConnection(host, user, pass);
   
                    utx.begin();
                    Customer customer = new Customer (customerID, name, phoneNumber, address, email, password);
                    em.persist(customer);
                    utx.commit();
                    
                    message += "Customer Account has been created";
                
                    request.setAttribute("output", message);
                    request.getRequestDispatcher("thank-you.jsp").forward(request, response); 
            	
            } else { 
                
                message += "Error: Duplicate Name or Email Detected! Try Again";
                
                request.setAttribute("message", message);
                request.getRequestDispatcher("staff-register-customer.jsp").forward(request, response);	             
            }
            
        } catch (Exception ex) {
            ex.printStackTrace();
        }
    }
    
}
