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
import Entity.Customer;
import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import javax.transaction.UserTransaction;

/**
 *
 * @author asus
 */
@WebServlet(name = "EditCustomerProfile", urlPatterns = {"/EditCustomerProfile"})
public class EditCustomerProfile extends HttpServlet {
    @PersistenceContext EntityManager em;
    @Resource UserTransaction utx;
    
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        try{
            String id = request.getParameter("id");
            String name = request.getParameter("cname");
            String phoneNumber = request.getParameter("cphonenumber");
            String address = request.getParameter("caddress");
            String email = request.getParameter("cemail");
            String newpassword = request.getParameter("newpassword");
            String oldpassword = request.getParameter("oldpassword");
            
            String output = "";
            
            Customer customer = em.find(Customer.class,id);
            
            if(customer.getCustomerPassword().equals(oldpassword)){
                customer.setCustomerName(name);
                customer.setCustomerPhoneNumber(phoneNumber);
                customer.setCustomerAddress(address);
                customer.setCustomerEmail(email);
                customer.setCustomerPassword(newpassword);
                
                utx.begin();
                em.merge(customer);
                utx.commit();
                
                HttpSession session = request.getSession();
                Customer cus = em.find(Customer.class, id);
                session.setAttribute("customer", cus);
                session.setAttribute("customerLoggedIn", true);
                
                output += "Password has been change successful";

                request.setAttribute("success", output);
                request.getRequestDispatcher("update-customer-details.jsp").forward(request, response);
                
            } else if(newpassword.equals("")){
                customer.setCustomerName(name);
                customer.setCustomerPhoneNumber(phoneNumber);
                customer.setCustomerAddress(address);
                customer.setCustomerEmail(email);
                
                utx.begin();
                em.merge(customer);
                utx.commit();
                
                HttpSession session = request.getSession();
                Customer cus = em.find(Customer.class, id);
                session.setAttribute("customer", cus);
                session.setAttribute("customerLoggedIn", true);
                
                output += "Customer Information has been change Successful";

                request.setAttribute("success", output);
                request.getRequestDispatcher("update-customer-details.jsp").forward(request, response);
                
            } else {
                
                output += "Error: The Old Password Provided is Incorrect";

                request.setAttribute("failed", output);
                request.getRequestDispatcher("update-customer-details.jsp").forward(request, response);
            }
            
        } catch (Exception ex){
            throw new RuntimeException(ex);
        }
    }
    
}
