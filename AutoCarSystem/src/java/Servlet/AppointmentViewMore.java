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
@WebServlet (name = "AppointmentViewMore", urlPatterns = {"/AppointmentViewMore"})
public class AppointmentViewMore extends HttpServlet{
    @PersistenceContext EntityManager em;
    @Resource UserTransaction utx;
    
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        
        try {
                    String appointmentID = request.getParameter("appointmentId");
                    String output = "";
            
                    Query appointmentQuery = em.createNamedQuery("Appointment.findByAppointmentId");
                    appointmentQuery.setParameter("appointmentId", appointmentID);
                    Appointment appointment = (Appointment) appointmentQuery.getSingleResult();

                    Query customerQuery = em.createNamedQuery("Customer.findByCustomerId");
                    customerQuery.setParameter("customerId", appointment.getCustomerId().getCustomerId());
                    Customer customer = (Customer) customerQuery.getSingleResult();

                    Query vehicleQuery = em.createNamedQuery("Vehicle.findByVehicleId");
                    vehicleQuery.setParameter("vehicleId", appointment.getVehicleId().getVehicleId());
                    Vehicle vehicle = (Vehicle) vehicleQuery.getSingleResult();            

                    output += "<div class=appointment-content>" +
                              " <strong>Date</strong>  <p>" + (new SimpleDateFormat("dd.MM.yyyy").format(appointment.getAppointmentDate()))+ "</p>" +
                              " <strong>ID</strong>  <p>" + appointment.getAppointmentId()+ "</p>" +
                      	      " <strong>Time</strong>  <p>" + appointment.getAppointmentTime()+ "</p>" +
                              " <strong>Type</strong>  <p>" + appointment.getAppointmentRequesttype()+ "</p>" +
                              " <strong>Service List</strong>  <p>" + appointment.getAppointmentServicestr()+ "</p>" +
                              " <strong>Status</strong> : <p>" + appointment.getAppointmentStatus()+ "</p><br>" +
                              " <strong>Total Price</strong>  <p>RM " + appointment.getAppointmentTotalprice()+ "</p>" +
                              " <h5><u>Customer Information</u></h5> <br>" +
                      	      " <strong>Name</strong>  <p>" + customer.getCustomerName() + "</p>" +
                              " <strong>Contact No</strong>  <p>" + customer.getCustomerPhoneNumber() + "</p>" +
                              " <h5><u>Vehicle Information</u></h5> <br>" +
                              " <strong>Registration No</strong>  <p>" + vehicle.getVehicleNumber() + " </p>" +
                              " <strong>Brand</strong>  <p>" + vehicle.getVehicleBrand()+ "</p>" +
                              " <strong>Type</strong>  <p>" + vehicle.getVehicleType()+ "</p><br>" + 
                              "</div><br><br>";
                
                  
                    request.setAttribute("output", output);
                    request.getRequestDispatcher("view-appointment.jsp").forward(request, response);
        
        } catch (Exception ex) {
            ex.printStackTrace();
        }
    }
    
}
