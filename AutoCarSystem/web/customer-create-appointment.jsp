<%-- 
    Document   : customer-create-appointment
    Created on : Dec 22, 2020, 9:52:49 AM
    Author     : asus
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="customer" scope="session" class="Entity.Customer" />
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
            
            .appointment-tbl input {
                border-top-style: hidden;
                border-right-style: hidden;
                border-left-style: hidden;
                border-bottom-style: groove;
            }
            
            .date-label {
                font-family: Arial, Helvetica, sans-serif;
                margin-left: 80px;
                margin-top: 30px;
            }
            
            .date-input {
                margin-left: 85px;
                text-align: center;
            }
            
            .time-label {
                font-family: Arial, Helvetica, sans-serif;
                margin-left: 80px;
                margin-top: 20px;
            }
            
            .time-input {
                margin-left: 85px;
                width: 170px;
                text-align: center;
            }
            
            .vehicle-No-label {
                font-family: Arial, Helvetica, sans-serif;
                margin-left: 80px;
                margin-top: 20px;
            }
            
            .vehicle-No-Input {
                margin-left: 38px;
                width: 170px;
            }
            
            .service-type-label {
                font-family: Arial, Helvetica, sans-serif;
                margin-left: 80px;
                margin-top: 20px;
            }
            
            .service-type-input {
                margin-left: 20px;
                width: 225px;
            }
            
            .maintenance {
                margin-left: 60px;
            }
            
            .abnormalCondition {
                margin-left: 60px;
            }
            
            .back-btn {
                font-family: Arial, Helvetica, sans-serif;
                margin-left: 60px;
                margin-top: 20px;
                height: 35px;
                width: 100px;
            }
          
            .box {
                color: black;
                padding: 20px;
                display: none;
                margin-top: 20px;
            }
            
            .comment-label {
                font-family: Arial, Helvetica, sans-serif;
                margin-top: 20px;
            }
            
            .comment-input {
                font-family: Arial, Helvetica, sans-serif;
                margin-top: 15px;
                width: 500px;
                height: 150px;
            }
            
            .submit-btn {
                font-family: Arial, Helvetica, sans-serif;
                margin-left: 50px;
                margin-top: 45px;
                height: 35px;
                width: 100px;
            }

            
        </style>
        <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
        <script>
        $(document).ready(function(){
            $("select").change(function(){
                $(this).find("option:selected").each(function(){
                    var optionValue = $(this).attr("value");
                    if(optionValue){
                        $(".box").not("." + optionValue).hide();
                        $("." + optionValue).show();
                    } else{
                        $(".box").hide();
                    }
                });
            }).change();
        });
        </script>
        
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
        <button onclick="document.location='index.jsp'" class="back-btn">Back</button>
    
    <form action="../" method="POST">    
        <h1>Create Appointment</h1>
    <div class="appointment-tbl">    
        <label for="date" class="date-label">Date</label>
        <input type="date" name="date" class="date-input"><br>
        
        <label for="time" class="time-label">Time</label>
        <input type="time" name="time" class="time-input" min="08:00" max="17:00" step="600"><br>
        
        <label for="vehicleNo" class="vehicle-No-label">Vehicle No.</label>
        <input type ="textbox" name="vehicleNo" class="vehicle-No-Input"><br>
        
        <label for="serviceType" class="service-type-label">Request Type</label>
        <select name="serviceType" class="service-type-input">
            <option>Choose your option</option>
            <option value="maintenance">Service</option>
            <option value="abnormalCondition">Diagnostic Tests</option>
        <select><br>
    </div>         
    <div class="maintenance box">
        <fieldset>
            <legend>Lubricant/ Fluids</legend>
            <input type="checkbox" class="" name="service1" value="EngineOil">
            <label for="service1">Engine Oil</label><br>

            <input type="checkbox" class="" name="service2" value="ATF">
            <label for="service2">Automatic Transmission Fluid</label><br>

            <input type="checkbox" class="" name="service3" value="GearOil">
            <label for="service3">Gear Oil</label><br>

            <input type="checkbox" class="" name="service4" value="RadiatorCoolant">
            <label for="service4">Radiator Coolant</label><br>

            <input type="checkbox" class="" name="service5" value="BrakeFluid">
            <label for="service5">Radiator Coolant</label><br>

            <input type="checkbox" class="" name="service6" value="PowerSteeringFluid">
            <label for="service6">Power Steering Fluid</label><br>
        </fieldset>
            
        <fieldset>
            <legend>Replacement Part</legend>
            <input type="checkbox" class="" name="service7" value="OilFilter">
            <label for="service7">Oil Filter</label><br>

            <input type="checkbox" class="" name="service8" value="FuelFilter">
            <label for="service8">Fuel Filter</label><br>

            <input type="checkbox" class="" name="service9" value="BreakPad">
            <label for="service9">Break Pad</label><br>

            <input type="checkbox" class="" name="service10" value="AirFilter">
            <label for="service10">Ail Filter</label><br>

            <input type="checkbox" class="" name="service11" value="SparkPlugs">
            <label for="service11">Spark Plugs</label><br>

            <input type="checkbox" class="" name="service12" value="AircondBelt">
            <label for="service12">Air-Cond Belt</label><br>

            <input type="checkbox" class="" name="service13" value="AlternatorBelt">
            <label for="service13">Alternator Belt</label><br>

            <input type="checkbox" class="" name="service14" value="PowerSteeringBelt">
            <label for="service14">Power Steering Belt</label><br>

            <input type="checkbox" class="" name="service15" value="TimingBelt">
            <label for="service15">Timing Belt</label><br>

            <input type="checkbox" class="" name="service16" value="TimingChain">
            <label for="service16">Timing Chain</label><br>

            <input type="checkbox" class="" name="service17" value="ClutchPlate">
            <label for="service17">Clutch Plate</label><br>

            <input type="checkbox" class="" name="service18" value="WaterPump">
            <label for="service18">Water Pump</label><br>
        </fieldset>
    </div>
            
    <div class="abnormalCondition box">
        <div>
            <legend></legend>
            <input type="checkbox" class="" name="inspection1" value="BrakeSystem">
            <label for="inspection1">Brake System</label><br>

            <input type="checkbox" class="" name="inspection2" value="EngineTransmissionSystem">
            <label for="inspection2">Engine & Transmission System</label><br>

            <input type="checkbox" class="" name="inspection3" value="SteeringSuspensionWheelSystem">
            <label for="inspection3">Steering, Suspension & Wheel System</label><br>

            <input type="checkbox" class="" name="inspection4" value="ExhaustSystem">
            <label for="inspection4">Exhaust System</label><br>

            <input type="checkbox" class="" name="inspection5" value="CoolingSystem">
            <label for="inspection5">Cooling System</label><br>

            <input type="checkbox" class="" name="inspection6" value="BatteriesChargingSystem">
            <label for="inspection6">Batteries & Charging System</label><br>

            <input type="checkbox" class="" name="inspection7" value="DiagnosticSystem">
            <label for="inspection7">Vehicle Diagnostic System</label><br>

            <input type="checkbox" class="" name="inspection8" value="ACSystem">
            <label for="inspection8">Air Conditioner System</label><br>
        </div>

        <label for="comment" class="comment-label">Describe the problem you faced</label><br>
            <textarea class="comment-input" name="comment"></textarea><br>
        </div>       
    </form> 
        <input type="submit" value="Submit" class="submit-btn" form="">
    </body>
</html>
