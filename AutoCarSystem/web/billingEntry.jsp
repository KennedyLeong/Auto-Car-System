<%-- 
    Document   : billingEntry
    Created on : Feb 4, 2021, 2:19:38 PM
    Author     : asus
--%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="customer" scope="session" class="Entity.Customer" />
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Select Appointment To Pay</title>
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
            
            .return-btn {
                font-family: Arial, Helvetica, sans-serif;
                margin-left: 80px;
                margin-top: 50px;
                height: 35px;
                width: 160px;
            }
            
            h1 {
                font-size: 55px;
            }
            
            .title-label {
                font-family: Arial, Helvetica, sans-serif;
                margin-left: 80px;
                margin-top: 65px;
            }
            
            .customer-detail-btn {
                font-family: Arial, Helvetica, sans-serif;
                margin-left: 80px;
                margin-top: 50px;
                height: 35px;
                width: 160px;
            }
            
            .add-vehicle-btn {
                font-family: Arial, Helvetica, sans-serif;
                margin-left: 80px;
                margin-top: 25px;
                height: 35px;
                width: 160px;
            }
            
            .submit-btn {
                font-family: Arial, Helvetica, sans-serif;
                margin-left: 80px;
                margin-top: 25px;
                height: 35px;
                width: 160px;
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
    <% 
            Connection connection = DriverManager.getConnection("jdbc:derby://localhost:1527/CarWorkshopDB", "nbuser", "nbuser");
            Statement statement = connection.createStatement();
            String customerID = customer.getCustomerId();
            ResultSet rs1= statement.executeQuery("SELECT * FROM APPOINTMENT WHERE CUSTOMER_ID='"+customerID+"' AND APPOINTMENT_STATUS='UNPAID'");
            
    %>
    
    <body>
        <div class="title-label">
            <h1>Welcome, <%= customer.getCustomerName() %></h1>

            <span id="datetime"></span><br>
        </div>
                <script>
                    var dt = new Date();
                    var months = ["January","February","March","April","May","June","July","August","September","October","November","December"];
                    document.getElementById("datetime").innerHTML = (("0"+dt.getDate()).slice(-2)) +" "+ months[dt.getMonth()] +" "+ (dt.getFullYear()) +" <br> "+ (("0"+dt.getHours()).slice(-2)) +":"+ (("0"+dt.getMinutes()).slice(-2));
                </script>
                
                    
                <form action="billingServlet" method="post">
                    
                    
                <div style="margin-left:70px;"> 
                <div class="group2">
                    <p style="font-family:Roboto;font-size: 20px">Select Appointment For Payment :</p>
                </div>
                
                
                <div class="group">
                <select id="multiple-checkboxes" style="font-size: 15px;" name="appointmentIDSelect">
                    <% while(rs1.next()){  %><option value="<%= rs1.getString(1) %>"> <%= rs1.getString(2) %> </option><% } %>
                </select>
                </div> 

                </div>
                    <br>
                <input type="submit" class="customer-detail-btn" name="proceed" value="Proceed"><br>     
                </form>
                
                <a href="customer-profile.jsp"><button class="return-btn">Back</button></a><br>
                
        
    </body>
</html>

