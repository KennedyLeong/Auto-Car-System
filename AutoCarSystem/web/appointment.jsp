<%-- 
    Document   : appointment
    Created on : Dec 18, 2020, 11:40:49 AM
    Author     : asus
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="customer" scope="session" class="Entity.Customer" />
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
                padding: 60px;
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
            
            .appointment-tbl {
                font-family: Arial, Helvetica, sans-serif;
                border: 1px solid black;
                width: 1000px;
                margin-left: 50px;
                border-radius: 3px
            }
            
            .appointment-tbl input {
                border-top-style: hidden;
                border-right-style: hidden;
                border-left-style: hidden;
                border-bottom-style: hidden;
            }
            
            .date-label {
              margin-left: 15px;  
            }
            
            .first-input {
                margin-top: 5px;
                width: 300px;
            }
            
            .name-label {
                margin-left: 15px;
            }
            
            .second-input {
                width: 250px;
                padding-bottom: 5px;
            }
            
            .phoneno-label {
                
            }
            
            .third-input {
                width: 200px;
            }
            
            .vehicleno-label {
                
            }
            
            .fourth-input {
                width: 100px;
            } 
            
            .appointment-view-btn {
                font-family: Arial, Helvetica, sans-serif;
                margin-left: 40px;
                height: 30px;
                width: 110px;
            }
            
            
            .appointment-btn {
                font-family: Arial, Helvetica, sans-serif;
                margin-left: 60px;
                margin-top: 40px;
                height: 38px;
                width: 180px;
            }
            
        </style>
    </head>
    
    <% if (request.getSession().getAttribute("customerLoggedIn") != null) {%>
        <div class="navigation-bar">    
            <ul>
                <li><a href="main-menu.jsp">HOME</a></li>
                <li><a href="workflow-scheduler.jsp">WORKFLOW SCHEDULER</a></li>
                <li><a href="search-customer.jsp">CRM</a></li>
                <li><a href="#">BILLING</a></li>
                <li><a href="#">INVENTORY</a></li>
                <li><a href="#">REPORT</a></li>
                <li><a href="customer-profile.jsp"><%= customer.getCustomerName()%></a></li>
            </ul>
        </div>
        <%} else {%>
        <div class="navigation-bar">    
            <ul>
                <li><a href="main-menu.jsp">HOME</a></li>
                <li><a href="workflow-scheduler.jsp">WORKFLOW SCHEDULER</a></li>
                <li><a href="search-customer.jsp">CRM</a></li>
                <li><a href="#">BILLING</a></li>
                <li><a href="#">INVENTORY</a></li>
                <li><a href="#">REPORT</a></li>
                <li><a href=staff-login.jsp>SECURITY</a></li>             
            </ul>
        </div>
        <%}%>
    
    <body>
        <button onclick="document.location='main-menu.jsp'" class="back-btn">Back</button>
        
        <h1>Appointment</h1>
        
        <div class="appointment-tbl">
            <label for="date" class="date-label">Date</label>
            <input type="text" name="date" class="first-input" placeholder="28 January 2020" readonly><br>
            
            <label for="cname" class="name-label">Name</label>
            <input type="text" name="cname" class="second-input" placeholder="Ismael Bin Hassan" readonly>
            
            <label for="cemail" class="phoneno-label">Phone No.</label>
            <input type="text" name="cemail" class="third-input" placeholder="019 851 6548" readonly>
            
            <label for="vehicleno" class="vehicleno-label">Vehicle No.</label>
            <input type="text" name="vehicleno" class="fourth-input" placeholder="SD9321N" readonly>
            
            <button class="appointment-view-btn" onclick="document.location='view-appointment.jsp'">View</button>
            
        </div>
        
        <button onclick="document.location='create-appointment.jsp'" class="appointment-btn">Create Appointment</button>
    </body>
</html>
