<%-- 
    Document   : add-car
    Created on : Dec 21, 2020, 8:26:05 PM
    Author     : asus
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Add Car</title><link href="bootstrap/css/bootstrap.css" rel="stylesheet" type="text/css"/>
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
            
            .back-btn {
            font-family: Arial, Helvetica, sans-serif;
                margin-left: 60px;
                margin-top: 20px;
                height: 35px;
                width: 100px;
            }
            
            h1 {
                font-family: Arial, Helvetica, sans-serif;
                margin-top: 15px;
                margin-left: 35px;
            }
            
            .search-car-label {
                margin-top: 20px;
                margin-left: 55px;
            }
            
            .search-car-input {
                margin-left: 65px;
                width: 300px;
                border-top-style: hidden;
                border-right-style: hidden;
                border-left-style: hidden;
                border-bottom-style: groove;
            }
            
            .search-car-button {
                font-family: Arial, Helvetica, sans-serif;
                margin-top: 25px;
                margin-left: 40px;
                width: 110px;
                height: 30px;
                font-size: 16px;
            }
            
            .search-car-result {
                margin-top: 10px;
                margin-left: 55px;
                border-top-style: hidden;
                border-right-style: hidden;
                border-left-style: hidden;
                border-bottom-style: hidden;
            }
            
            .service-label {
                margin-left: 55px;
                margin-top: 30px;
                
            }
            
            .service-type {
                margin-top: 15px;
                margin-left: 55px;
                padding-bottom: 15px;
            }
            
            .add-car-button {
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

        <button onclick="document.location='workflow-scheduler.jsp'" class="back-btn">Back</button>
        
        <h1>Add Car</h1>
        
        <div>
            <label class="search-car-label">Plate Number</label>
            <input type="text" name="vplatenumber" class="search-car-input" placeholder="Enter Car Plate Number">
            <input type="submit" name="searchcar" class="search-car-button" value="Search"><br>
        </div>
        
            <input type="text" name="carresult" class="search-car-result" placeholder="Result">
        
        <div>
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
            
            <input type="submit" class="add-car-button" value="Add">
    </body>
</html>
