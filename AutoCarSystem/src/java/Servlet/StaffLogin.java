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
            
            for(int i=0; i<staffList.size(); i++) {
                Staff staf = staffList.get(i);
                if(staf.getStaffEmail().equals(email) && staf.getStaffPassword().equals(password)) {
                    HttpSession session = request.getSession();
                    session.setAttribute("staff", staf);
                    session.setAttribute("staffLoggdIn", true);
                    
                    response.sendRedirect("staff-login.jsp?status=staffloggingin");
                }
            }
            response.sendRedirect("staff-login.jsp?status=loginfailed");
            
            
        } catch (Exception ex) {
            ex.printStackTrace();
        }
    }
    
}
