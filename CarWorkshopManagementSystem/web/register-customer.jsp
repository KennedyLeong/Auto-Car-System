<%-- 
    Document   : createnewcustomer
    Created on : Dec 17, 2020, 10:55:14 AM
    Author     : asus
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content- Type" content="text/html; charset=UTF-8">
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
                padding: 60px;
                font-size: 15px;
            }
            
            h1 {
                font-family: Arial, Helvetica, sans-serif;
                font-size: 28px;
                margin-top: 35px;
                margin-left: 25px;
            }
            
            .return-btn {
                font-family: Arial, Helvetica, sans-serif;
                float: left;
                height: 30px;
                width: 115px;
                text-align: center;
                border: 1px solid black;
                margin-top: 13px;
            }
            
            .customer-table {
                font-family: Arial, Helvetica, sans-serif;
                border: 1px solid black;
                border-radius: 10px;
                padding: 20px;
                margin-left: 35px; 
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
               margin-left: 35px;
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
            
            .submit-btn {
                font-family: Arial, Helvetica, sans-serif;
                float: right;
                width: 110px;
                height: 35px;
                margin-top:  100px;
                margin-right: 50px;
                font-size: 16px;
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
        <a href="search-customer.jsp" class="return-btn">Back</a><br>
        
        <h1>Customer Details</h1>
        
        <form action="customerRegistration" method="POST">
        <div class="customer-table">
            <label>Name
                <input type="text" name="cname" class="customer-first-input">
            </label><br>
            
            <label>Phone Number
                <input type="text" name="cphonenumber" class="customer-second-input">
            </label><br>
            
            <label>Email
                <input type="text" name="cemail" class="customer-third-input">
            </label><br>
                
            <label>Address
                <input type="text" name="caddress" class="customer-fourth-input">
            </label><br>    
        </div>
        
        <h1>Vehicle Details</h1>
        
        <div class="vehicle-table">
            <label>Plate Number
                <input type="text" class="vehicle-first-input" name="vno">
            </label><br>
            
            <label>Brand
                <input type="text" class="vehicle-second-input" name="vbrand">
            </label><br>
            
            <label>Type
                <input type="text" class="vehicle-third-input" name="vtype">
            </label><br>
            
            <label>Color
                <input type="text" class="vehicle-fourth-input" name="vcolor">
            </label><br>
            
            <label>Mileage 
                <input type="text" class="vehicle-fifth-input" name="vmileage">
            </label><br>
            
        </div>
        <input type="button" class="additional-btn" value="Additional Vehicle">
        
        <input type="submit" class="submit-btn" value="Register" name="register">
       </form> 
    </body>
</html>
