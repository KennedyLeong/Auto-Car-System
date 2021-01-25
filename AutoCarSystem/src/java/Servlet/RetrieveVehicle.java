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
@WebServlet (name = "RetrieveVehicle", urlPatterns = {"/RetrieveVehicle"})
public class RetrieveVehicle extends HttpServlet{
    @PersistenceContext EntityManager em;
    @Resource UserTransaction utx;
    
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        
                String output = "";
        try {
            
            String customerID = request.getParameter("customerId");

            Query customerQuery = em.createNamedQuery("Customer.findByCustomerId");
            customerQuery.setParameter("customerId", customerID);
            Customer customer = (Customer) customerQuery.getSingleResult();
            
            Query vehicleQuery = em.createNamedQuery("Vehicle.findByCustomerId");
            vehicleQuery.setParameter("customerId", customer);
            List<Vehicle> vehicles = (List<Vehicle>) vehicleQuery.getResultList();
            
            for (Vehicle vehicle : vehicles) {

                    output += 
                            "&bull; <strong>ID</strong> : &nbsp;" + vehicle.getVehicleId() +
                            "&nbsp;&nbsp;&nbsp;<strong>Vehicle Number</strong> : " + vehicle.getVehicleNumber() + 
                            "&nbsp;&nbsp;&nbsp;<strong>Brand</strong> : " + vehicle.getVehicleBrand() + "<br>" +
                            "--------------------------------------------------------------------------------------<br>";
           
            }
            
            request.setAttribute("customerId", customerID);
            request.setAttribute("output", output);
            request.getRequestDispatcher("staff-create-appointment.jsp").forward(request, response);
            
        } catch (Exception ex) {
            
            output += "The Customer ID provided is incorrect.";
            
            request.setAttribute("output", output);
            request.getRequestDispatcher("validate-customer.jsp").forward(request, response);
        }
    }
    
}
