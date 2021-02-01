<%-- 
    Document   : customer-create-appointment
    Created on : Dec 22, 2020, 9:52:49 AM
    Author     : asus
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="customer" scope="session" class="Entity.Customer" />
<%@page import="Entity.Vehicle, java.util.*" %>
<% List<Vehicle> vehicleList = (List<Vehicle>) session.getAttribute("vehicleList"); %>

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
                padding: 50px;
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
            
            .notice-label {
                font-family: Arial, Helvetica, sans-serif;
                font-size: 13px;
                margin-top: 15px;
                margin-left: 80px;
            }
            
            .vehicle-No-label {
                font-family: Arial, Helvetica, sans-serif;
                margin-top: 10px;
                margin-left: 25px;
            }
            
            .vehicle-No-Input {
                margin-left: 85px;
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
            
            .success-tbl {
                font-family: Arial, Helvetica, sans-serif;
                color: green;
                font-size: 20px;
                margin-top: 40px;
                margin-left: 70px;
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
                <li><a href="Billing.jsp">BILLING</a></li>
                <li><a href="customer-profile.jsp"><%= customer.getCustomerName()%></a></li>
            </ul>
        </div>
        <%} else {%>
        <div class="navigation-bar">    
            <ul>
                <li><a href="index.jsp">HOME</a></li>
                <li><a href=staff-login.jsp>SECURITY</a></li>             
            </ul>
        </div>
        <%}%>
        
    </head>
    
    <body>
        <button onclick="document.location='customer-profile.jsp'" class="back-btn">Back</button>
    
    <form action="CreateAppointment" method="POST" id="appointmentform">    
        <h1>Create Appointment</h1>
    <div class="appointment-tbl">    
        <label for="date" class="date-label">Date</label>
        <input type="date" name="date" class="date-input" id="datePicker" required=""><br>
        
        <script>
            datePicker.min = new Date().toISOString().split("T")[0];
        </script>
        
        <label for="time" class="time-label">Time</label>
        <input type="time" name="time" class="time-input" min="08:00" max="15:00" step="600" required=""><br>
        <div class="notice-label">&lowast; Appointment only can be made from 8:00 A.M. to 3:00 P.M.</div>
        
        <label for="vehicleNo" class="vehicle-No-label" hidden="">Customer ID</label>
        <input type ="textbox" name="id" class="vehicle-No-Input" value="<%= customer.getCustomerId() %>" hidden=""><br>
        
        <%
            if(vehicleList.size() !=0){
        %>

        <%  int counts = 0;
            
            for (int i=0 ; i<vehicleList.size() ; i++){
                Vehicle vehicle = vehicleList.get(i);
        %>
        
        <input type="radio" id="male" name="vnumber" value="<%= vehicle.getVehicleId() %>" class="vehicle-No-Input">
        <label for="vehicleNo" class="vehicle-No-label"><%= vehicle.getVehicleNumber() %></label><br>
        
        <%}}else{%>  
         <%}%>
        
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
            <input type="checkbox" class="" name="services" value="Engine Oil">
            <label for="service1"><strong>Engine Oil</strong> RM 120 [Recommended : 5,000 KM]</label><br>

            <input type="checkbox" class="" name="services" value="Automatic Transmission Fluid">
            <label for="service2"><strong>Automatic Transmission Fluid</strong> RM 75 [Recommended : 30,000 KM]</label><br>

            <input type="checkbox" class="" name="services" value="Gear Oil">
            <label for="service3"><strong>Gear Oil</strong> RM 80 [Recommended : 30,000 KM]</label><br>

            <input type="checkbox" class="" name="services" value="Radiator Coolant">
            <label for="service4"><strong>Radiator Coolant</strong> RM 20 [Recommended : 50,000 KM]</label><br>

            <input type="checkbox" class="" name="services" value="Brake Fluid">
            <label for="service5"><strong>Brake Fluid</strong> Rm 20 [Recommended : 60,000 KM]</label><br>

            <input type="checkbox" class="" name="services" value="Power Steering Fluid">
            <label for="service6"><strong>Power Steering Fluid</strong> RM 35 [Recommended : 60,000 KM]</label><br>
        </fieldset>
            
        <fieldset>
            <legend>Replacement Part</legend>
            <input type="checkbox" class="" name="services" value="Oil Filter">
            <label for="service7"><strong>Oil Filter</strong> RM 40 [Recommended : 5,000 KM]</label><br>

            <input type="checkbox" class="" name="services" value="Fuel Filter">
            <label for="service8"><strong>Fuel Filter</strong> Rm 30 [Recommended : 40,000 KM]</label><br>

            <input type="checkbox" class="" name="services" value="Break Pad">
            <label for="service9"><strong>Break Pad</strong> RM 50 [Recommended : 5,000 KM]</label><br>

            <input type="checkbox" class="" name="services" value="Air Filter">
            <label for="service10"><strong>Ail Filter</strong> RM 30 [Recommended : 20,000 KM]</label><br>

            <input type="checkbox" class="" name="services" value="Spark Plugs">
            <label for="service11"><strong>Spark Plugs</strong> RM 20 [Recommended : 20,000 KM]</label><br>

            <input type="checkbox" class="" name="services" value="Aircond Belt">
            <label for="service12"><strong>Air-Cond Belt</strong> RM 38 [Recommended : 60,000 KM]</label><br>

            <input type="checkbox" class="" name="services" value="Alternator Belt">
            <label for="service13"><strong>Alternator Belt</strong> RM 60 [Recommended : 60,000 KM]</label><br>

            <input type="checkbox" class="" name="services" value="Power Steering Belt">
            <label for="service14"><strong>Power Steering Belt</strong> RM 40 [Recommended : 60,000 KM]</label><br>

            <input type="checkbox" class="" name="services" value="Timing Belt">
            <label for="service15"><strong>Timing Belt</strong> RM 270 [Recommended : 60,000 KM]</label><br>

            <input type="checkbox" class="" name="services" value="Timing Chain">
            <label for="service16"><strong>Timing Chain</strong> RM 360 [Recommended : 250,000 KM]</label><br>

            <input type="checkbox" class="" name="services" value="Clutch Plate">
            <label for="service17"><strong>Clutch Plate</strong> RM 280 [Recommended : 100,000 KM]</label><br>

            <input type="checkbox" class="" name="services" value="Water Pump">
            <label for="service18"><strong>Water Pump</strong> RM 320 [Recommended : 120,000 KM]</label><br>
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
        <input type="submit" value="Submit" class="submit-btn" form="appointmentform">
        <div class="success-tbl">${output}</div>
    </body>
</html>
