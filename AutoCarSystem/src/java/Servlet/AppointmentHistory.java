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
import java.text.SimpleDateFormat;
import java.util.List;
import javax.annotation.Resource;
import javax.persistence.Query;
import javax.transaction.UserTransaction;


/**
 *
 * @author asus
 */
@WebServlet (name = "AppointmentHistory", urlPatterns = {"/AppointmentHistory"})
public class AppointmentHistory extends HttpServlet{
    @PersistenceContext EntityManager em;
    @Resource UserTransaction utx;
    
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        try {
            
            String customerID = request.getParameter("id");
            String output = "";
            
            Query customerQuery = em.createNamedQuery("Customer.findByCustomerId");
            customerQuery.setParameter("customerId", customerID);
            Customer customer = (Customer) customerQuery.getSingleResult();
            
            Query appointmentQuery = em.createNamedQuery("Appointment.findByCustomerId");
            appointmentQuery.setParameter("customerId", customer);
            List<Appointment> appointments = (List<Appointment>) appointmentQuery.getResultList();
            
            for (Appointment appointment : appointments) {
                
                    Query vehicleQuery = em.createNamedQuery("Vehicle.findByVehicleId");
                    vehicleQuery.setParameter("vehicleId", appointment.getVehicleId().getVehicleId());
                    Vehicle vehicle =  (Vehicle) vehicleQuery.getSingleResult();  
                
                output += 
                        "<div class=history-content>" +
                        " Date: " + (new SimpleDateFormat("dd.MM.yyyy").format(appointment.getAppointmentDate())) + 
                        " <br>Time: " + appointment.getAppointmentTime() + 
                        " <br>vehicle No.: " + vehicle.getVehicleNumber() + 
                        " <br>Service List: " + appointment.getAppointmentServicestr() + 
                        " <br>Status: " + appointment.getAppointmentStatus() + 
                        " <br>Total Price: RM" + appointment.getAppointmentTotalprice() + "</div><br>" ;
                
                System.out.println(appointment.getAppointmentId() + " , " + appointment.getAppointmentStatus());
            }
            
            request.setAttribute("output", output);
            request.getRequestDispatcher("appointment-history.jsp").forward(request, response);
            
        } catch (Exception ex) {
            ex.printStackTrace();
        }
    }
}
