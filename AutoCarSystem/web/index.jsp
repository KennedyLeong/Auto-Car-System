<%-- 
    Document   : index
    Created on : Dec 22, 2020, 9:42:22 AM
    Author     : asus
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="customer" scope="session" class="Entity.Customer" />
<jsp:useBean id="staff" scope="session" class="Entity.Staff" />
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>index</title>
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
                float: left;
                padding-left: 80px;
                margin-top: 90px;
                font-family: Arial, Helvetica, sans-serif;
            }
           
            .message-lbl {
                font-family: font- Arial, Helvetica, sans-serif;
                margin-top: 15px;
                color: red;
                text-align: center;
            }
            
            .output-tbl {
                font-family: font- Arial, Helvetica, sans-serif;
                margin-top: 15px;
                color: green;
                text-align: center;
            }

            .right-side {
                float: right;
                padding-right: 100px;
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

            .second-input {
                margin-top: 30px;
            }
            
            .login-input input {
                width: 300px;
                border-top-style: hidden;
                border-right-style: hidden;
                border-left-style: hidden;
                border-bottom-style: groove;
            }

            .submit-btn {
                width: 300px;
                height: 40px;
                margin-top:  30px;
            }
            
            input[type=checkbox] {
                transform: scale(1.5);
                margin-left: 5px;
            }
            
            .forgot-pswd {
                font-family: Arial, Helvetica, sans-serif;
                color: blue;
                font-size: 15px;
                margin-left: 40px;
            }

            u {
                color: blue;
            }
            
            .create-account-tbl {
                margin-top: 15px;
            }

            
        </style>
        <% if (request.getSession().getAttribute("customerLoggedIn") != null) {%>
        <div class="navigation-bar">    
            <ul>
                <li><a href="billingEntry.jsp">BILLING</a></li>
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
        
        
        
        <h1>BERJAYA<br>ENGINEERING SDN BHD <br>AUTOCAR SYSTEM</h1>

        <div class="right-side">    
            <div class=" right-side-date-time">
                <span id="datetime"></span><br>

                <script>
                    var dt = new Date();
                    var months = ["January","February","March","April","May","June","July","August","September","October","November","December"];
                    document.getElementById("datetime").innerHTML = (("0"+dt.getDate()).slice(-2)) +" "+ months[dt.getMonth()] +" "+ (dt.getFullYear()) +" <br> "+ (("0"+dt.getHours()).slice(-2)) +":"+ (("0"+dt.getMinutes()).slice(-2));
                </script>
            </div>
            <form action="CustomerLogin" method="POST" id="loginform">
                <div class="table-signin">
                    <h2>Log in</h2><br>
                        <div class="login-input">
                            <input type="text" placeholder="ID / Email" name="email" class="first-input" required><br>
                            
                            <input type="password" placeholder="Password" name="upassword" id="myInput" class="second-input" required><br><br>
                            
                        </div>
                            <label>Show Password</label>
                            <input type="checkbox" onclick="myFunction()" class="hide-btn">
                            <a href="forgot-password.jsp" class="forgot-pswd">Forgot Password?</a>
                            
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
                        <a href="main-menu.jsp"><button class="submit-btn" form="loginform">LOGIN</button></a><br>
                        <div class="create-account-tbl">
                            <labe>Not registered?</labe>
                            <a href="register-customer.jsp"><u>Create an account</u></a>
                        </div>
                        <div class="message-lbl">${message}</div>
                        <div class="output-tbl">${output}</div>
                </div>
            </form>
        </div>
        
    </body>
</html>
