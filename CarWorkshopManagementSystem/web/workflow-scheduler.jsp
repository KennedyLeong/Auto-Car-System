<%-- 
    Document   : workflow-scheduler
    Created on : Dec 18, 2020, 10:39:45 AM
    Author     : asus
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
                padding: 60px;
                font-size: 15px;
            }
            
            .back-btn {
                font-family: Arial, Helvetica, sans-serif;
                margin-left: 30px;
                margin-top: 20px;
                height: 35px;
                width: 100px;
            }
            
            
            .search-input {
                float: right;
                margin-top: 20px;
                margin-right: 15px;
                width: 415px;
                
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
                height: 35px;
                width: 125px;
            }
            
            .waiting-list-btn {
                margin-left: 30px;
                margin-top: 20px;
                height: 35px;
                width: 125px;
            }
            
            .estimate-time-btn {
                margin-left: 30px;
                margin-top: 20px;
                height: 35px;
                width: 125px;
            }
            
            .activity-tbl {
                float: right;
                border: 1px solid black;
                margin-right: 50px;
                width: 1150px;
                height: 450px;
            }
            
            .right-side-date-time {
                font-family: Arial, Helvetica, sans-serif;
                margin-left: 45px;
                padding-bottom: 15px;
            }

            
            .first-activity {
                width: 525px;
                margin-left: 35px;
                border-radius: 10px;
                height: 60px;
            }
            
            .second-activity {
                width: 525px;
                margin-left: 35px;
                border-radius: 10px;
                height: 60px;
            }
            
            .third-activity {
                width: 525px;
                margin-left: 35px;
                border-radius: 10px;
                margin-top: 15px;
                height: 60px;
            }
            
            .fourth-activity {
                width: 525px;
                margin-left: 35px;
                border-radius: 10px;
                height: 60px;
            }
            
            .fifth-activity {
                width: 525px;
                margin-left: 35px;
                border-radius: 10px;
                margin-top: 15px;
                height: 60px;
            }
            
            .six-activity {
                width: 525px;
                margin-left: 35px;
                border-radius: 10px;
                height: 60px;
            }
            
            .seven-activity {
                width: 525px;
                margin-left: 35px;
                border-radius: 10px;
                margin-top: 15px;
                height: 60px;
            }
            
            .eight-activity {
                width: 525px;
                margin-left: 35px;
                border-radius: 10px;
                height: 60px;
            }
            
        </style>
        
        <div class="navigation-bar">    
            <ul>
                <li><a href=main-menu.jsp>HOME</a></li>
                <li><a href=workflow-scheduler.jsp>WORKFLOW SCHEDULER</a></li>
                <li><a href=search-customer.jsp>CRM</a></li>
                <li><a href=>BILING</a></li>
                <li><a href=>INVENTORY</a></li>
                <li><a href=>REPORT</a></li>
                <li><a href=staff-login.jsp>SECURITY</a></li>
            </ul>
        </div>
        
    </head>
    <body>        
        <div class="top-section">
            <button onclick="document.location='main-menu.jsp'" class="back-btn">Back</button>
            <input type="text" placeholder="Enter Vehicle No." class="search-input">
        </div>
            <div class="middle-section">
                <div class="left-side-btn">
                    <button onclick="document.location='appointment.jsp'" class="appointment-btn">Appointment</button><br>
                    <button onclick="document.location='waiting-list.jsp'" class="waiting-list-btn">Waiting List</button><br>
                    <button onclick="document.location='estimate-time.jsp'" class="estimate-time-btn">Estimate Time</button><br>
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
                    <div class="">
                        <input type="button" onclick="document.location='.jsp'" class="first-activity" Value="Add Car">
                        <input type="button" onclick="document.location='.jsp'" class="second-activity" Value="Add Car"><br>
                        <input type="button" onclick="document.location='.jsp'" class="third-activity" Value="Add Car">
                        <input type="button" onclick="document.location='.jsp'" class="fourth-activity" Value="Add Car"><br>
                    </div>
                    <div class="">
                        <input type="button" onclick="document.location='.jsp'" class="fifth-activity" Value="Add Car">
                        <input type="button" onclick="document.location='.jsp'" class="six-activity" Value="Add Car"><br>
                        <input type="button" onclick="document.location='.jsp'" class="seven-activity" Value="Add Car">
                        <input type="button" onclick="document.location='.jsp'" class="eight-activity" Value="Add Car"><br>
                    </div>
                </div>
            </div>
    </body>
</html>
