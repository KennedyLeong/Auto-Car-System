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
import java.time.LocalDate;
import java.util.Date;
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
public class quotationStaff extends HttpServlet {

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
            String emails = "";
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet quotationStaff</title>");            
            out.println("</head>");
            out.println("<body onload=\"alert('PO Successfully generated. Don't forget to send.)\">");
            out.println("<h1>Purchase Order Generated.</h1>");
            out.println("</body>");
            out.println("</html>");
            
            String sendpo = request.getParameter("sendpo");
            
            String qoID = request.getParameter("qoID");
            String stockName = null;
            String description = null;
            Double totalAmount = null;
            Integer quantity = null;
            
            if(sendpo != null){
                Connection connection;
            try {
                connection = DriverManager.getConnection("jdbc:derby://localhost:1527/CarWorkshopDB","nbuser","nbuser");
                Statement statement = connection.createStatement() ;
                ResultSet resultset = statement.executeQuery("SELECT QUOTATION.STOCKNAME,QUOTATION.STOCKDESC,QUOTATION.TOTALAMOUNT,QUOTATION.STOCKQUANTITY,SUPPLIERS.SUPPLIERCONTACT from SUPPLIERS,QUOTATION WHERE QUOTATION.QUOTATIONID='"+qoID+"' AND QUOTATION.SUPPLIERID=SUPPLIERS.SUPPLIERID");
                
                while(resultset.next()){
                    emails += resultset.getString(5);
                    stockName = resultset.getString(1);
                    description = resultset.getString(2);
                    totalAmount = Double.parseDouble(resultset.getString(3));
                    quantity = Integer.parseInt(resultset.getString(4));
                    System.out.println(emails);
                }
            } catch (SQLException ex) {
                Logger.getLogger(procurementServlet.class.getName()).log(Level.SEVERE, null, ex);
            }
                
                out.println("<a href=\"mailto:"+emails+"?subject=Placement of Purchase Order for("+ stockName +","+ totalAmount +")&body=Send a quotation with link below.%20http://localhost:8080/carWorkshopSystem2/quotationSupplier.jsp\"><input type=\"submit\" class=\"btn btn-primary\" value = \"Send Quotations\" id=\"quotation\" name=\"quotation\"></a>");

            }
            
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
        
        String sendpo = request.getParameter("sendpo");
        String updatepo = request.getParameter("updatepo");
        String deletepo = request.getParameter("deletepo");
        System.out.print(sendpo);
        System.out.print(updatepo);System.out.print(deletepo);
        
        String poID;
        String stockName=null;
        String stockDesc=null;
        LocalDate poDate = java.time.LocalDate.now();
        System.out.println(poDate);
        Double totalAmount=null;
        Integer quantity=null;
        String poStatus="PENDING";
        String qoID = request.getParameter("qoID");
        
        
        String supplierID = request.getParameter("supplierID");
        Connection connection = null;
        
        try {
            connection = DriverManager.getConnection("jdbc:derby://localhost:1527/CarWorkshopDB","nbuser","nbuser");
            if (sendpo != null){
                Statement statement = connection.createStatement();
                ResultSet resultset = statement.executeQuery("select * from PURCHASEORDER") ;
                Integer count = 1;
                
                while(resultset.next()){
                    count++;
                }
                poID = "PO" + Integer.toString(count);
                System.out.println(poID);
                
                ResultSet resultset2 = statement.executeQuery("SELECT * FROM QUOTATION WHERE QUOTATIONID ='"+qoID+"'");
                
                while(resultset2.next()){
                
                stockName = resultset2.getString(3);
                stockDesc = resultset2.getString(6);
                totalAmount = Double.parseDouble(resultset2.getString(4));
                quantity= Integer.parseInt(resultset2.getString(5));
                
                }
                System.out.println(stockName);
                System.out.println(stockDesc);
                System.out.println(totalAmount);
                System.out.println(quantity);
  
                
               String sqlStatement = "INSERT INTO PURCHASEORDER VALUES ('"+ poID +"','"+ stockName +"','"+ stockDesc +"','"+poDate+"',"+ totalAmount +","+quantity+",'"+poStatus+"','"+ qoID +"')";
               System.out.println(sqlStatement);
               System.out.println(statement.executeUpdate(sqlStatement));
               statement.executeUpdate(sqlStatement);
                
            } else if (updatepo != null){
                
                Statement statement = connection.createStatement();
                poID = request.getParameter("poIDSelect");
                ResultSet resultset = statement.executeQuery("select * from PURCHASEORDER WHERE POID='"+poID+"'");
                System.out.println(poID);
                String poStatusGet;
                
                while(resultset.next()){
                    poStatusGet = resultset.getString(7);
                    
                    if(poStatusGet.equals("PENDING"))
                    {
                    String sqlStatement = "UPDATE PURCHASEORDER SET POSTATUS='RECEIVED' WHERE POID='"+ poID +"'";
                    System.out.println(sqlStatement);
                    System.out.println(statement.executeUpdate(sqlStatement));
                    statement.executeUpdate(sqlStatement);
                    response.sendRedirect("quotationStaff.jsp");
                    }else
                    {
                    String sqlStatement = "UPDATE PURCHASEORDER SET POSTATUS='PENDING' WHERE POID='"+ poID +"'";
                    System.out.println(sqlStatement);
                    System.out.println(statement.executeUpdate(sqlStatement));
                    statement.executeUpdate(sqlStatement);
                    response.sendRedirect("quotationStaff.jsp");
                    }
                }
                
                
                
            } else {
                Statement statement = connection.createStatement();
                
                String sqlStatement = "DELETE FROM QUOTATION";
                System.out.println(sqlStatement);
                System.out.println(statement.executeUpdate(sqlStatement));
                statement.executeUpdate(sqlStatement);
                response.sendRedirect("procurement.jsp");
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
