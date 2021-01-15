<%-- 
    Document   : login
    Created on : Dec 17, 2020, 8:57:07 AM
    Author     : asus
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="customer" scope="session" class="Entity.Customer" />
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
                padding-right:  100px;
                margin-top: 50px;
                font-family: Arial, Helvetica, sans-serif;
            }

            .table-signin {
                font-family: Arial, Helvetica, sans-serif;
                float: right; 
                width: 380px;
                border: 1px solid black;
                border-radius: 10px;
                padding: 30px;
                margin-top: 25px;
                
            }
            
            .login-input input {
                width: 300px;
                border-top-style: hidden;
                border-right-style: hidden;
                border-left-style: hidden;
                border-bottom-style: groove;
            }
            
            input[type=checkbox] {
                transform: scale(2.0);
                margin-left: 15px;
            }
            
            .show-password {
                margin-top: 15px;
            }

            .submit-btn {
                
                float: left;
                width: 300px;
                height: 40px;
                margin-top:  30px;
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
            <form action="StaffLogin" method="POST" id="loginform">
                <div class="table-signin">

                    <h2>Log in</h2><br>
                    <div class="login-input">
                        <input type="text" placeholder="ID / Email" name="email" required><br><br>

                        <input type="password" placeholder="Password" id="myInput" name="password" required>
                    </div>
                    <div class="show-password">
                        <label>Show Password</label>
                            <input type="checkbox" onclick="myFunction()" class="hide-btn">
                            
                            <script>
                                function myFunction() {
                                  var x = document.getElementById("myInput");
                                  if (x.type === "password") {
                                    x.type = "text";
                                  } else {
                                    x.type = "password";
                                  }
                                }
                            </script>
                        <a href="main-menu.jsp"><button class="submit-btn"  form="loginform">LOGIN</button></a>
                    </div>
                </div>
            </form>
        </div>
    </body>
</html>
