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
@WebServlet (name = "ServiceHistory", urlPatterns = {"/ServiceHistory"})
public class ServiceHistory extends HttpServlet{
    @PersistenceContext EntityManager em;
    @Resource UserTransaction utx;
    
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        try {
            
            String vehicleID = request.getParameter("id");
            System.out.print(vehicleID);
            String output = "";
            
            Query vehicleQuery = em.createNamedQuery("Vehicle.findByVehicleId");
            vehicleQuery.setParameter("vehicleId", vehicleID);
            Vehicle vehicle = (Vehicle) vehicleQuery.getSingleResult();
            
            Query appointmentQuery = em.createNamedQuery("Appointment.findByVehicleId");
            appointmentQuery.setParameter("vehicleId", vehicle);
            List<Appointment> appointments = (List<Appointment>) appointmentQuery.getResultList();
            
            for (Appointment appointment : appointments) {
                
                if(appointment.getAppointmentStatus().equalsIgnoreCase("COMPLETE")) {
                
                output += 
                        "<div class=history-content>" +
                        "<strong>Date</strong> : &nbsp;&nbsp;" + (new SimpleDateFormat("dd.MM.yyyy").format(appointment.getAppointmentDate())) + "<br>" +
                        "<strong>Time</strong> : &nbsp;&nbsp;" + appointment.getAppointmentTime() + "<br>" +
                        "<strong>Service List</strong> : &nbsp;&nbsp;" + appointment.getAppointmentServicestr() + "<br>" +
                        "------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------" + "</div><br>";
              }
            }
            request.setAttribute("output", output);
            request.getRequestDispatcher("vehicle-service-history.jsp").forward(request, response);
            
        } catch (Exception ex){
            ex.printStackTrace();
        }
    }
    
}
