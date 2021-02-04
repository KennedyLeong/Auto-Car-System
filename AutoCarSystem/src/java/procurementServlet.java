/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.*;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author User
 */
public class procurementServlet extends HttpServlet {

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
            
            String emails = "";
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet procurementServlet</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Confirm Request</h1>");
            Connection connection;
            try {
                connection = DriverManager.getConnection("jdbc:derby://localhost:1527/CarWorkshopDB","nbuser","nbuser");
                Statement statement = connection.createStatement() ;
                ResultSet resultset = statement.executeQuery("select SUPPLIERCONTACT from SUPPLIERS WHERE SUPPLIERTYPE='"+ request.getParameter("stockSelectP") +"'");
                
                while(resultset.next()){
                    emails += resultset.getString(1);
                    System.out.println(emails);
                }
            } catch (SQLException ex) {
                Logger.getLogger(procurementServlet.class.getName()).log(Level.SEVERE, null, ex);
            }
            
            out.println("<a href=\"mailto:"+emails+"?subject=Request For Quotation("+ request.getParameter("stockSelectP")+","+ request.getParameter("totalAmount") +")&body=Send a quotation with link below.%20http://localhost:8080/AutoCarSystem/quotationSupplier.jsp\"><input type=\"submit\" class=\"btn btn-primary\" value = \"Send Quotations\" id=\"quotation\" name=\"quotation\"></a>");

            out.println("<form action=\"procurement.jsp\">");
            out.println("<input type=\"submit\" class=\"btn btn-primary\" value = \"Back\" name=\"back\"  >");
            out.println("</form>");
            
            out.println("<form action=\"index.jsp\">");
            out.println("<input type=\"submit\" class=\"btn btn-primary\" value = \"Home\" name=\"back\"  >");
            out.println("</form>");
            
            
            out.println("<script type=\"text/javascript\">");
            out.println("function formAutoSubmit () {");
            out.println("document.getElementById('quotationquotation').click();");
            out.println("}");
            out.println("</script>");
            
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
    
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
        
        System.out.println(request.getParameter("stockSelectP"));
        
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
