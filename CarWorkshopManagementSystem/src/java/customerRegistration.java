/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package Servlet;

import java.sql.*;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.UserTransaction;
import javax.annotation.Resource;


/**
 *
 * @author asus
 */

public class customerRegistration extends HttpServlet {
    
    @PersistenceContext EntityManager em;
    @Resource UserTransaction utx;
    
    private String host = "jdbc:derby://1527/XXXX";
    private String user = "nbuser";
    private String pass = "nbuser";
    private Connection conn;
    private PreparedStatement stmt;
    private ResultSet rs;
    
    conn = DriverManager.getConnection(host,user,pass);
    
    stmt = conn.prepareStatement

    
}
