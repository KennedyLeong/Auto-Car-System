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
                
            .result-tbl {
                font-family: Arial, Helvetica, sans-serif;
                border: 1px solid black;
                width: 1130px;
                margin-left: 50px;
                border-radius: 3px
                }
            }
            
            .result-tbl input {
                border-top-style: hidden;
                border-right-style: hidden;
                border-left-style: hidden;
                border-bottom-style: hidden;
            }
            
            .second-input-spacing {
                margin-top: 110px;
                margin-left: 50px;
            }
            
            .customer-detail-btn {
                font-family: Arial, Helvetica, sans-serif;
                margin-left: 40px;
                height: 30px;
                width: 110px;
            }
        </style>
        
        <div class="navigation-bar">    
            <ul>
                <li><a href=main-menu.jsp>HOME</a></li>
                <li><a href=workflow-scheduler.jsp>WORKFLOW SCHEDULER</a></li>
                <li><a href=search-customer.jsp>CRM</a></li>
                <li><a href=>BILING</a></li>
                <li><a href=>INVENTORY</a></li>
                <li><a href=>REPORT</a></li>
                <li><a href=staff-login.jsp>SECURITY</a></li>
            </ul>
        </div>
        
    </head>
    <body>

        <h1>Search</h1>
        
        <div class="search-tbl">
            <input type="text" placeholder="Enter Customer & Vehicle No." class="search-input" required="">
        </div>
            <input type="submit" class="search-btn" value="Search">
            <a href="register-customer.jsp" class="new-customer-btn">Register Customer</a>
            
            
        <div class="result-tbl">          
            <br><label class="second-input-spacing">Name</label>
            <input type="text" name="cname" class="second-input" placeholder="Ismael Bin Hassan" readonly>
            
            <label>Email</label>
            <input type="text" name="cemail" class="third-input" placeholder="ismaelHassan@gmail.com" readonly>
            
            <button class="customer-detail-btn" onclick="document.location='view-customer-details.jsp'">View</button>
        </div>
            
       
            
    </body>
</html>
