<%-- 
    Document   : view-customer-details
    Created on : Dec 17, 2020, 2:41:19 PM
    Author     : asus
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
               margin-left: 125px;
               padding: 20px;
               width: 625px;
            }
            
            .vehicle-table input {
                border-top-style: hidden;
                border-right-style: hidden;
                border-left-style: hidden;
                border-bottom-style: groove;
            }
            
            .vehicle-tbl-btn {
                font-family: Arial, Helvetica, sans-serif;
                margin-top: 15px;
                margin-left: 135px;
                padding-bottom: 25px;
            }
            
            .vehicle-tbl-btn input {
                margin-left: 12px;
                border-radius: 10px;
                height: 40px;
                width: 180px;
            }
            
            .second-vehicle-tbl-btn input {
                font-family: Arial, Helvetica, sans-serif;
                margin-left: 100px;
                margin-top: 15px;
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
       
        <button onclick="document.location='search-customer.jsp'" class="return-btn">Back</button><br><br><br>
            
        <h1>Customer Details</h1>
        <div>
            <div class="customer-table">
                <label>Name
                    <input type="text" name="cname" class="customer-first-input" placeholder="Liew Kah Vun" readonly>
                </label><br>
            
                <label>Phone Number
                    <input type="text" name="cphonenumber" class="customer-second-input" placeholder="01115876158" readonly>
                </label><br>
            
                <label>Email
                    <input type="text" name="cemail" class="customer-third-input" placeholder="liewkahvun@hotmail.com" readonly>
                </label><br>
                
                <label>Address
                    <input type="text" name="caddress" class="customer-fourth-input"placeholder="Taman Farmosa, Jalan Bundusan, Penampang, Kota Kinabalu, Sabah" readonly>
                </label><br>
                
                <label>Points
                    <input type="text" name="cpoints" class="customer-fifth-input" placeholder="500 pts" readonly>
                </label>
            </div>
            <div class="customer-tbl-btn">
                <button onclick="document.location='send-notification.jsp'">Send Notification</button>
                <button onclick="document.location='update-customer-details.jsp'">Update Details</button>
                <input type="button" href="" value="Delete">
            </div>
        </div>
        <h1>Vehicle Details</h1>
        <div>
            <div class="vehicle-table">
                <label>Plate Number
                    <input type="text" class="vehicle-first-input" name="" placeholder="SD58447C" readonly>
                </label><br>
            
                <label>Brand
                    <input type="text" class="vehicle-second-input" name="" placeholder="Toyota" readonly>
                </label><br>
            
                <label>Type
                    <input type="text" class="vehicle-third-input" name="" placeholder="Pick Up Truck" readonly>
                </label><br>
            
                <label>Color
                    <input type="text" class="vehicle-fourth-input" name="" placeholder="Black" readonly>
                </label><br>
            
                <label>Mileage 
                    <input type="text" class="vehicle-fifth-input" name="" placeholder="102500" readonly>
                </label><br>
            </div>
                <div class="vehicle-tbl-btn">
                    <input type="button" href="" value="View History">
                    <input type="button" value="Remove">
                </div>
                <div class="second-vehicle-tbl-btn">
                    <input type="button" value="Additional Vehicle">
                </div>
            </div>
        
        </div>
    </body>
</html>
