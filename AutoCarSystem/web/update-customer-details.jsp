<%-- 
    Document   : update-customer-details
    Created on : Dec 18, 2020, 6:33:04 PM
    Author     : asus
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="customer" scope="session" class="Entity.Customer" />
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Update Customer Details</title>
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
                height: 30px;
                width: 115px;
                text-align: center;
                border: 1px solid black;
                margin-left: 45px;
                margin-top: 13px;
            }
            
            h1 {
                font-family: Arial, Helvetica, sans-serif;
                margin-top: 45px;
                margin-left: 45px;
            }
            
            .customer-table {
                font-family: Arial, Helvetica, sans-serif;
                border: 1px solid black;
                border-radius: 10px;
                padding: 20px;
                margin-top: 25px;
                margin-left: 125px; 
                width: 625px;
            }
            
            .customer-first-input{
                margin-left: 188px;
                width: 300px;
            }
            
            .customer-second-input {
                margin-left: 122px;
                width: 300px;
                margin-top: 15px;
            }
            
            .customer-third-input {
                margin-left: 188px;
                width: 300px;
                margin-top: 15px;
            }
            
            .customer-fourth-input {
                margin-left: 170px;
                width: 300px;
                margin-top: 15px;
            }
            
            .customer-fifth-input {
                margin-left: 130px;
                width: 300px;
                margin-top: 15px;
            }
            
            .customer-six-input {
                margin-left: 122px;
                width: 300px;
                margin-top: 15px;
            }
            
            .customer-seven-input {
                margin-left: 60px;
                width: 300px;
                margin-top: 15px;
            }
            
            .customer-table input {
                border-top-style: hidden;
                border-right-style: hidden;
                border-left-style: hidden;
                border-bottom-style: groove;
            }
            
            .update-tbl-btn {
                margin-top: 25px;
                margin-left: 100px;
            }
            
            .reset-btn {
                margin-left: 12px;
                border-radius: 10px;
                height: 40px;
                width: 180px;
            }
            
            .update-btn {
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
        
        <button onclick="document.location='view-customer-details.jsp'" class="return-btn">Back</button><br><br>
        
        
        <h1>Customer Details</h1>
        <form action="EditCustomerProfile" method="POST" id="updateform">
            <div class="customer-table">

                <input type="text" name="id" class="customer-first-input" value="<%= customer.getCustomerId()%>" hidden="">
                <br>
                
                <label>Name</label>
                <input type="text" name="cname" class="customer-first-input" value="<%= customer.getCustomerName()%>">
                <br>
            
                <label>Phone Number</label>
                    <input type="text" name="cphonenumber" class="customer-second-input" value="<%= customer.getCustomerPhoneNumber()%>" pattern="[0-9]{3} [0-9]{3} [0-9]{4}" maxlength="12">
                <br>
            
                <label>Address</label>
                    <input type="text" name="caddress" class="customer-fourth-input" value="<%= customer.getCustomerAddress()%>">
                <br>
                
                <label>Email</label>
                    <input type="text" name="cemail" class="customer-third-input" value="<%= customer.getCustomerEmail()%>">
                <br>
                
                <label>Old Password</label>
                    <input type="text" name="oldpassword" class="customer-fifth-input" pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}">
                <br>
                
                <label>New Password</label>
                    <input type="text" name="newpassword" class="customer-six-input" pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}">
                <br>
                
                <label>Confirm New Password</label>
                    <input type="text" name="cnpassowrd" class="customer-seven-input" pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}">
                <br>
                
            </div>
            <div class="update-tbl-btn">
                <input type="submit" class="update-btn" value="Update" form="updateform">
            </div>
                
                <script>
                   var password = document.getElementById("newpassword")
                   , confirm_password = document.getElementById("cnpassowrd");
                   
                   function validatePassword() {
                       if(password.value != confirm_password.value) {
                           confirm_password.setCustomValidity("Password don't match");
                       } else {
                           confirm_password.setCustomValidity('');
                       }
                   }
                   
                   password.onchange = validatePassword;
                   confirm_password.onkeyup = validatePassword;
                </script>
        </form>               
    </body>
</html>