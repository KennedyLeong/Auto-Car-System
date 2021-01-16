<%-- 
    Document   : workflow-scheduler
    Created on : Dec 18, 2020, 10:39:45 AM
    Author     : asus
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="customer" scope="session" class="Entity.Customer" />
<jsp:useBean id="staff" scope="session" class="Entity.Staff" />
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
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
                margin-left: 30px;
                margin-top: 20px;
                height: 35px;
                width: 100px;
            }

            
            .top-section input {
                border-top-style: hidden;
                border-right-style: hidden;
                border-left-style: hidden;
                border-bottom-style: groove;
            }
            
            .middle-section {
                font-family: Arial, Helvetica, sans-serif;
                margin-top: 60px;
            }
            
            
            .left-side-btn {
                font-family: Arial, Helvetica, sans-serif;
                float: left;
                margin-left: 50px;
                
            }
            
            .appointment-btn {
                font-family: Arial, Helvetica, sans-serif;
                margin-left: 30px;
                margin-top: 20px;
                height: 50px;
                width: 150px;
            }
            
            .waiting-list-btn {
                margin-left: 30px;
                margin-top: 20px;
                height: 50px;
                width: 150px;
            }
            
            .estimate-time-btn {
                margin-left: 30px;
                margin-top: 20px;
                height: 50px;
                width: 150px;
            }
            
            .activity-tbl {
                margin-right: 80px;
                margin-left: 350px;
                padding-left: 50px;
            }
            
            .updatde-btn {
               font-family: Arial, Helvetica, sans-serif;
               border: 1px solid black;
               padding: 5px;
               border-radius: 5px;
            }
            
            .complete-btn {
               font-family: Arial, Helvetica, sans-serif;
               border: 1px solid black;
               padding: 5px;
               margin-left: 20px;
               border-radius: 5px; 
            }
            
            .right-side-date-time {
                font-family: Arial, Helvetica, sans-serif;
                float: right;
                padding-bottom: 15px;
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
        <div class="top-section">
            <a href="main-menu.jsp"><button class="back-btn">Back</button></a>
        </div>
            <div class="middle-section">
                <div class="left-side-btn">
                    <form action="CheckAppointment" method="GET" id="appointmentform">
                        <button class="appointment-btn" form="appointmentform">Appointment</button><br>
                    </form>
                    <form action="CheckService" method="GET" id="appointmentform">
                        <button class="waiting-list-btn">Refresh</button><br>
                    </form>
                    <a href="estimate-time.jsp"><button class="estimate-time-btn">Estimate Time</button></a><br>
                </div>
                <div class="activity-tbl">
                    
                    <div class="right-side-date-time">
                        <h1>Activity</h1>
                        <span id="datetime"></span><br>

                            <script>
                                var dt = new Date();
                                var months = ["January","February","March","April","May","June","July","August","September","October","November","December"];
                                document.getElementById("datetime").innerHTML = (("0"+dt.getDate()).slice(-2)) +" "+ months[dt.getMonth()] +" "+ (dt.getFullYear()) +" <br> "+ (("0"+dt.getHours()).slice(-2)) +":"+ (("0"+dt.getMinutes()).slice(-2));
                            </script>
                    </div>
                    <div>
                        ${output}
                    </div>
                </div>
            </div>
    </body>
</html>
