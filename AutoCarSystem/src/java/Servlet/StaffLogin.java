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
import javax.servlet.http.HttpSession;
import javax.transaction.UserTransaction;

/**
 *
 * @author asus
 */
@WebServlet (name = "StaffLogin", urlPatterns = {"/StaffLogin"})
public class StaffLogin extends HttpServlet{
    @PersistenceContext EntityManager em;
    @Resource UserTransaction utx;
    
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        
        try {
            String email = request.getParameter("email");
            String password = request.getParameter("password");
            
            Query query = em.createNamedQuery("Staff.findAll");
            List<Staff> staffList = query.getResultList();
            
            String output = "";
            
            for(int i=0; i<staffList.size(); i++) {
                Staff staff = staffList.get(i);
                if(staff.getStaffEmail().equals(email) && staff.getStaffPassword().equals(password)) {
                    HttpSession session = request.getSession();
                    session.setAttribute("staff", staff);
                    session.setAttribute("staffLoggdIn", true);

                    Query appointmentQuery = em.createNamedQuery("Appointment.findAll");
                    List<Appointment> appointmentList = appointmentQuery.getResultList();
                  
                  for (Appointment appointment : appointmentList) {

                    Query customerQuery = em.createNamedQuery("Customer.findByCustomerId");
                    customerQuery.setParameter("customerId", appointment.getCustomerId().getCustomerId());
                    Customer customer =  (Customer) customerQuery.getSingleResult();

                    Query vehicleQuery = em.createNamedQuery("Vehicle.findByVehicleId");
                    vehicleQuery.setParameter("vehicleId", appointment.getVehicleId().getVehicleId());
                    Vehicle vehicle =  (Vehicle) vehicleQuery.getSingleResult();

                    output += "<a>" + appointment.getAppointmentDate() + "</a><br>" +
                      	      "<a>" + appointment.getAppointmentId()+ "</a><br>" +
                      	      "<a>" + customer.getCustomerName() + "</a><br>" +
                              "<a>" + customer.getCustomerPhoneNumber() + "</a><br>" +
                              "<a>" + vehicle.getVehicleNumber() + "</a><br><br>";
                    
                       
                  }

                    request.setAttribute("output", output);
                    response.sendRedirect("staff-profile.jsp?status=staffloggingin");
                }
            }
            
            String message = "Incorrect ID / Email or Password";
            request.setAttribute("message", message);
            request.getRequestDispatcher("staff-login.jsp").forward(request, response);
            
            
        } catch (Exception ex) {
            ex.printStackTrace();
        }
    }
    
}
