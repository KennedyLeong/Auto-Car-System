<%-- 
    Document   : view-vehicle-details
    Created on : Jan 7, 2021, 10:48:48 PM
    Author     : asus
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="customer" scope="session" class="Entity.Customer" />
<%@page import="Entity.Vehicle, java.util.*" %>
<% List<Vehicle> vehicleList = (List<Vehicle>) session.getAttribute("vehicleList"); %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Vehicle Details</title>
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
            
            .return-btn {
                font-family: Arial, Helvetica, sans-serif;
                float: left;
                margin-top: 25px;
                margin-left: 40px;
                width: 110px;
                height: 30px;
                font-size: 16px;
            }
            
            h1 {
               font-family: Arial, Helvetica, sans-serif;
               margin-left: 80px;
            }
            
            .vehicle-first-input {
                margin-left: 70px;
                width: 300px; 
            }
            
            .vehicle-second-input {
                margin-left: 125px;
                width: 300px;
                margin-top: 15px;
            }
            
            .vehicle-third-input {
                margin-left: 133px;
                width: 300px;
                margin-top: 15px;
            }
            
            .vehicle-fourth-input {
                margin-left: 130px;
                width: 300px;
                margin-top: 15px;
            }
            
            .vehicle-fifth-input {
                margin-left: 113px;
                width: 300px;
                margin-top: 15px;
            }
            
            .vehicle-table {
               font-family: Arial, Helvetica, sans-serif;
               border: 1px solid black;
               border-radius: 10px;
               margin-left: 125px;
               padding: 20px;
               width: 625px;
            }
            
            .vehicle-table input {
                border-top-style: hidden;
                border-right-style: hidden;
                border-left-style: hidden;
                border-bottom-style: groove;
            }
            
            .vehicle-tbl-btn {
                font-family: Arial, Helvetica, sans-serif;
                margin-top: 15px;
                margin-left: 135px;
                padding-bottom: 25px;
            }
            
            .vehicle-tbl-btn input {
                margin-left: 12px;
                border-radius: 10px;
                height: 40px;
                width: 180px;
            }
            
        </style>
        
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
        
    </head>
    <body>
        
        <button onclick="document.location='search-customer.jsp'" class="return-btn">Back</button><br><br><br>
        
         <h1>Vehicle Details</h1>
        <%
            if(vehicleList.size() !=0){
        %>

        <%  int counts = 0;
            
            for (int i=0 ; i<vehicleList.size() ; i++){
                Vehicle vehicle = vehicleList.get(i);
        %>
        <div>
            <div class="vehicle-table">
                <label>Plate Number</label>
                <input type="text" class="vehicle-first-input" name="" value="<%= vehicle.getVehicleNumber() %>" readonly><br>
            
                <label>Brand</label>
                <input type="text" class="vehicle-second-input" name="" value="<%= vehicle.getVehicleBrand() %>" readonly><br>
            
                <label>Type</label>
                <input type="text" class="vehicle-third-input" name="" value="<%= vehicle.getVehicleType() %>" readonly><br>
            
                <label>Color</label>
                <input type="text" class="vehicle-fourth-input" name="" value="<%= vehicle.getVehicleColor() %>" readonly><br>
            
                <label>Mileage</label> 
                <input type="text" class="vehicle-fifth-input" name="" value="<%= vehicle.getVehicleMileage() %>" readonly><br>
            </div>
                <div class="vehicle-tbl-btn">
                    <input type="button" href="" value="View History">
                    <input type="button" value="Remove">
                </div>
            </div>
         <%}}else{%>
         
         <h2>Currently there's no vehicle record under this customer.</h2>
         
         <%}%>
    </body>
</html>