<%-- 
    Document   : customer-profile
    Created on : Jan 6, 2021, 8:06:50 AM
    Author     : asus
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="customer" scope="session" class="Entity.Customer" />
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Customer Profile</title>
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
                font-size: 55px;
            }
            
            .title-label {
                font-family: Arial, Helvetica, sans-serif;
                margin-left: 80px;
                margin-top: 65px;
            }
            
            .customer-detail-btn {
                font-family: Arial, Helvetica, sans-serif;
                margin-left: 80px;
                margin-top: 50px;
                height: 35px;
                width: 180px;
            }
            
            .add-vehicle-btn {
                font-family: Arial, Helvetica, sans-serif;
                margin-left: 80px;
                margin-top: 25px;
                height: 35px;
                width: 180px;
            }
            
            .submit-btn {
                font-family: Arial, Helvetica, sans-serif;
                margin-left: 80px;
                margin-top: 25px;
                height: 35px;
                width: 180px;
            }
            
        </style>
        <% if (request.getSession().getAttribute("customerLoggedIn") != null) {%>
        <div class="navigation-bar">    
            <ul>
                <li><a href="billingEntry.jsp">BILLING</a></li>
                <li><a href="customer-profile.jsp"><%= customer.getCustomerName()%></a></li>
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
        <div class="title-label">
            <h1>Welcome, <%= customer.getCustomerName()%></h1>

            <span id="datetime"></span><br>
        </div>
                <script>
                    var dt = new Date();
                    var months = ["January","February","March","April","May","June","July","August","September","October","November","December"];
                    document.getElementById("datetime").innerHTML = (("0"+dt.getDate()).slice(-2)) +" "+ months[dt.getMonth()] +" "+ (dt.getFullYear()) +" <br> "+ (("0"+dt.getHours()).slice(-2)) +":"+ (("0"+dt.getMinutes()).slice(-2));
                </script>
                
                <a href="view-customer-details.jsp"><button class="customer-detail-btn">View Profile</button></a><br>
                
                <a href="register-vehicle.jsp"><button class="add-vehicle-btn">Register Vehicle</button></a><br>
                
                <a href="view-vehicle-details.jsp"><button class="add-vehicle-btn">View Vehicle</button></a><br>
                
                <a href="customer-create-appointment.jsp"><button class="add-vehicle-btn">Make Appointment</button></a><br>
                
                <a href="AppointmentHistory?id=<%= customer.getCustomerId()%>"><button class="add-vehicle-btn">Appointment History</button></a><br>
                
                <form action="LogOut" method="GET" id="logoutform">
                    <input type="submit" class="submit-btn" value="Logout" form="logoutform">
                </form>
        
    </body>
</html>
