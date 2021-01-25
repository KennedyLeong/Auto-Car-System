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
public class supplierManage extends HttpServlet {

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
            out.println("<title>Servlet supplierManage</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet supplierManage at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
            response.sendRedirect("supplier.jsp");
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
        
        String addSupplier = request.getParameter("addsupplier");
        String updateSupplier = request.getParameter("updatesupplier");
        String deleteSupplier = request.getParameter("deletesupplier");
        System.out.print(addSupplier);
        System.out.print(updateSupplier);System.out.print(deleteSupplier);
        
        String supplierID;
        String supplierName = request.getParameter("supplierName");
        String supplierAddress = request.getParameter("supplierAddress");
        String supplierContact = request.getParameter("supplierContact");
        String supplierType = request.getParameter("supplierType");
        Connection connection = null;
        
        try {
            connection = DriverManager.getConnection("jdbc:derby://localhost:1527/CarWorkshopDB","nbuser","nbuser");
            if (addSupplier != null){
                Statement statement = connection.createStatement();
                ResultSet resultset = statement.executeQuery("select * from SUPPLIERS") ;
                Integer count = 1;
                
                while(resultset.next()){
                    count++;
                }
                supplierID = "SP" + Integer.toString(count);
                System.out.println(supplierID);
                String sqlStatement = "INSERT INTO SUPPLIERS(SUPPLIERID,SUPPLIERNAME,SUPPLIERADDRESS,SUPPLIERCONTACT,SUPPLIERTYPE) VALUES ('"+ supplierID +"','"+ supplierName +"','"+ supplierAddress +"','"+ supplierContact +"','"+ supplierType +"')";
                System.out.println(sqlStatement);
                System.out.println(statement.executeUpdate(sqlStatement));
                statement.executeUpdate(sqlStatement);
                
            } else if (updateSupplier != null){
                Statement statement = connection.createStatement();
                
                supplierID = request.getParameter("supplierID");
                System.out.println(supplierID);
                String sqlStatement = "UPDATE SUPPLIERS SET SUPPLIERNAME='"+ supplierName +"',SUPPLIERADDRESS='"+ supplierAddress +"',SUPPLIERCONTACT='"+ supplierContact +"',SUPPLIERTYPE='"+ supplierType +"' WHERE SUPPLIERID='"+ supplierID +"'";
                System.out.println(sqlStatement);
                System.out.println(statement.executeUpdate(sqlStatement));
                statement.executeUpdate(sqlStatement);
            } else {
                Statement statement = connection.createStatement();
                
                supplierID = request.getParameter("supplierID");
                System.out.println(supplierID);
                String sqlStatement = "DELETE FROM SUPPLIERS WHERE SUPPLIERID='"+ supplierID +"'";
                System.out.println(sqlStatement);
                System.out.println(statement.executeUpdate(sqlStatement));
                statement.executeUpdate(sqlStatement);
            }
            
        } catch (SQLException ex) {
            ex.getStackTrace();
       
    } finally {
            try {
                connection.close();
            } catch (SQLException ex) {
                Logger.getLogger(InventoryMainServlet.class.getName()).log(Level.SEVERE, null, ex);
            }
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
