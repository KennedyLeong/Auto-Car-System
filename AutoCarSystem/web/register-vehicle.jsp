<%-- 
    Document   : register-vehicle
    Created on : Jan 7, 2021, 9:36:31 PM
    Author     : asus
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="customer" scope="session" class="Entity.Customer" />
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Vehicle Registration</title>
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
                font-size: 28px;
                margin-top: 35px;
                margin-left: 45px;
            }
            
            p {
                font-family: Arial, Helvetica, sans-serif;
                margin-top: 10px;
                font-size: 15px;
            }
            
            .return-btn {
                font-family: Arial, Helvetica, sans-serif;
                margin-left: 60px;
                margin-top: 30px;
                height: 35px;
                width: 100px;
            }
            
            .submit-btn {
                font-family: Arial, Helvetica, sans-serif;
                float: right;
                width: 140px;
                height: 50px;
                margin-top:  45px;
                margin-right: 70px;
                font-size: 16px;
            }
            
            .vehicle-first-input {
                margin-left: 56px;
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
            }
            
            .vehicle-fourth-input {
                margin-left: 130px;
                margin-top: 15px;
                width: 300px;
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
               margin-top: 30px;
               margin-left: 75px;
               padding: 20px;
               width: 625px;
            }
            
            .vehicle-table input {
                border-top-style: hidden;
                border-right-style: hidden;
                border-left-style: hidden;
                border-bottom-style: groove;
            }
            
            .failed-tbl {
                font-family: Arial, Helvetica, sans-serif;
                margin-top: 20px;
                margin-left: 80px;
                color: red;
            }
            
            .success-tbl {
                font-family: Arial, Helvetica, sans-serif;
                margin-top: 20px;
                margin-left: 80px;
                color: green;
            }
            
        </style>
        
        <% if (request.getSession().getAttribute("customerLoggedIn") != null) {%>
        <div class="navigation-bar">    
            <ul>
                <li><a href="billingEntry.jsp">BILLING</a></li>
                <li><a href="customer-profile.jsp"><%= customer.getCustomerName()%></a></li>
            </ul>
        </div>
        <%} else {%>
        <div class="navigation-bar">    
            <ul>
                <li><a href="index.jsp">HOME</a></li>
                <li><a href="staff-login.jsp">SECURITY</a></li>             
            </ul>
        </div>
        <%}%>
    
    </head>
    <body>
        
        <a href="customer-profile.jsp"><button class="return-btn">Back</button></a>

        <input type="submit" class="submit-btn" value="Register" form="regform">
        <h1>Vehicle Details</h1>
        <form action="VehicleRegistration" method="POST" id="regform">
                <div class="vehicle-table">
                    <input type="hidden" name="id" value="<%= customer.getCustomerId()%>"><br>
                    
                    <label>Vehicle Number</label>
                    <input type="text" class="vehicle-first-input" name="vnumber"><br>

                    <label>Brand</label>
                    <input type="text" class="vehicle-second-input" name="vbrand"><br>
                     <p>&bull;E.g Perodua, Proton, Toyota, Honda, Nissan, Ford</p>
                    
                    <label for="vtype">Type</label>
                    <select name="vtype" class="vehicle-third-input">
                        <option>Choose your option</option>
                        <option value="Compact">Compact</option>
                        <option value="Sedan">Sedan</option>
                        <option value="Hatchback">Hatchback</option>
                        <option value="Coupe">Coupe</option>
                        <option value="Pickup Truck">Pickup Truck</option>
                        <option value="SUV">SUV</option>
                        <option value="MPV">MPV</option>
                    <select><br>

                    <label>Color</label>
                    <input type="text" class="vehicle-fourth-input" name="vcolor"><br>

                    <label>Mileage</label> 
                    <input type="text" class="vehicle-fifth-input" name="vmileage"><br>
                </div>
            </form>  
                    <div class="success-tbl">${success}</div>
                    <div class="failed-tbl">${failed}</div>
    </body>
</html>
