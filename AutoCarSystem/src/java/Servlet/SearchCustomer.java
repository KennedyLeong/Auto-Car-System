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

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import Entity.*;
import java.util.List;
import javax.annotation.Resource;
import javax.persistence.Query;
import javax.transaction.UserTransaction;

/**
 *
 * @author asus
 */
@WebServlet (name = "SearchCustomer", urlPatterns = {"/SearchCustomer"})
public class SearchCustomer extends HttpServlet{
    @PersistenceContext EntityManager em;
    @Resource UserTransaction utx;
    
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        
        try {   
            String customerName = request.getParameter("customername");
            String output = "";
            
            Query customerQuery = em.createNamedQuery("Customer.findAll");
            List<Customer> customerList = customerQuery.getResultList();
            
            for(int i=0; i<customerList.size(); i++) {
                Customer customer = customerList.get(i);
                if(customer.getCustomerName().toLowerCase().contains(customerName.toLowerCase())){

                    output += 
                            "<h3>Result</h3>" +
                            "_______________________________________________________________________________________________" + 
                            "<div class=search-result>" + 
                            " <strong>ID</strong> : <a>" + customer.getCustomerId() + "</a><br>" +
                            " <strong>Name</strong> : <a>" + customer.getCustomerName() + "</a><br>" +
                            " <strong>Phone No.</strong> : <a>" + customer.getCustomerPhoneNumber() + "</a><br>" +
                            " <strong>Email</strong> : <a>" + customer.getCustomerEmail() + "</a><br>" +
                            " <strong>Address</strong>  <p>" + customer.getCustomerAddress() + "</p>" +
                            "<a href=\"send-notification.jsp?recipientaddress=" + customer.getCustomerEmail() + "\" class=notification-btn>Send Notification</a>" + 
                            "<a href=\"staff-register-vehicle.jsp?id=" + customer.getCustomerId() + "\" class=view-more-btn>Register Vehicle</a>" +
                            "</div>" +
                            "_________________________________________________________________________________________________";
                    
                    request.setAttribute("output", output);
                    request.getRequestDispatcher("search-customer.jsp").forward(request, response);
              
                }
            }
                    
       
        } catch (Exception ex) {
            ex.printStackTrace();
        }
    }
    
}
