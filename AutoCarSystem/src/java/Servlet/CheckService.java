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
import java.text.SimpleDateFormat;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import Entity.*;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.ZoneId;
import java.time.format.DateTimeFormatter;
import java.util.List;
import javax.annotation.Resource;
import javax.persistence.Query;
import javax.transaction.UserTransaction;
import java.util.Date;


/**
 *
 * @author asus
 */
@WebServlet(name = "CheckService", urlPatterns = {"/CheckService"})
public class CheckService extends HttpServlet{
    @PersistenceContext EntityManager em;
    @Resource UserTransaction utx;
    
    private String host = "jdbc:derby://localhost:1527/CarWorkshopDB";
    private String user = "nbuser";
    private String pass = "nbuser";
    
    private Connection conn;
    private PreparedStatement stmt;
    
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        try {
            
            DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
            LocalDateTime now = LocalDateTime.now();
            
            Date todayDate = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(dtf.format(now));
            
            String output = "";
            
            Query appointmentQuery = em.createNamedQuery("Appointment.findAll");
            List<Appointment> appointmentList = appointmentQuery.getResultList();

            for (Appointment appointment : appointmentList) {
              			
              	// Check if appointment is on the same day
              	// Note: Using a custom function calleed "isSameDay" just to make it easier.
              	if (isSameDay(todayDate, appointment.getAppointmentDate())) {

                    Query customerQuery = em.createNamedQuery("Customer.findByCustomerId");
                    customerQuery.setParameter("customerId", appointment.getCustomerId().getCustomerId());
                    Customer customer =  (Customer) customerQuery.getSingleResult();

                    Query vehicleQuery = em.createNamedQuery("Vehicle.findByVehicleId");
                    vehicleQuery.setParameter("vehicleId", appointment.getVehicleId().getVehicleId());
                    Vehicle vehicle =  (Vehicle) vehicleQuery.getSingleResult();            

                    output += "<div class=appointment-content>" +
                              " <strong>Date</strong> : <a>" + (new SimpleDateFormat("dd.MM.yyyy").format(appointment.getAppointmentDate())) + "</a><br>" +
                      	      " <strong>Time</strong> : <a>" + appointment.getAppointmentTime()+ "</a><br>" +             
                              " <strong>Registration No.</strong> : <a>" + vehicle.getVehicleNumber() + " </a><br>" +
                              " <strong>Status</strong> : <a>" + appointment.getAppointmentStatus() + " </a><br>" +
                              " <strong>Customer</strong> : <a>" + customer.getCustomerName() + " </a><br>" +
                              " <strong>Contact No.</strong> : <a>" + customer.getCustomerPhoneNumber() + " </a><br><br>" +
                            
                              "<a href=\"AppointmentViewMore?appointmentId=" + appointment.getAppointmentId() + "\" class=view-more-btn>View More</a>" +
                            
                              "<a href=\"UpdateAppointment?appointmentId=" + appointment.getAppointmentId() + "\" class=updatde-btn>Updated</a>" +

                              "<a href=\"CompleteAppointment?appointmentId=" + appointment.getAppointmentId() + "\" class=complete-btn>Complete</a>" + 
                            "</div></a><br>" + "_________________________________________________________________________________________________";
                    }                       
                  }
                    request.setAttribute("output", output);
                    request.getRequestDispatcher("workflow-scheduler.jsp").forward(request, response);
        
        } catch (Exception ex){
            ex.printStackTrace();
        }
   
      }
    
    boolean isSameDay(Date todayDate, Date appointmentDate) { // updated
    	return todayDate.getYear() == appointmentDate.getYear() &&
              dateToLocalDate(todayDate).getDayOfYear() == dateToLocalDate(appointmentDate).getDayOfYear();
      // returns true if same day, returns false if not
    }
    
    // https://www.baeldung.com/java-date-to-localdate-and-localdatetime
     LocalDate dateToLocalDate(Date dateToConvert) {
      return dateToConvert.toInstant()
        .atZone(ZoneId.systemDefault())
        .toLocalDate();
    }
    
 } 