<%-- 
    Document   : forgot-password
    Created on : Jan 20, 2021, 11:26:54 AM
    Author     : asus
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="customer" scope="session" class="Entity.Customer" />
<jsp:useBean id="staff" scope="session" class="Entity.Staff" />
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Forgot Password</title>
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
            
            .forgot-label {
                font-family: Arial, Helvetica, sans-serif;
                margin-top: 160px;
                margin-left: 80px;
                
            }
            
            .email-lbl {
                font-family: Arial, Helvetica, sans-serif;
                margin-top: 25px;
                margin-left: 80px;
            }
            
            .email-input {
                margin-left: 80px;
                margin-top: 15px;
                width: 300px;
            }
            
            .reset-btn {
                font-family: Arial, Helvetica, sans-serif;
                width: 150px;
                height: 40px;
                margin-left: 80px;
                margin-top: 30px;
            }
            
            .success-tbl {
                font-family: Arial, Helvetica, sans-serif;
                margin-top: 20px;
                margin-left: 80px;
                color: green;
            }
            
            .failed-tbl {
                font-family: Arial, Helvetica, sans-serif;
                color: red;
                margin-left: 80px;
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
        <h1>Reset your password</h1>
        <div class="forgot-label">Forgot your password? No worries. Just enter the email you used <br> to sign up and we'II send you a temporary password to login.</div>
        <form action="ForgotPassword" method="POST" id="resetform"> 
            <label for="recipientaddress" class="email-lbl">Email Address</label><br>
            <input type="text" name="recipientaddress" class="email-input"><br>
            <button class="reset-btn" form="resetform">Reset Password</button>
            
            <div class="success-tbl">${success}</div>
            <div class="failed-tbl">${failed}</div>
        </form>
    </body>
</html>
