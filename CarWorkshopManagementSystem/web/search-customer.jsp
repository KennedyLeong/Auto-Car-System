<%-- 
    Document   : customerrelationshipmanagement
    Created on : Dec 17, 2020, 12:38:54 PM
    Author     : asus
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
                padding: 60px;
                font-size: 15px;
            }
            
            h1 {
                font-family: Arial, Helvetica, sans-serif;
                margin-left: 15px;
            }
            
            .search-tbl {
                font-family: Arial, Helvetica, sans-serif;
                font-family: Arial, Helvetica, sans-serif;
                float: left;
                margin-left: 20px;
                
            }
            
            .search-input {
                margin-top: 15px;
                width: 415px;
                
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
                margin-top: 13px;
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
        
        <h1>Search</h1>
        
        <div class="search-tbl">
            <input type="text" placeholder="Enter Customer & Vehicle No." class="search-input" required="">
        </div>
            <input type="submit" class="search-btn">
            <a href="register-customer.jsp" class="new-customer-btn">Register Customer</a>
            
       
            
    </body>
</html>
