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
import javax.annotation.Resource;
import javax.transaction.UserTransaction;

/**
 *
 * @author asus
 */
@WebServlet(name = "CancelAppointment", urlPatterns = {"/CancelAppointment"})
public class CancelAppointment extends HttpServlet{
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
            
            String appointmentID = request.getParameter("appointmentId");
            String status = "CANCEL";
                    
            Appointment appointment = em.find(Appointment.class, appointmentID);
            
            conn = DriverManager.getConnection(host, user, pass);
            
            utx.begin();
            appointment.setAppointmentStatus(status);
            em.merge(appointment);
            utx.commit();
            response.sendRedirect("appointment.jsp?status=successful");
            
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        
    }
    
}
