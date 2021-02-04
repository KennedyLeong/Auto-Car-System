<%-- 
    Document   : create-account
    Created on : Dec 18, 2020, 5:17:17 PM
    Author     : asus
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="customer" scope="session" class="Entity.Customer" />
<jsp:useBean id="staff" scope="session" class="Entity.Staff" />
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Create New Account</title>
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
                margin-left: 45px;
                margin-top: 20px;
                height: 35px;
                width: 100px;
            }
            
            h1 {
                margin-top: 30px;
                margin-left: 35px;
                font-family: Arial, Helvetica, sans-serif;
            }
            
            .account-table {
                font-family: Arial, Helvetica, sans-serif;
                border-radius: 10px;
                padding: 20px;
                margin-top: 30px;
                margin-left: 75px; 
                width: 625px;
            }
            .account-table input {
                border-top-style: hidden;
                border-right-style: hidden;
                border-left-style: hidden;
                border-bottom-style: groove;
            }
            
            .first-input {
                margin-top: 15px;
                margin-left: 100px;
                width: 300px;
            }
            
            .second-input {
                margin-top: 15px;
                margin-left: 62px;
                width: 300px;
            }
            
            .third-input {
                margin-top: 25px;
                margin-left: 130px;
                width: 300px;
            }
            
            .fourth-input {
                margin-top: 25px;
                margin-left: 100px;
                width: 300px;
            }
            
            .fifth-input {
                margin-top: 25px;
                margin-left: 40px;
                width: 300px;
            }

            .failed-tbl {
                font-family: Arial, Helvetica, sans-serif;
                margin-left: 90px;
                color: red;
            }
            
            .success-tbl {
                font-family: Arial, Helvetica, sans-serif;
                margin-top: 15px;
                margin-left: 90px;
                color: green;
            }
            
            .submit-btn {
                font-family: Arial, Helvetica, sans-serif;
                margin-top: 40px;
                height: 35px;
                width: 100px;
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
 
        <button onclick="document.location='manager-profile.jsp'" class="back-btn">Back</button>
        
        <h1>New Account</h1>
        
        <form action="CreateAccount" method="POST">
            <div class="account-table">
                <label>Full Name</label>
                <input type="text" name="name" class="first-input" required=""><br>
                <p>&bull;Your full name <Strong>MUST</strong> be the same as your MyKad</p>
                
                <label>Phone Number</label>
                <input type="text" name="phonenumber" class="second-input" required="" placeholder="e.g 888 888 8888" pattern="[0-9]{3} [0-9]{3} [0-9]{4}" maxlength="12"><br>
                
                <label>Email</label>
                <input type="text" name="email" class="third-input" required="" placeholder="abc@example.com" pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,}$"><br>
                
                <label>Password</label>
                <input type="password" name="password" class="fourth-input" required="" pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}" title="Must contain at least one number and one uppercase and lowercase letter, and at least 8 or more characters"><br>
                
                <label>Confirm Password</label>
                <input type="password" name="confirmpassword" class="fifth-input" required="" pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}" title="Must contain at least one number and one uppercase and lowercase letter, and at least 8 or more characters"><br>
                
                <input type="submit" class="submit-btn" value="Register">
                
            </div>
        </form>
        
        <div class="success-tbl">${success}</div>
        <div class="failed-tbl">${failed}</div>
    </body>
</html>
