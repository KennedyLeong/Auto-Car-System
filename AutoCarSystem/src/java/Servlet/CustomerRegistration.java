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
import java.util.List;
import javax.annotation.Resource;
import javax.persistence.Query;
import javax.transaction.UserTransaction;


@WebServlet(name = "CustomerRegistration", urlPatterns = {"/CustomerRegistration"})
public class CustomerRegistration extends HttpServlet{
    @PersistenceContext EntityManager em;
    @Resource UserTransaction utx;
    
    private String host = "jdbc:derby://localhost:1527/CarWorkshopDB";
    private String user = "nbuser";
    private String pass = "nbuser";
    
    private Connection conn;
    private PreparedStatement stmt;
    
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        try{
            
            String customerID = "";
            String name = request.getParameter("name");
            String phoneNumber = request.getParameter("phonenumber");
            String address = request.getParameter("address");
            String email = request.getParameter("email");
            String password = request.getParameter("password");
            
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
                    response.sendRedirect("index.jsp?success=true");  
            	
            } else { // duplicates found
              
              	response.sendRedirect("register-customer.jsp?status=duplicatedNameorEmail");
              
            }         
      
        } catch (Exception ex) {
            ex.printStackTrace();
        }
    }
    
}
