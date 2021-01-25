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
import java.sql.*;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author User
 */
@WebServlet("/InventoryMainServlet")
public class InventoryMainServlet extends HttpServlet {

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
            out.println("<title>Servlet InventoryMainServlet</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet InventoryMainServlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
            response.sendRedirect("stockMenu.jsp");
            
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
    
    protected void doPost(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
        processRequest(request, response);

        String addStock = request.getParameter("addstock");
        String updateStock = request.getParameter("updatestock");
        String deleteStock = request.getParameter("deletestock");
        System.out.print(addStock);
        System.out.print(updateStock);System.out.print(deleteStock);
        
        String stockID;
        String stockName = request.getParameter("stockName");
        String stockDesc = request.getParameter("stockDesc");
        Integer totalAmount = Integer.parseInt(request.getParameter("totalAmount"));
        String supplierID = request.getParameter("supplierID");
        Double unitPrice = Double.parseDouble(request.getParameter("unitPrice"));
        Connection connection = null;
        
        try {
            connection = DriverManager.getConnection("jdbc:derby://localhost:1527/CarWorkshopDB","nbuser","nbuser");
            if (addStock != null){
                Statement statement = connection.createStatement();
                ResultSet resultset = statement.executeQuery("select * from STOCKS") ;
                Integer count = 1;
                
                while(resultset.next()){
                    count++;
                }
                stockID = "ST" + Integer.toString(count);
                System.out.println(stockID);
                String sqlStatement = "INSERT INTO STOCKS(STOCKID,STOCKTYPE,STOCKDESC,TOTALAMOUNT,SUPPLIERID,UNITPRICE) VALUES ('"+ stockID +"','"+ stockName +"','"+ stockDesc +"',"+ totalAmount +",'"+ supplierID +"',"+unitPrice+")";
                System.out.println(sqlStatement);
                //System.out.println(statement.executeUpdate(sqlStatement));
                statement.executeUpdate(sqlStatement);
                
            } else if (updateStock != null){
                Statement statement = connection.createStatement();
                
                stockID = request.getParameter("stockID");
                System.out.println(stockID);
                String sqlStatement = "UPDATE STOCKS SET STOCKTYPE='"+ stockName +"',STOCKDESC='"+ stockDesc +"',TOTALAMOUNT="+ totalAmount +",SUPPLIERID='"+ supplierID +"',UNITPRICE="+unitPrice+" WHERE STOCKID='"+ stockID +"'";
                System.out.println(sqlStatement);
                //System.out.println(statement.executeUpdate(sqlStatement));
                statement.executeUpdate(sqlStatement);
            } else {
                Statement statement = connection.createStatement();
                
                stockID = request.getParameter("stockID");
                System.out.println(stockID);
                String sqlStatement = "DELETE FROM STOCKS WHERE STOCKID='"+ stockID +"'";
                System.out.println(sqlStatement);
                //System.out.println(statement.executeUpdate(sqlStatement));
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
