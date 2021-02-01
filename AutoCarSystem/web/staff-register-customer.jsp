<%-- 
    Document   : staff-register-customer
    Created on : Jan 31, 2021, 2:53:50 PM
    Author     : asus
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="customer" scope="session" class="Entity.Customer" />
<jsp:useBean id="staff" scope="session" class="Entity.Staff" />
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Register New Customer</title>
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
                font-family: Arial, Helvetica, sans-serif;
                font-size: 35px;
                margin-top: 35px;
                margin-left: 45px;
            }
            
            .message-lbl {
                font-family: font- Arial, Helvetica, sans-serif;
                margin-top: 15px;
                margin-left: 75px;
                color: red;
            }
            
            .return-btn {
                font-family: Arial, Helvetica, sans-serif;
                margin-left: 60px;
                margin-top: 30px;
                height: 35px;
                width: 100px;
            }
            
            .submit-btn {
                font-family: Arial, Helvetica, sans-serif;
                float: right;
                width: 140px;
                height: 50px;
                margin-top:  45px;
                margin-right: 70px;
                font-size: 16px;
            }
            
            .customer-table {
                font-family: Arial, Helvetica, sans-serif;
                border: 1px solid black;
                border-radius: 10px;
                padding: 20px;
                margin-top: 50px;
                margin-left: 75px; 
                width: 625px;
            }
            
            .customer-zero-input {
                margin-left: 156px;
                width: 300px;
            }
            
            .customer-first-input{
                margin-top: 15px;
                margin-left: 100px;
                width: 300px;
            }
            
            .customer-second-input {
                margin-left: 63px;
                width: 300px;
                margin-top: 15px;
            }
            
            .customer-third-input {
                margin-left: 110px;
                width: 300px;
                margin-top: 15px;
            }
            
            .customer-fourth-input {
                margin-left: 129px;
                width: 300px;
                margin-top: 15px;
            }
            
            .customer-fifth-input {
                margin-left: 98px;
                width: 300px;
                margin-top: 15px;
            }
            
            .customer-six-input {
                margin-left: 38px;
                width: 300px;
                margin-top: 15px;
            }
            
            .customer-table input {
                border-top-style: hidden;
                border-right-style: hidden;
                border-left-style: hidden;
                border-bottom-style: groove;
            }
            
            .vehicle-first-input {
                margin-left: 70px;
                width: 300px; 
            }
            
            .vehicle-second-input {
                margin-left: 125px;
                width: 300px;
                margin-top: 15px;
            }
            
            .vehicle-third-input {
                margin-left: 133px;
                width: 300px;
                margin-top: 15px;
            }
            
            .vehicle-fourth-input {
                margin-left: 130px;
                width: 300px;
                margin-top: 15px;
            }
            
            .vehicle-fifth-input {
                margin-left: 113px;
                width: 300px;
                margin-top: 15px;
            }
            
            .vehicle-table {
               font-family: Arial, Helvetica, sans-serif;
               border: 1px solid black;
               border-radius: 10px;
               margin-left: 75px;
               padding: 20px;
               width: 625px;
            }
            
            .vehicle-table input {
                border-top-style: hidden;
                border-right-style: hidden;
                border-left-style: hidden;
                border-bottom-style: groove;
            }
            
            
            
            .additional-btn {
                font-family: Arial, Helvetica, sans-serif;
                margin-top: 25px;
                margin-left: 35px;
                width: 150px;
                height: 35px;
                font-size: 16px;
            }
              
            .input[type=checkbox] {
                transform: scale(2.0);
                margin-left: 15px;
            }
        </style>
        
        <% if (request.getSession().getAttribute("customerLoggedIn") != null) {%>
        <div class="navigation-bar">    
            <ul>
                <li><a href="Billing.jsp">BILLING</a></li>
                <li><a href="customer-profile.jsp"><%= customer.getCustomerName()%></a></li>
            </ul>
        </div>
        <%} else if (request.getSession().getAttribute("staffLoggdIn") != null) {%>
        <div class="navigation-bar">    
            <ul>
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
        <a href="search-customer.jsp"><button class="return-btn">Back</button></a>
        
        <input type="submit" class="submit-btn" value="Register" form="regform">
            
        
        <h1>Customer Details</h1>
  
        <form action="StaffCustomerRegistration" method="POST" id="regform">
            <div class="customer-table">
                <label>Full Name</label>
                <input type="text" name="name" class="customer-first-input" required><br>
                <p>&bull;Your full name <Strong>MUST</strong> be the same as your MyKad</p>

                <label>Phone Number</label>
                <input type="text" name="phonenumber" class="customer-second-input" required placeholder="e.g 888 888 8888" pattern="[0-9]{3} [0-9]{3} [0-9]{4}" maxlength="12"><br>

                <label>Address</label>
                <input type="text" name="address" class="customer-third-input"><br>

                <label>Email</label>
                <input type="text" name="email" class="customer-fourth-input" required placeholder="abc@example.com" pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,}$"><br>

                <label>Password</label>
                <input type="password" name="password" id="myInput" class="customer-fifth-input" required pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}" title="Must contain at least one number and one uppercase and lowercase letter, and at least 8 or more characters"><br>
                
                <label>Confirm Password</label>
                <input type="password" name="confirmpassword" id="myInput2" class="customer-six-input" required pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}" title="Must contain at least one number and one uppercase and lowercase letter, and at least 8 or more characters"><br>    
            </div>
        </form>
        
        <div class="message-lbl">${message}</div>
    </body>
</html>
