/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.annotation.WebServlet;
import Util.Mailer;

/**
 *
 * @author asus
 */
@WebServlet(name = "SendMail", urlPatterns = {"/SendMail"})
public class SendMail extends HttpServlet {
    public void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        response.setContentType("text/html");
        String output= "";
        
        String recipient = request.getParameter("recipientaddress");
        String subject = request.getParameter("subject");
        String msg = request.getParameter("msg");
        
        Mailer.send(recipient, subject, msg);

        output += "Message has been sent successfully";

        request.setAttribute("output", output);
        request.getRequestDispatcher("thank-you.jsp").forward(request, response);

    }
}
