/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author User
 */
public class quotationSupplier extends HttpServlet {

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
            out.println("<title>Servlet quotationSupplier</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet quotationSupplier at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
            response.sendRedirect("index.jsp");
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
        
        String addquotation = request.getParameter("addquotation");
        
        System.out.print(addquotation);

        String supplierID = null; //need to get from company name
        String quotationID; //need to generate
        String companyName = request.getParameter("companyName");
        System.out.print(companyName);
        String stockName = request.getParameter("stockSelectP");
        System.out.print(stockName);
        String stockDesc = request.getParameter("stockDesc");
        System.out.print(stockDesc);
        Integer quantity = Integer.parseInt(request.getParameter("quantity"));
        System.out.print(quantity);
        Double totalPrice = Double.parseDouble(request.getParameter("totalPrice"));
        System.out.print(totalPrice);
        
        Connection connection = null;
        try {
                connection = DriverManager.getConnection("jdbc:derby://localhost:1527/CarWorkshopDB","nbuser","nbuser");
                Statement statement = connection.createStatement();
                ResultSet resultset = statement.executeQuery("SELECT * from QUOTATION");
                Integer count = 1;
                while(resultset.next()){
                    count++;
                }
                quotationID = "QO" + Integer.toString(count);
                System.out.println(quotationID);
                
                ResultSet resultset2 = statement.executeQuery("SELECT SUPPLIERID FROM SUPPLIERS WHERE SUPPLIERNAME='"+companyName+"'");
                
                while(resultset2.next()){
                    supplierID=resultset2.getString(1);System.out.println(supplierID);
                }
                
                String sqlStatement = "INSERT INTO QUOTATION VALUES ('"+ quotationID +"','"+ supplierID +"','"+ stockName +"',"+ totalPrice +","+ quantity +",'"+ stockDesc +"')";
                System.out.println(sqlStatement);
                System.out.println(statement.executeUpdate(sqlStatement));
                statement.executeUpdate(sqlStatement);
                
            
            
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
