<%-- 
    Document   : customer-create-appointment
    Created on : Dec 22, 2020, 9:52:49 AM
    Author     : asus
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Make an Appointment</title>
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
                margin-top: 15px;
                margin-left: 35px;
            }
            
            .date-label {
                font-family: Arial, Helvetica, sans-serif;
                margin-top: 15px;
                margin-left: 85px;
            }
            
            .date-input {
                margin-left: 38px;
                text-align: center;
            }
            
            .back-btn {
                font-family: Arial, Helvetica, sans-serif;
                margin-left: 60px;
                margin-top: 20px;
                height: 35px;
                width: 100px;
            }
            
            .vehicle-tbl {
                font-family: Arial, Helvetica, sans-serif;
                width: 600px;
                margin-left: 65px;
                margin-top: 25px;
                border: 1px solid black;
                border-radius: 10px;
            }
            
            .vehicle-tbl input {
                border-top-style: hidden;
                border-right-style: hidden;
                border-left-style: hidden;
                border-bottom-style: groove;
            }
            
            .number-label {
                margin-left: 25px;
            }
            
            .vehicle-first-input {
                margin-top: 15px;
                margin-left: 38px;
                width: 300px;
            }
            
            .type-label {
                margin-left: 25px;
            }
            
            .vehicle-second-input {
                margin-top: 15px;
                margin-left: 110px;
                margin-bottom: 15px;
                width: 300px;
            }
            
            .service-label {
                margin-left: 25px;
                
            }
            
            .service-type {
                margin-top: 15px;
                margin-left: 25px;
                padding-bottom: 15px;
            }
            
            .customer-tbl {
                font-family: Arial, Helvetica, sans-serif;
                width: 600px;
                margin-left: 65px;
                margin-top: 25px;
                border: 1px solid black;
                border-radius: 10px;
                height: 100px;
            }
            
            .customer-tbl input {
                border-top-style: hidden;
                border-right-style: hidden;
                border-left-style: hidden;
                border-bottom-style: groove;
            }
            
            .name-label {
                margin-left: 25px;
            }
            
            .customer-first-input {
                margin-top: 15px;
                margin-left: 100px;
                width: 300px;
            }
            
            .phone-label {
                margin-left: 25px;
            }
            
            .customer-second-input {
                margin-top: 15px;
                margin-left: 42px;
                width: 300px;
            }
            
            .submit-btn {
                font-family: Arial, Helvetica, sans-serif;
                margin-left: 70px;
                margin-top: 20px;
                height: 35px;
                width: 100px;
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
        <button onclick="document.location='main-menu.jsp'" class="back-btn">Back</button>
        
        <h1>Create Appointment</h1>
        
        <label for="date" class="date-label">Date<input type="date" name="date" class="date-input"></label>
        
        <h1>Vehicle Details</h1>
        
        <div class="vehicle-tbl">
            <div>
                <label for="vno" class="number-label">Vehicle Number
                <input type="text" name="vno" class="vehicle-first-input">
            </label><br>
            <label for="vtype" class="type-label">Type
                    <input type="text" name="vtype" class="vehicle-second-input">
            </label><br>
            <label class="service-label">Service</label>
                <div class="service-type">   
                    <input type="checkbox" name="optionone" value="EngineOil">
                    <label for="optionone">Engine Oil</label><br>
            
                    <input type="checkbox" name="optiontwo" value="OilFilter">
                    <label for="optiontwo">Replace Oil Filter</label><br>
            
                    <input type="checkbox" name="optionethree" value="AilFilter">
                    <label for="optionethree">Replace Ail Filter</label><br>
            
                    <input type="checkbox" name="optionfour" value="FuelFilter">
                    <label for="optionfour">Replace Fuel Filter</label><br>
            
                    <input type="checkbox" name="optionfive" value="AirconFilter">
                    <label for="optionfive">Replace A/C Filter</label><br>
            
                    <input type="checkbox" name="optionsix" value="SparkPlugs">
                    <label for="optionsix">Replace Spark Plugs</label><br>
            
                    <input type="checkbox" name="optionseven" value="BrakePads">
                    <label for="optionseven">Replace Brake Pads</label><br>
            
                    <input type="checkbox" name="optioneight" value="Battery">
                    <label for="optioneight">Replace Battery</label><br>
            
                    <input type="checkbox" name="optionten" value="BrakeFluid">
                    <label for="optionten">Refill Brake Fluid</label><br>
            
                    <input type="checkbox" name="optioneleven" value="PowerSteeringFluid">
                    <label for="optioneleven">Refill Power Steering Fluid</label><br>
            
                    <input type="checkbox" name="optiontwelve" value="TransmissionFluid">
                    <label for="optiontwelve">Refill Transmission Fluid</label><br>
                </div>
            </div>
        </div>
        
        <h1>Customer Details</h1>
        
        <div class="customer-tbl">    
            <div>
                <label class="name-label">Name
                <input type="text" name="cname" class="customer-first-input">
            </label><br>
            <label class="phone-label">Phone Number
                <input type="text" name="cname" class="customer-second-input">
            </label><br>
            </div>
        </div>
        
        <button class="submit-btn">Submit</button>
    </body>
</html>
