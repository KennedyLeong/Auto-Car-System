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
import java.util.List;
import javax.annotation.Resource;
import javax.persistence.Query;
import javax.transaction.UserTransaction;
import java.util.Date;

/**
 *
 * @author asus
 */
@WebServlet(name = "CreateAppointment", urlPatterns = {"/CreateAppointment"})
public class CreateAppointment extends HttpServlet{
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
            
            //String date = request.getParameter("date");
            //String time = request.getParameter("time");
            String vehicleNumber = request.getParameter("vehicleNo");
            //String vehicleType = request.getParameter("");
            String requestType = request.getParameter("serviceType");
            String[] services = request.getParameterValues("services");
            String serviceStr = "";
            double price = 0.0;
            
            //Date appointmentDate = new SimpleDateFormat("yyyy-MM-dd").parse(date); 
            //Date appointmentTime = new SimpleDateFormat("hh:mm:ss").parse(time);
            
            for(int i = 0; i < services.length; i++) {
                if (i > 0) {
                    serviceStr += ", ";
                }
                serviceStr += services[i];
            }
            
            System.out.println(serviceStr);
            
            for (String service : services) {
                switch (service) {
                    case "EngineOil":
                        price += 1.0;
                        break;
                    case "ATF":
                        price += 1.0;
                        break;
                    case "GearOil":
                        price += 1.0;
                        break;
                    case "RadiatorCoolant":
                        price += 1.0;
                        break;
                    case "BrakeFluid":
                        price += 1.0;
                        break;
                    case "PowerSteeringFluid":
                        price += 1.0;
                        break;
                    case "OilFilter":
                        price += 1.0;
                        break;
                    case "FuelFilter":
                        price += 1.0;
                        break;
                    case "BreakPad":
                        price += 1.0;
                        break;
                    case "AirFilter":
                        price += 1.0;
                        break;
                    case "SparkPlugs":
                        price += 1.0;
                        break;
                    case "AircondBelt":
                        price += 1.0;
                        break;
                    case "AlternatorBelt":
                        price += 1.0;
                        break;
                    case "PowerSteeringBelt":
                        price += 1.0;
                        break;
                    case "TimingBelt":
                        price += 1.0;
                        break;
                    case "TimingChain":
                        price += 1.0;
                        break;
                    case "ClutchPlate":
                        price += 1.0;
                        break;
                    case "WaterPump":
                    price += 1.0;
                    break;
                    
                    default:
                }
            }
            
            System.out.println("Total Price is: RM" + price);
            
            //conn = DriverManager.getConnection(host, user, pass);
            
            /*utx.commit();
            Appointment appointment = (date, time, vehicleNumber, vehicleType, requestType, serviceStr);
            em.persist(appointment);
            utx.commit();
            */response.sendRedirect("customer-create-appointment.jsp?success=true");
            
            
        } catch (Exception ex) {
            ex.printStackTrace();
        }
    }
    
}
