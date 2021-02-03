<%-- 
    Document   : appointment
    Created on : Dec 18, 2020, 11:40:49 AM
    Author     : asus
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="customer" scope="session" class="Entity.Customer" />
<jsp:useBean id="staff" scope="session" class="Entity.Staff" />
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Appointment</title>
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
            
            h1 {
                font-family: Arial, Helvetica, sans-serif;
                margin-top: 50px;
                margin-bottom: 35px;
                margin-left: 35px;
            }
            
            .back-btn {
                font-family: Arial, Helvetica, sans-serif;
                margin-left: 30px;
                margin-top: 20px;
                height: 35px;
                width: 100px;
            }
            
            .view-more-btn {
               font-family: Arial, Helvetica, sans-serif;
               border: 1px solid black;
               padding: 10px;
               border-radius: 5px;
            }
            
            .reschedule-btn {
               font-family: Arial, Helvetica, sans-serif;
               border: 1px solid black;
               padding: 10px;
               margin-left: 20px;
               border-radius: 5px;
            }
            
            .transfer-btn {
               font-family: Arial, Helvetica, sans-serif;
               border: 1px solid black;
               padding: 10px;
               margin-left: 20px;
               border-radius: 5px;
            }

            .appointment-content {
                font-family: Arial, Helvetica, sans-serif;
                border: 1px solid black;
                width: 500px;
                margin-left: 50px;
                padding: 25px;
                border-radius: 5px
            }

            .appointment-btn {
                font-family: Arial, Helvetica, sans-serif;
                margin-left: 60px;
                height: 38px;
                width: 180px;
            }
            
            .result-tbl {
                margin-top: 30px;
            }
        </style>
    </head>
    
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
    
    <body>
        <button onclick="document.location='workflow-scheduler.jsp'" class="back-btn">Back</button>
        
        <h1>APPOINTMENT LIST</h1>
         <button onclick="document.location='validate-customer.jsp'" class="appointment-btn">Create Appointment</button>
         <div class="result-tbl">${output}</div>       
    </body>
</html>
