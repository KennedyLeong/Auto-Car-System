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
@WebServlet (name = "CheckAppointment", urlPatterns = {"/CheckAppointment"})
public class CheckAppointment extends HttpServlet{
    
    @PersistenceContext EntityManager em;
    @Resource UserTransaction utx;
    
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        
        try {

            String output = "";
            
            Query appointmentQuery = em.createNamedQuery("Appointment.findAll");
            List<Appointment> appointmentList = appointmentQuery.getResultList();

            for (Appointment appointment : appointmentList) {

                    Query customerQuery = em.createNamedQuery("Customer.findByCustomerId");
                    customerQuery.setParameter("customerId", appointment.getCustomerId().getCustomerId());
                    Customer customer =  (Customer) customerQuery.getSingleResult();

                    Query vehicleQuery = em.createNamedQuery("Vehicle.findByVehicleId");
                    vehicleQuery.setParameter("vehicleId", appointment.getVehicleId().getVehicleId());
                    Vehicle vehicle =  (Vehicle) vehicleQuery.getSingleResult();            

                    output += "<div class=appointment-content>" +
                              " <strong>Date</strong> : <a>" + appointment.getAppointmentDate() + "</a><br>" +
                      	      " <strong>Time</strong> : <a>" + appointment.getAppointmentTime()+ "</a><br>" +
                      	      " <strong>Name</strong> : <a>" + customer.getCustomerName() + "</a><br>" +
                              " <strong>Contact No</strong> : <a>" + customer.getCustomerPhoneNumber() + "</a><br>" +
                              " <strong>Registration No</strong> : <a>" + vehicle.getVehicleNumber() + " </a><br><br>" +
                              "<a href=\"AppointmentViewMore?appointmentId=" + appointment.getAppointmentId() + "\" class=view-more-btn>View More</a>" + 
                              "<a href=\"\" class=transfer-btn>Transfer</a>" + "</div></a><br><br>";
                       
                  }

                    request.setAttribute("output", output);
                    request.getRequestDispatcher("appointment.jsp").forward(request, response);
        
        } catch (Exception ex) {
            ex.printStackTrace();
        }
    }
    
}
