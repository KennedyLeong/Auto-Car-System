<%-- 
    Document   : login
    Created on : Dec 17, 2020, 8:57:07 AM
    Author     : asus
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login Page</title>
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
            
            h1 {
                font-family: Arial, Helvetica, sans-serif;
                float: left;
                padding-left: 100px;
                margin-top: 60px;
                font-family: Arial, Helvetica, sans-serif;
                font-size:80px;
            }
            
            h3 {
                font-family: Arial, Helvetica, sans-serif;
                font-size: 40px;
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
            
            .right-side {
                float: right;
                padding-right:  80px;
                margin-top: 50px;
                font-family: Arial, Helvetica, sans-serif;
            }

            .table-signin {
                font-family: Arial, Helvetica, sans-serif;
                float: right; 
                width: 380px;
                border: 1px solid black;
                border-radius: 10px;
                padding: 20px;
                margin-top: 5px;
                
            }
            
            .login-input input {
                width: 300px;
                border-top-style: hidden;
                border-right-style: hidden;
                border-left-style: hidden;
                border-bottom-style: groove;
            }

            .submit-btn {
                
                float: left;
                width: 110px;
                height: 35px;
                margin-top:  100px;
            }
            
            .new-account-btn {
                float: right;
                width: 130px;
                height: 35px;
                margin-top:  100px;
            }
            
        </style>
    </head>
    <body>
        <div class="navigation-bar">    
            <ul>
                <li><a href=main-menu.jsp>HOME</a></li>
                <li><a href=workflow-scheduler.jsp>WORKFLOW SCHEDULER</a></li>
                <li><a href=search-customer.jsp>CRM</a></li>
                <li><a href=>BILING</a></li>
                <li><a href=>INVENTORY</a></li>
                <li><a href=staff-login.jsp>SECURITY</a></li>
            </ul>
        </div>
        
        <h1>Welcome</h1>
        
        <div class="right-side">    
            <div class=" right-side-date-time">
                <span id="datetime"></span><br>

                <script>
                    var dt = new Date();
                    var months = ["January","February","March","April","May","June","July","August","September","October","November","December"];
                    document.getElementById("datetime").innerHTML = (("0"+dt.getDate()).slice(-2)) +" "+ months[dt.getMonth()] +" "+ (dt.getFullYear()) +" <br> "+ (("0"+dt.getHours()).slice(-2)) +":"+ (("0"+dt.getMinutes()).slice(-2));
                </script>
            </div>
            <div class="table-signin">
            
                <h3>Log in</h3><br>
                <div class="login-input">
                    <input type="text" placeholder="User Name" name="uname" required><br><br>
                
                    <input type="password" placeholder="Password" name="upassword" required>
                </div>
                <div>
                    <button onclick="document.location='main-menu.jsp'" class="submit-btn">Log in</button>
                    <button onclick="document.location='create-account.jsp'" class="new-account-btn">Create Account</button>
                </div>
            </div>
        </div>
    </body>
</html>
