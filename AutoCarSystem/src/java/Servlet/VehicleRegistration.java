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
import Entity.*;
import java.util.List;
import javax.annotation.Resource;
import javax.persistence.Query;
import javax.transaction.UserTransaction;

/**
 *
 * @author asus
 */
@WebServlet(name = "VehicleRegistration", urlPatterns = {"/VehicleRegistration"})
public class VehicleRegistration extends HttpServlet {
    @PersistenceContext EntityManager em;
    @Resource UserTransaction utx;
    
    private String host = "jdbc:derby://localhost:1527/CarWorkshopDB";
    private String user = "nbuser";
    private String pass = "nbuser";
    
    private Connection conn;
    private PreparedStatement stmt;
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        try {
            
            String customerID = (String)request.getParameter("id");
            
            Query customerQuery = em.createNamedQuery("Customer.findByCustomerId");
            customerQuery.setParameter("customerId", customerID);
            Customer customer =  (Customer) customerQuery.getSingleResult();
            
            String vehicleID = "";
            String number = request.getParameter("vnumber");
            String brand = request.getParameter("vbrand");
            String type = request.getParameter("vtype");
            String color = request.getParameter("vcolor");
            int mileage = Integer.parseInt(request.getParameter("vmileage"));
            
            Query query = em.createNamedQuery("Vehicle.findAll");
            List<Vehicle> vehiclelist = query.getResultList();
            
            if(vehiclelist.size() == 0){
                vehicleID = "V" + String.format("%04d", vehiclelist.size() + 1);
            } else {
                vehicleID = "V" + String.format("%04d", vehiclelist.size() + 1);
            }
            
            Query numberQuery = em.createNamedQuery("Vehicle.findByVehicleNumber");
            numberQuery.setParameter("vehicleNumber", number);
            
            if (numberQuery.getResultList().isEmpty()){
                conn = DriverManager.getConnection(host, user, pass);

                utx.begin();
                Vehicle vehicle = new Vehicle (vehicleID, number, brand, type, color, mileage, customer);
                em.persist(vehicle);
                utx.commit();
                
                response.sendRedirect("register-vehicle.jsp?success=true");
            } else {
                response.sendRedirect("register-vehicle.jsp?status=duplicateVehicleNumber");
            }
            
            
                        
        } catch (Exception ex){
            ex.printStackTrace();
    }
   } 
}
