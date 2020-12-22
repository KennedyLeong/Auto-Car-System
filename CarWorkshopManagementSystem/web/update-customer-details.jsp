<%-- 
    Document   : update-customer-details
    Created on : Dec 18, 2020, 6:33:04 PM
    Author     : asus
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
        
        <button onclick="document.location='view-customer-details.jsp'" class="return-btn">Back</button><br><br>
        
        
        <h1>Customer Details</h1>
        <div>
            <div class="customer-table">
                <label>Name</label>
                    <input type="text" name="cname" class="customer-first-input" placeholder="Ismael Bin Hassan">
                <br>
            
                <label>Phone Number</label>
                    <input type="text" name="cphonenumber" class="customer-second-input" placeholder="01115876158">
                <br>
            
                <label>Email</label>
                    <input type="text" name="cemail" class="customer-third-input" placeholder="ismaelHassan@gmail.com">
                <br>
                
                <label>Address</label>
                    <input type="text" name="caddress" class="customer-fourth-input" placeholder="Taman Farmosa, Jalan Bundusan, Penampang, Kota Kinabalu, Sabah">
                <br>
                
                <label>Points</label>
                    <input type="text" name="cpoints" class="customer-fifth-input" placeholder="500 pts" readonly>
                
            </div>
            <div class="update-tbl-btn">
                <button class="reset-btn">Reset</button>
                <button onclick="document.location='view-customer-details.jsp" class="update-btn">Update</button>
            </div>
            
            
    </body>
</html>
