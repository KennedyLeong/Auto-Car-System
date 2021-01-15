<%-- 
    Document   : staff-profile
    Created on : Jan 11, 2021, 1:56:19 PM
    Author     : asus
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="staff" scope="session" class="Entity.Staff" />
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Staff Profile</title>
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
                width: 160px;
            }
            
            .add-vehicle-btn {
                font-family: Arial, Helvetica, sans-serif;
                margin-left: 80px;
                margin-top: 25px;
                height: 35px;
                width: 160px;
            }
            
            .submit-btn {
                font-family: Arial, Helvetica, sans-serif;
                margin-left: 80px;
                margin-top: 25px;
                height: 35px;
                width: 160px;
            }
     </style>       
    </head>
    <body>
        <div class="title-label">
            <h1>Welcome, <%= staff.getStaffName()%></h1>

            <span id="datetime"></span><br>
        </div>
                <script>
                    var dt = new Date();
                    var months = ["January","February","March","April","May","June","July","August","September","October","November","December"];
                    document.getElementById("datetime").innerHTML = (("0"+dt.getDate()).slice(-2)) +" "+ months[dt.getMonth()] +" "+ (dt.getFullYear()) +" <br> "+ (("0"+dt.getHours()).slice(-2)) +":"+ (("0"+dt.getMinutes()).slice(-2));
                </script>
        <form action="LogOut" method="GET" id="logoutform">
                    <input type="submit" class="submit-btn" value="Logout" form="logoutform">
        </form>
    </body>
</html>
