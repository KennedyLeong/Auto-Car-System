/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.annotation.WebServlet;
import Util.Mailer;
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
@WebServlet(name = "ForgotPassword", urlPatterns = {"/ForgotPassword"})
public class ForgotPassword extends HttpServlet{
    @PersistenceContext EntityManager em;
    @Resource UserTransaction utx;
    
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        try {
            
            String output= "";
            String temporaryPassword = "@Qwertyu1";
            
            String recipient = request.getParameter("recipientaddress");
            String subject = "Forgot Password";
            String msg = "Dear Customer,\n\n Your password has been reset.\n Temporary password has been generated for you.\n\n @Qwertyu1 \n\nOnce you login please remember to change your password immediately.";
            
            
            Query customerQuery = em.createNamedQuery("Customer.findAll");
            List<Customer> customerList = customerQuery.getResultList();

            for(int i=0; i<customerList.size(); i++) {
                Customer customer = customerList.get(i);
                if(customer.getCustomerEmail().equals(recipient)){
  
                    customer.setCustomerPassword(temporaryPassword);
                    
                    utx.begin();
                    em.merge(customer);
                    utx.commit();
                    
                     Mailer.send(recipient, subject, msg);
        
                    output += "Success, An email has been sent to the address you have provided.";

                    request.setAttribute("success", output);
                    request.getRequestDispatcher("forgot-password.jsp").forward(request, response);
                    
                } 
            }
            
                    output += "The email address you provide is incorrect. Try Again";
                    
                    request.setAttribute("failed", output);
                    request.getRequestDispatcher("forgot-password.jsp").forward(request, response);
     
        } catch (Exception ex){
            ex.printStackTrace();
        }
    }
    
    
        
    
    
}
