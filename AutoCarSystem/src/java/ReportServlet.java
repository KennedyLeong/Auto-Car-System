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
@WebServlet (name = "ReportServlet", urlPatterns = {"/ReportServlet"})
public class ReportServlet extends HttpServlet {

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
            /* TODO output your page here. You may use following sample code. */
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

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
        
        String reportException = request.getParameter("appointment");
        String vehicleTransaction = request.getParameter("vTrans");
        String reportTransaction = request.getParameter("History");
        String stockReport = request.getParameter("stocksold");
        System.out.println(reportException);System.out.println(vehicleTransaction);System.out.println(reportTransaction);System.out.println(stockReport);
        
        String vehicle = request.getParameter("vehicleSelectReport");
        System.out.println(vehicle);
        String stock = request.getParameter("stockSelectReport");
        System.out.println(stock);
        Integer month = Integer.parseInt(request.getParameter("month"));
        System.out.println(month);
        if (reportException != null){
            System.out.println(reportException);
            response.sendRedirect("reportAppointmentEx.jsp");
        
        }else if (vehicleTransaction != null){
            System.out.println(vehicleTransaction);
            request.setAttribute("vehicle",vehicle);
            request.getRequestDispatcher("reportVehicleTransaction.jsp").forward(request,response);
            
            
        
        }else if (reportTransaction != null){
            System.out.println(reportTransaction);
            String url = "RTransaction.jsp";
            request.setAttribute("date", month);
            request.getRequestDispatcher(url).forward(request,response);
        
        }else if (stockReport != null){
            System.out.println(stockReport);
            response.sendRedirect("reportStockSold.jsp");
            
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
