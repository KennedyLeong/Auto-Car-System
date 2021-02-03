<%-- 
    Document   : reschedule-appointment
    Created on : Jan 31, 2021, 3:17:07 PM
    Author     : asus
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="customer" scope="session" class="Entity.Customer" />
<jsp:useBean id="staff" scope="session" class="Entity.Staff" />
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Reschedule Appointment</title>
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
                margin-top: 45px;
                margin-left: 35px;
            }
            
            .appointment-tbl input {
                border-top-style: hidden;
                border-right-style: hidden;
                border-left-style: hidden;
                border-bottom-style: groove;
            }
            
            .date-label {
                font-family: Arial, Helvetica, sans-serif;
                margin-left: 80px;
                margin-top: 30px;
            }
            
            .date-input {
                margin-left: 85px;
                text-align: center;
            }
            
            .time-label {
                font-family: Arial, Helvetica, sans-serif;
                margin-left: 80px;
                margin-top: 20px;
            }
            
            .time-input {
                margin-left: 85px;
                width: 170px;
                text-align: center;
            }
            
            .notice-label {
                font-family: Arial, Helvetica, sans-serif;
                font-size: 13px;
                margin-top: 15px;
                margin-left: 80px;
            }
                      
            .submit-btn {
                font-family: Arial, Helvetica, sans-serif;
                margin-left: 70px;
                margin-top: 40px;
                height: 35px;
                width: 100px;
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
        <form action="RescheduleAppointment" method="POST">
            
            <h1>Reschedule Appointment</h1>
            
            <input type="hidden" name="id" value="<%= request.getParameter("id") %>"><br>
            
            <label for="date" class="date-label">Date</label>
            <input type="date" name="date" class="date-input" id="datePicker" required=""><br>

            <script>
                datePicker.min = new Date().toISOString().split("T")[0];
            </script>

            <label for="time" class="time-label">Time</label>
            <input type="time" name="time" class="time-input" min="08:00" max="15:00" step="600" required=""><br>
            <div class="notice-label">&lowast; Appointment only can be made from 8:00 A.M. to 3:00 P.M.</div>

            <input type="submit" value="Submit" class="submit-btn">
        </form>
    </body>
</html>
