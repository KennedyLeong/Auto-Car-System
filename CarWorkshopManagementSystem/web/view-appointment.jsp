<%-- 
    Document   : view-appointment
    Created on : Dec 22, 2020, 10:36:52 AM
    Author     : asus
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
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
    </head>
    <body>
        
        <button onclick="document.location='main-menu.jsp'" class="back-btn">Back</button>
        
        <h1>Create Appointment</h1>
        
        <label for="date" class="date-label">Date<input type="date" name="date" class="date-input"></label>
        
        <h1>Vehicle Details</h1>
        
        <div class="vehicle-tbl">
            <div>
                <label for="vno" class="number-label">Vehicle Number</label>
                <input type="text" name="vno" class="vehicle-first-input" placeholder="SAA9288D" readonly>
            <br>
            <label for="vtype" class="type-label">Type</label>
                    <input type="text" name="vtype" class="vehicle-second-input" placeholder="Truck" only>
            <br>
            <label class="service-label">Service</label>
                <div class="service-type">   
                    <input type="checkbox" name="optionone" value="EngineOil" onclick="return false;">
                    <label for="optionone">Engine Oil</label><br>
            
                    <input type="checkbox" name="optiontwo" value="OilFilter" onclick="return false;">
                    <label for="optiontwo">Replace Oil Filter</label><br>
            
                    <input type="checkbox" name="optionethree" value="AilFilter" onclick="return false;">
                    <label for="optionethree">Replace Ail Filter</label><br>
            
                    <input type="checkbox" name="optionfour" value="FuelFilter" onclick="return false;">
                    <label for="optionfour">Replace Fuel Filter</label><br>
            
                    <input type="checkbox" name="optionfive" value="AirconFilter" onclick="return false;">
                    <label for="optionfive">Replace A/C Filter</label><br>
            
                    <input type="checkbox" name="optionsix" value="SparkPlugs" onclick="return false;">
                    <label for="optionsix">Replace Spark Plugs</label><br>
            
                    <input type="checkbox" name="optionseven" value="BrakePads" onclick="return false;">
                    <label for="optionseven">Replace Brake Pads</label><br>
            
                    <input type="checkbox" name="optioneight" value="Battery" onclick="return false;">
                    <label for="optioneight">Replace Battery</label><br>
            
                    <input type="checkbox" name="optionten" value="BrakeFluid" onclick="return false;">
                    <label for="optionten">Refill Brake Fluid</label><br>
            
                    <input type="checkbox" name="optioneleven" value="PowerSteeringFluid" onclick="return false;">
                    <label for="optioneleven">Refill Power Steering Fluid</label><br>
            
                    <input type="checkbox" name="optiontwelve" value="TransmissionFluid" onclick="return false;">
                    <label for="optiontwelve">Refill Transmission Fluid</label><br>
                </div>
            </div>
        </div>
        
        <h1>Customer Details</h1>
        
        <div class="customer-tbl">    
            <div>
                <label class="name-label">Name
                <input type="text" name="cname" class="customer-first-input" placeholder="Ismael Bin Hassan" readonly>
            </label><br>
            <label class="phone-label">Phone Number
                <input type="text" name="cname" class="customer-second-input" placeholder="0145842168" readonly>
            </label><br>
            </div>
        </div>
        
        <button class="submit-btn">Submit</button>
        
    </body>
</html>
