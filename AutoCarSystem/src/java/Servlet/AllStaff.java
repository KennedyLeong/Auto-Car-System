/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlet;

/**
 *
 * @author asus
 */

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

@WebServlet (name = "AllStaff", urlPatterns = {"/AllStaff"})
public class AllStaff extends HttpServlet{
    @PersistenceContext EntityManager em;
    @Resource UserTransaction utx;
    
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        try {
            
            String output = "";
            
            Query staffQuery = em.createNamedQuery("Staff.findAll");
            List<Staff> staffList = staffQuery.getResultList();
            
            for (Staff staff : staffList) {
                
                output += "<div class=staff-content>" + 
                            "<strong>ID</strong> : <a>" + staff.getStaffId() + "</a>" +
                            "&nbsp;&nbsp;&nbsp;&nbsp;<strong>Full Name</strong> : <a>" + staff.getStaffName() + "</a>" +
                            "&nbsp;&nbsp;&nbsp;&nbsp;<strong>Phone Number</strong> : <a>" + staff.getStaffPhoneNumber() + "</a>" +
                            "&nbsp;&nbsp;&nbsp;&nbsp;<strong>Email</strong> : <a>" + staff.getStaffEmail() + "</a>" +
                            "&nbsp;&nbsp;&nbsp;&nbsp;<strong>Status</strong> : <a>" + staff.getStaffStatus() + "</a></div><br>" +
                            "<a href=\"StatusDeactive?id=" + staff.getStaffId() + "\" class=deactive-btn>Deactive</a>" +
                            "<a href=\"StatusActive?id=" + staff.getStaffId() + "\" class=active-btn>Active</a><br>";
            }
            
            request.setAttribute("output", output);
            request.getRequestDispatcher("all-staff.jsp").forward(request, response);
            
        } catch (Exception ex) {
            ex.printStackTrace();
        }
    }
}
