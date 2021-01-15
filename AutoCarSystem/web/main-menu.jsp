<%-- 
    Document   : index
    Created on : Dec 15, 2020, 12:43:02 PM
    Author     : Kennedy Leong Fui Jeat
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="customer" scope="session" class="Entity.Customer" />
<jsp:useBean id="staff" scope="session" class="Entity.Staff" />
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Home</title>
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
                float: left;
                padding-left: 50px;
                margin-top: 60px;
                font-family: Arial, Helvetica, sans-serif;
            }
            
            
            
            .right-side {
                float: right;
                padding-right:  50px;
                margin-top: 30px;
                font-family: Arial, Helvetica, sans-serif;
            }
            
            .right-side-date-time {
                
            }
            
            .table-appointment {
                font-family: Arial, Helvetica, sans-serif;
                float: right; 
                width: 380px;
                border: 1px solid black;
                border-radius: 10px;
                padding: 20px;
                margin-top: 5px;
                
            }
            
            .appointment-label {
                border-bottom: groove;
            }
            
            .submit-btn {
                float: right;
                font-size: 16px;
            }
            
        </style>
        
        <% if (request.getSession().getAttribute("customerLoggedIn") != null) {%>
        <div class="navigation-bar">    
            <ul>
                <li><a href="customer-profile.jsp"><%= customer.getCustomerName()%></a></li>
            </ul>
        </div>
        <%} else if (request.getSession().getAttribute("staffLoggdIn") != null) {%>
        <div class="navigation-bar">    
            <ul>
                <li><a href="main-menu.jsp">HOME</a></li>
                <li><a href="workflow-scheduler.jsp">WORKFLOW SCHEDULER</a></li>
                <li><a href="search-customer.jsp">CRM</a></li>
                <li><a href="#">BILLING</a></li>
                <li><a href="#">INVENTORY</a></li>
                <li><a href="#">REPORT</a></li>
                <li><a href=staff-profile.jsp><%= staff.getStaffName()%></a></li>             
            </ul>
        </div>
        <%} else {%>
        <div class="navigation-bar">    
            <ul>
                <li><a href="index.jsp">HOME</a></li>
                <li><a href=staff-login.jsp>SECURITY</a></li>             
            </ul>
        </div>
        <%}%>
    
    </head>
    <body>
            <h1>CAR <br> WORKSHOP MANAGEMENT <br> SYSTEM</h1>
        <div class="right-side">    
            <div class=" right-side-date-time">
                <span id="datetime"></span><br>

                <script>
                    var dt = new Date();
                    var months = ["January","February","March","April","May","June","July","August","September","October","November","December"];
                    document.getElementById("datetime").innerHTML = (("0"+dt.getDate()).slice(-2)) +" "+ months[dt.getMonth()] +" "+ (dt.getFullYear()) +" <br> "+ (("0"+dt.getHours()).slice(-2)) +":"+ (("0"+dt.getMinutes()).slice(-2));
                </script>
            </div>
            <div class="table-appointment">
                <div class="appointment-label">
                <h3>APPOINTMENT, <br>FOR TODAY</h3>
                </div><br>
            
                <p> No Appointment.....</p> 
  
                <input type="button" onclick="document.location='appointment.jsp'" value="View Appointment" name="submit" class="submit-btn"> 
            </div>
        </div>
            
        </body>
</html>
