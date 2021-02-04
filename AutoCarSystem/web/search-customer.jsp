<%-- 
    Document   : customerrelationshipmanagement
    Created on : Dec 17, 2020, 12:38:54 PM
    Author     : asus
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="customer" scope="session" class="Entity.Customer" />
<jsp:useBean id="staff" scope="session" class="Entity.Staff" />
<%@page import="Entity.Customer, java.util.*" %>
<% List<Customer> customerList = (List<Customer>) session.getAttribute("customerList"); %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Customer Relationship Management</title>
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
                margin-top: 25px;
                margin-left: 45px;
            }
            
            h3 {
                font-family: Arial, Helvetica, sans-serif;
            }
            
            .search-tbl {
                font-family: Arial, Helvetica, sans-serif;
                font-family: Arial, Helvetica, sans-serif;
                float: left;
                margin-left: 20px;
                
            }
            
            .search-input {
                margin-left: 55px;
                margin-top: 40px;
                width: 400px;
                
            }
            
            .search-tbl input {
                border-top-style: hidden;
                border-right-style: hidden;
                border-left-style: hidden;
                border-bottom-style: groove;
            }
            
            .search-btn {
                font-family: Arial, Helvetica, sans-serif;
                margin-left: 20px;
                margin-top: 12px;
                height: 30px;
                width: 85px;
            }
            
            .new-customer-btn {
                font-family: Arial, Helvetica, sans-serif;
                float: right;
                margin-right: 35px;
                height: 30px;
                width: 150px;
                text-align: center;
                border: 1px solid black;
                margin-top: 40px;
            }
            
            .notifications-click {
                font-family: Arial, Helvetica, sans-serif;
                float: right;
                margin-right: 35px;
                height: 30px;
                width: 150px;
                text-align: center;
                border: 1px solid black;
                margin-top: 40px; 
            }
                
            .result-tbl {
                font-family: Arial, Helvetica, sans-serif;
                margin-top: 120px;
                width: 1100px;
                margin-left: 80px;
                border-radius: 3px
            }
            
            .search-result {
                font-family: Arial, Helvetica, sans-serif;
                height: 250px;
                width: 500px;
                margin-left: 50px;
                padding: 25px;
                border-radius: 5px
            }
            
            .notification-btn {
               font-family: Arial, Helvetica, sans-serif;
               border: 1px solid black;
               padding: 6px;
               margin-right: 15px;               
               border-radius: 5px;
            }
            
            .view-more-btn {
               font-family: Arial, Helvetica, sans-serif;
               border: 1px solid black;
               padding: 6px;  
               margin-right: 15px;
               border-radius: 5px;
            }
            
            .view-vehicle-btn {
               font-family: Arial, Helvetica, sans-serif;
               border: 1px solid black;
               padding: 6px;              
               border-radius: 5px;
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

        <h1>Search</h1>
        
        <div class="search-tbl">
            <form action="SearchCustomer" method="GET" id="searchform">
                <input type="text" placeholder="Enter Customer Name" name="customername" class="search-input" required="">
                <button class="search-btn" form="searchform">Search</button>
            </form>       
        </div>
            <a href="staff-register-customer.jsp"><button class="new-customer-btn" >Register Customer</button></a>
            <a href="staff-send-notification.jsp"><button class="notifications-click">Notification</button></a><br>
        <div class="result-tbl">          
            ${output}
        </div>          
         
                  
    </body>
</html>
