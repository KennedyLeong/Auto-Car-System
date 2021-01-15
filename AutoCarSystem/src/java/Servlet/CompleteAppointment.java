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
import javax.persistence.Query;
import javax.transaction.UserTransaction;

/**
 *
 * @author asus
 */
@WebServlet(name = "CompleteAppointment", urlPatterns = {"/CompleteAppointment"})
public class CompleteAppointment extends HttpServlet{
    @PersistenceContext EntityManager em;
    @Resource UserTransaction utx;
    
    private String host = "jdbc:derby://localhost:1527/CarWorkshopDB";
    private String user = "nbuser";
    private String pass = "nbuser";
    
    private Connection conn;
    private PreparedStatement stmt;
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        try {
            
            //Update Appointment Status from "IN PROGRESS" to "COMPLETE"
            
            //Reduce the Item Quantity by 1 for every Checkbox Tick.

            String appointmentId = request.getParameter("appointmentId");
            String status = "COMPLETE";
            
            Query appointmentQuery = em.createNamedQuery("Appointment.findByAppointmentId");
            appointmentQuery.setParameter("appointmentId", appointmentId);
            Appointment appointment = (Appointment) appointmentQuery.getSingleResult();
 
            String serviceStr = appointment.getAppointmentServicestr();
            String[] services = serviceStr.split(",");

            Query itemQuery = em.createNamedQuery("Item.findByItemName");
            
            for(String service : services) {
                
                try {
                itemQuery.setParameter("itemName", service.trim());
                Item item = (Item) itemQuery.getSingleResult(); // 
                item.setItemQuantity(item.getItemQuantity() - 1);
                utx.begin();
                em.merge(item);
                utx.commit();
              } catch (Exception ex) {
              	System.out.println("Error with updating " + service + "."); 
              }
                    
            }

            appointment.setAppointmentStatus(status);
            
            conn = DriverManager.getConnection(host, user, pass);
            
            utx.begin();
            em.merge(appointment);
            utx.commit();
            response.sendRedirect("workflow-scheduler.jsp?status=EndService");

        } catch (Exception ex) {
            ex.printStackTrace();
        }
    }
    
}
