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
                padding: 50px;
                font-size: 15px;
            }
            
            .return-btn {
                font-family: Arial, Helvetica, sans-serif;
                float: left;
                height: 30px;
                width: 115px;
                border: 1px solid black;
                margin-left: 45px;
                margin-top: 30px;
            }
            
            h1 {
                font-family: Arial, Helvetica, sans-serif;
                margin-top: 45px;
                margin-left: 45px;
            }
            
            p {
                font-family: Arial, Helvetica, sans-serif;
                margin-top: 10px;
                font-size: 15px;
            }
            
            .customer-table {
                font-family: Arial, Helvetica, sans-serif;
                border: 1px solid black;
                border-radius: 10px;
                padding: 20px;
                margin-top: 25px;
                margin-left: 90px;
                height: 400px;
                width: 625px;
            }
            
            .customer-first-input{
                margin-left: 188px;
                width: 300px;
            }
            
            .customer-third-input {
                margin-left: 188px;
                width: 300px;
                margin-top: 15px;
            }
            
            .customer-second-input {
                margin-left: 122px;
                width: 300px;
                margin-top: 30px;
            }

            .customer-fourth-input {
                margin-left: 170px;
                width: 300px;
                margin-top: 10px;
            }
            
            .customer-fifth-input {
                margin-left: 130px;
                width: 300px;
                margin-top: 30px;
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
            
            .failed-tbl {
                font-family: Arial, Helvetica, sans-serif;
                margin-top: 30px;
                margin-left: 120px;
                color: red;
            }
            
            .success-tbl {
                font-family: Arial, Helvetica, sans-serif;
                margin-top: 30px;
                margin-left: 120px;
                color: green;
            }
        </style>
        
       <% if (request.getSession().getAttribute("customerLoggedIn") != null) {%>
        <div class="navigation-bar">    
            <ul>
                <li><a href="Billing.jsp">BILLING</a></li>
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
        
        <a href="view-customer-details.jsp"><button class="return-btn">Back</button></a><br><br>
        
        <h1>Customer Details</h1>
        <form action="EditCustomerProfile" method="POST" id="updateform">
            <div class="customer-table">

                <input type="text" name="id" class="customer-first-input" value="<%= customer.getCustomerId()%>" hidden="">
                <br>
                
                <label>Name</label>
                <input type="text" name="cname" class="customer-first-input" value="<%= customer.getCustomerName()%>" readonly="">
                <br>
                
                <label>Email</label>
                <input type="text" name="cemail" class="customer-third-input" value="<%= customer.getCustomerEmail()%>" readonly="">
                <br>
            
                <label>Phone Number&lowast;</label>
                    <input type="text" name="cphonenumber" class="customer-second-input" value="<%= customer.getCustomerPhoneNumber()%>" pattern="[0-9]{3} [0-9]{3} [0-9]{4}" maxlength="12">
                <br>
            
                <label>Address&lowast;</label>
                    <input type="text" name="caddress" class="customer-fourth-input" value="<%= customer.getCustomerAddress()%>">
                <br>
                
                <label>Old Password&lowast;</label>
                    <input type="password" name="oldpassword" class="customer-fifth-input" pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}">
                <br>
                
                <label>New Password&lowast;</label>
                    <input type="password" name="newpassword" class="customer-six-input" pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}">
                <br>
                
                <label>Confirm New Password&lowast;</label>
                    <input type="password" name="cnpassowrd" class="customer-seven-input" pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}">
                <br>
                
            </div>
            <div class="update-tbl-btn">
                <input type="submit" class="update-btn" value="Update" form="updateform">
            </div>
            <div class="success-tbl">${success}</div>
            <div class="failed-tbl">${failed}</div>
                
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
