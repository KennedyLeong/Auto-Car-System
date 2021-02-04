/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author User
 */

@WebServlet (name = "billingServlet", urlPatterns = {"/billingServlet"})
public class billingServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet billingServlet</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet billingServlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }


    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        //processRequest(request, response);
        
        String output= "";
        
        String proceed = request.getParameter("proceed");
        String back = request.getParameter("back");
        String appointmentID = request.getParameter("appointmentIDSelect");
        String page = "create-appointment.jsp";
        
        try {
        
        if (proceed != null){
            System.out.println(appointmentID);
            request.setAttribute("appID", appointmentID);
            page = "Billing.jsp";
            //request.getRequestDispatcher(page).forward(request,response);
            //return;
            
        }else if (back != null){
            System.out.println(back);
            page = "customer-profile.jsp";
            //request.getRequestDispatcher(page).forward(request,response);
            //return;
        }
        request.getRequestDispatcher(page).forward(request,response);
        return;
        
        } catch (Exception ex) {
            ex.printStackTrace();
            
            output = "No Appointment found.";
            
            request.setAttribute("output", output);
            request.getRequestDispatcher("customer-create-appointment.jsp").forward(request, response);
        }
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
