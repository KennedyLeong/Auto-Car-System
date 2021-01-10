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
import javax.servlet.http.HttpSession;
import javax.transaction.UserTransaction;

/**
 *
 * @author asus
 */
@WebServlet (name = "CustomerLogin", urlPatterns = {"/CustomerLogin"})
public class CustomerLogin extends HttpServlet {
    @PersistenceContext EntityManager em;
    @Resource UserTransaction utx;
    
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        try{
            String email = request.getParameter("email");
            String password = request.getParameter("upassword");
            
            Query query = em.createNamedQuery("Customer.findAll");
            List<Customer> customerList = query.getResultList();
            
            for(int i=0; i<customerList.size(); i++) {
                Customer cust = customerList.get(i);
                if(cust.getCustomerEmail().equals(email) && cust.getCustomerPassword().equals(password)) {
                    Customer cus = em.find(Customer.class ,email);
                    HttpSession session = request.getSession();
                    session.setAttribute("customer", cust);
                    session.setAttribute("customerLoggedIn", true); 
                  
                    Query vehiclequery = em.createNamedQuery("Vehicle.findAll");
                  
                    List<Vehicle> vehicleList = vehiclequery.getResultList();
                    session.setAttribute("vehicleList", vehicleList);
                    
                    response.sendRedirect("index.jsp?status=customerloggingin");
                }
            }
            response.sendRedirect("index.jsp?status=loginfailed");
            
            
        } catch (Exception ex) {
            ex.printStackTrace();
        }
    }
    
}
