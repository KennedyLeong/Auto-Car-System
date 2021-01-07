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
            
            String id = request.getParameter("id");
            String name = request.getParameter("name");
            String phoneNumber = request.getParameter("phonenumber");
            String address = request.getParameter("address");
            String email = request.getParameter("email");
            String password = request.getParameter("password");
            
            conn = DriverManager.getConnection(host, user, pass);
   
            utx.begin();
            Customer customer = new Customer (id, name, phoneNumber, address, email, password);
            em.persist(customer);
            utx.commit();
            response.sendRedirect("register-customer.jsp?success=true");

            
        } catch (Exception ex) {
            ex.printStackTrace();
        }
    }
    
}
