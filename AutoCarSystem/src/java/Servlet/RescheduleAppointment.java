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
import java.text.SimpleDateFormat;
import javax.annotation.Resource;
import javax.persistence.Query;
import javax.transaction.UserTransaction;

/**
 *
 * @author asus
 */
@WebServlet(name = "RescheduleAppointment", urlPatterns = {"/RescheduleAppointment"})
public class RescheduleAppointment extends HttpServlet{
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
            
            String output = "" ;
        
        try {
            
            String appointmentID = (String)request.getParameter("id");
            String date = request.getParameter("date");
            String time = request.getParameter("time");
            
            java.util.Date appointmentDate = new SimpleDateFormat("yyyy-MM-dd").parse(date);
            
            Query appointmentQuery = em.createNamedQuery("Appointment.findByAppointmentId");
            appointmentQuery.setParameter("appointmentId", appointmentID);
            Appointment appointment = (Appointment) appointmentQuery.getSingleResult();
            
            appointment.setAppointmentDate(appointmentDate);
            appointment.setAppointmentTime(time);
            
            utx.begin();
            em.merge(appointment);
            utx.commit();
            
            output += "Successfully reschedule appointment";
            
            request.setAttribute("output", output);
            request.getRequestDispatcher("thank-you.jsp").forward(request, response);
            
            
        } catch (Exception ex) {
            
            output += "Error";
            
            request.setAttribute("output", output);
            request.getRequestDispatcher("reschedule-appointment.jsp").forward(request, response);
        }
    }
    
}
