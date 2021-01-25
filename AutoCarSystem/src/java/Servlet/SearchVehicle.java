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
@WebServlet (name = "SearchVehicle", urlPatterns = {"/SearchVehicle"})
public class SearchVehicle extends HttpServlet{
    @PersistenceContext EntityManager em;
    @Resource UserTransaction utx;
    
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        try {
            
            String customerID = request.getParameter("customerId");
            String output = "";
            
            Query customerQuery = em.createNamedQuery("Customer.findByCustomerId");
            customerQuery.setParameter("customerId", customerID);
            Customer customer = (Customer) customerQuery.getSingleResult();
            
            Query vehicleQuery = em.createNamedQuery("Vehicle.findByCustomerId");
            vehicleQuery.setParameter("customerId", customer);
            List<Vehicle> vehicles = (List<Vehicle>) vehicleQuery.getResultList();
            
            for (Vehicle vehicle : vehicles){
                
                output += 
                        "<div class=vehicle-content>" +
                        "<strong>ID</strong> : &nbsp;&nbsp;" + vehicle.getVehicleId() + "<br>" +
                        "<strong>Vehicle Number</strong> : &nbsp;&nbsp;" + vehicle.getVehicleNumber() + "<br>" +
                        "<strong>Brand</strong> : &nbsp;&nbsp;"+ vehicle.getVehicleBrand() + "<br>" +
                        "<strong>Type</strong> : &nbsp;&nbsp;" + vehicle.getVehicleType() + "<br>" +
                        "<strong>Color</strong> : &nbsp;&nbsp;" + vehicle.getVehicleColor() + "<br>" +
                        "<strong>Mileage</strong> : &nbsp;&nbsp;" + vehicle.getVehicleMileage() + "<br>" + 
                        "--------------------------------------------------------------------------------------" + "</div><br>";
            }
            
            request.setAttribute("output", output);
            request.getRequestDispatcher("view-vehicle-list.jsp").forward(request, response);
            
        } catch (Exception ex) {
            ex.printStackTrace();
        }
    }
    
}
