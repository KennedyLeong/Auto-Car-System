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
import java.util.List;
import javax.annotation.Resource;
import javax.persistence.Query;
import javax.transaction.UserTransaction;
import java.util.Date;

/**
 *
 * @author asus
 */
@WebServlet(name = "StaffCreateAppointment", urlPatterns = {"/StaffCreateAppointment"})
public class StaffCreateAppointment extends HttpServlet{
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
            
            String customerID = request.getParameter("id");
            Customer customer = em.find(Customer.class, customerID);
            
            String vehicleID = request.getParameter("vnumber");
            Vehicle vehicle = em.find(Vehicle.class, vehicleID);
            
            String output= "";
            
            String appointmentID = "";
            String date = request.getParameter("date");
            String time = request.getParameter("time");
            String requestType = request.getParameter("serviceType");
            String[] services = request.getParameterValues("services");
            String serviceStr = "";
            String status = "UNPAID";
            double price = 0.0;
            
            Date appointmentDate = new SimpleDateFormat("yyyy-MM-dd").parse(date);
            
             Query query = em.createNamedQuery("Appointment.findAll");
            List<Appointment> appointmentlist = query.getResultList();
            
            if(appointmentlist.size() == 0){
                appointmentID = "AP" + String.format("%06d", appointmentlist.size() + 1);
            } else {
                appointmentID = "AP" + String.format("%06d", appointmentlist.size() + 1);
            }
            
            for(int i = 0; i < services.length; i++) {
                if (i > 0) {
                    serviceStr += ", ";
                }
                serviceStr += services[i];
            }
            
            for (String service : services) {
                switch (service) {
                    case "Engine Oil":
                        price += 120.0;
                        break;
                    case "Automatic Transmission Fluid":
                        price += 75.0;
                        break;
                    case "Gear Oil":
                        price += 80.0;
                        break;
                    case "Radiator Coolant":
                        price += 20.0;
                        break;
                    case "Brake Fluid":
                        price += 20.0;
                        break;
                    case "Power Steering Fluid":
                        price += 35.0;
                        break;
                    case "Oil Filter":
                        price += 40.0;
                        break;
                    case "Fuel Filter":
                        price += 30.0;
                        break;
                    case "Break Pad":
                        price += 50.0;
                        break;
                    case "Air Filter":
                        price += 30.0;
                        break;
                    case "Spark Plugs":
                        price += 20.0;
                        break; 
                    case "Aircond Belt":
                        price += 38.0;
                        break;
                    case "Alternator Belt":
                        price += 60.0;
                        break;
                    case "Power Steering Belt":
                        price += 40.0;
                        break;
                    case "Timing Belt":
                        price += 270.0;
                        break;
                    case "Timing Chain":
                        price += 360.0;
                        break;
                    case "Clutch Plate":
                        price += 280.0;
                        break;
                    case "Water Pump":
                    price += 320.0;
                    break;
                    
                    default:
                }
            }
            
            conn = DriverManager.getConnection(host, user, pass);
            
            utx.begin();
            Appointment appointment = new Appointment( appointmentID, appointmentDate, requestType, serviceStr, status, vehicle, customer, time, price );
            em.persist(appointment);
            utx.commit();
            
            output += "Appointment Successfully Created!";
            
            request.setAttribute("output", output);
            request.getRequestDispatcher("thank-you.jsp").forward(request, response);
            
        } catch (Exception ex){
            ex.printStackTrace();
        }
    }
    
}
