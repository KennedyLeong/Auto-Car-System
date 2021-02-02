<%-- 
    Document   : staff-send-notification
    Created on : Jan 15, 2021, 6:06:57 PM
    Author     : asus
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="customer" scope="session" class="Entity.Customer" />
<jsp:useBean id="staff" scope="session" class="Entity.Staff" />
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Send Notification</title>
        <link href="bootstrap/css/bootstrap.css" rel="stylesheet" type="text/css"/>
        <link href="bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <style>
            .navigation-bar {
                font-family: Arial, Helvetica, sans-serif;
                height: 35px;
                padding-top: 6px;
                background-color: #cccccc; 
            }
            
            a {
                text-decoration: none;
                color: black;
            }
            
            ul {
                text-align:center;
                list-style-type: none;
            }
            
            li{
                display: inline;
                padding: 50px;
                font-size: 15px;
            }
            
            .back-btn {
                font-family: Arial, Helvetica, sans-serif;
                margin-left: 45px;
                margin-top: 20px;
                height: 35px;
                width: 100px;
            }
            
            h1 {
                margin-top: 35px;
                margin-left: 50px;
                font-family: Arial, Helvetica, sans-serif;
            }
            
            .recipient-tbl input {
                border-top-style: hidden;
                border-right-style: hidden;
                border-left-style: hidden;
                border-bottom-style: groove;
            }
            
            .to-label {
                font-family: Arial, Helvetica, sans-serif;
                margin-top: 15px;
                margin-left: 50px;
            }
            
            .email-input {
                margin-left: 40px;
                width: 300px;
            }
            
            .subject-label {
                font-family: Arial, Helvetica, sans-serif;
                margin-left: 50px;
            }
            
            .subject-input {
                margin-top: 15px;
                margin-left: 114px;
                width: 300px;
            }
            
            .message-label {
                font-family: Arial, Helvetica, sans-serif;
                margin-top: 30px;
                margin-left: 50px;
            }
            
            .message-input {
                width: 500px;
                height: 250px;
                border-radius: 10px;
                margin-top: 10px;
                margin-left: 45px;
            }
            
            .send-btn {
                font-family: Arial, Helvetica, sans-serif;
                margin-left: 45px;
                margin-top: 20px;
                height: 35px;
                width: 100px;
            }
            
            .all-btn {
                font-family: Arial, Helvetica, sans-serif;
                margin-left: 50px;
                height: 28px;
                width: 100px;
            }
            
            .failed-tbl {
                font-family: Arial, Helvetica, sans-serif;
                margin-top: 15px;
                margin-left: 45px;
                font-size: 18px;
                color: red;
                
            }
            
        </style>
        
        <% if (request.getSession().getAttribute("customerLoggedIn") != null) {%>
        <div class="navigation-bar">    
            <ul>
                <li><a href="Billing.jsp">BILLING</a></li>
                <li><a href="customer-profile.jsp"><%= customer.getCustomerName()%></a></li>
            </ul>
        </div>
        <%} else if (request.getSession().getAttribute("managerLoggdIn") != null) {%>
        <div class="navigation-bar">    
            <ul>
                <li><a href="main-menu.jsp">HOME</a></li>
                <li><a href="workflow-scheduler.jsp">WORKFLOW SCHEDULER</a></li>
                <li><a href="search-customer.jsp">CRM</a></li>
                <li><a href="inventoryMain.jsp">INVENTORY</a></li>
                <li><a href="supplier.jsp">SUPPLIERS</a></li>
                <li><a href="procurement.jsp">PROCUREMENT</a></li>
                <li><a href="manager-profile.jsp"><%= staff.getStaffName()%></a></li>             
            </ul>
        </div>
        <%} else if (request.getSession().getAttribute("staffLoggdIn") != null) {%>
        <div class="navigation-bar">    
            <ul>
                <li><a href="main-menu.jsp">HOME</a></li>
                <li><a href="workflow-scheduler.jsp">WORKFLOW SCHEDULER</a></li>
                <li><a href="search-customer.jsp">CRM</a></li>
                <li><a href="inventoryMain.jsp">INVENTORY</a></li>
                <li><a href="supplier.jsp">SUPPLIERS</a></li>
                <li><a href="procurement.jsp">PROCUREMENT</a></li>
                <li><a href="staff-profile.jsp"><%= staff.getStaffName()%></a></li>             
            </ul>
        </div>
        <%} else {%>
        <div class="navigation-bar">    
            <ul>
                <li><a href="index.jsp">HOME</a></li>
                <li><a href="staff-login.jsp">SECURITY</a></li>    
            </ul>
        </div>
        <%}%>
    </head>
    <body>
        <button onclick="document.location='search-customer.jsp'" class="back-btn">Back</button>
        <h1>Send Notification</h1>
                <form action="AllEmail" method="GET" id="mailform"> 
                    <button class="all-btn" form="mailform">All</button><br>
                </form>
        <form action="SendMail">
            <div class="recipient-tbl">
                <label for="recipientaddress" class="to-label">Recipient Address</label>
                <input  type="textbox" name="recipientaddress" value="${emailStr}" class="email-input" required=""><br>

                <label for="subject" class="subject-label">Subject</label>
                <input type="textbox" name="subject" class="subject-input" required=""><br> 

                <label for="msg" class="message-label">Message</label>
            </div>


                <textarea  maxlength="250" name="msg" placeholder="Maximum character 250..." class="message-input" required=""></textarea><br>

            <button class="send-btn">Send</button><br>  
            <div class="failed-tbl">${output}</div>
            </form>
    </body>
</html>
