<%-- 
    Document   : view-customer-details
    Created on : Dec 17, 2020, 2:41:19 PM
    Author     : asus
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="customer" scope="session" class="Entity.Customer" />
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="bootstrap/css/bootstrap.css" rel="stylesheet" type="text/css"/>
        <link href="bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <title>Customer Details</title>
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
                margin-top: 25px;
                margin-left: 40px;
                width: 110px;
                height: 30px;
                font-size: 16px;
            }
            
            h1 {
               font-family: Arial, Helvetica, sans-serif;
               margin-top: 60px;
               margin-left: 80px;
            }
            
            .customer-table {
                font-family: Arial, Helvetica, sans-serif;
                border: 1px solid black;
                border-radius: 10px;
                padding: 20px;
                margin-left: 125px; 
                width: 625px;
            }
            
            .customer-tbl-btn {
                font-family: Arial, Helvetica, sans-serif;
                margin-top: 15px;
                margin-left: 135px;
                padding-bottom: 25px;
            }
            
            .customer-tbl-btn input {
                margin-left: 12px;
                border-radius: 10px;
                height: 40px;
                width: 180px;
            }
            
            .customer-tbl-btn button {
                margin-left: 12px;
                border-radius: 10px;
                height: 40px;
                width: 180px;
            }
            
            .customer-first-input{
                margin-left: 128px;
                width: 300px;
            }
            
            .customer-second-input {
                margin-left: 63px;
                width: 300px;
                margin-top: 15px;
            }
            
            .customer-third-input {
                margin-left: 129px;
                width: 300px;
                margin-top: 15px;
            }
            
            .customer-fourth-input {
                margin-left: 110px;
                width: 300px;
                margin-top: 15px;
            }
            
            .customer-fifth-input {
                margin-left: 124px;
                width: 300px;
                margin-top: 15px;
            }
            
            .customer-table input {
                border-top-style: hidden;
                border-right-style: hidden;
                border-left-style: hidden;
                border-bottom-style: groove;
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
       
        <a href="customer-profile.jsp"><button class="return-btn">Back</button></a><br>
            
        <h1>Customer Details</h1>
        <div>
            <div class="customer-table">
                <label>Name
                    <input type="text" name="cname" class="customer-first-input" value="<%= customer.getCustomerName()%>" readonly>
                </label><br>
            
                <label>Phone Number
                    <input type="text" name="cphonenumber" class="customer-second-input" value="<%= customer.getCustomerPhoneNumber()%>" readonly>
                </label><br>
            
                <label>Email
                    <input type="text" name="cemail" class="customer-third-input" value="<%= customer.getCustomerEmail()%>" readonly>
                </label><br>
                
                <label>Address
                    <input type="text" name="caddress" class="customer-fourth-input" value="<%= customer.getCustomerAddress()%>" readonly>
                </label><br>

            </div>
            <div class="customer-tbl-btn">             
                <button onclick="document.location='update-customer-details.jsp'">Update Details</button>
            </div>
        </div>
        </div>
    </body>
</html>
