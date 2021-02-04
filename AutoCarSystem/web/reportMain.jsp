<%-- 
    Document   : customer-profile
    Created on : Jan 6, 2021, 8:06:50 AM
    Author     : asus
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="staff" scope="session" class="Entity.Staff" />
<jsp:useBean id="customer" scope="session" class="Entity.Customer" />
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Report</title>
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
                <li><a href="Billing.jsp">BILLING</a></li>
                <li><a href="customer-profile.jsp"><%= customer.getCustomerName()%></a></li>
            </ul>
        </div>
        <%} else if (request.getSession().getAttribute("managerLoggdIn") != null) {%>
        <div class="navigation-bar">    
            <ul>
                <li><a href="main-menu.jsp">HOME</a></li>
                <li><a href="workflow-scheduler.jsp">WORKFLOW SCHEDULER</a></li>
                <li><a href="search-customer.jsp">CRM</a></li>
                <li><a href="inventoryMain.jsp">INVENTORY</a></li>
                <li><a href="supplier.jsp">SUPPLIERS</a></li>
                <li><a href="procurement.jsp">PROCUREMENT</a></li>
                <li><a href="manager-profile.jsp"><%= staff.getStaffName()%></a></li>             
            </ul>
        </div>
        <%} else if (request.getSession().getAttribute("staffLoggdIn") != null) {%>
        <div class="navigation-bar">    
            <ul>
                <li><a href="main-menu.jsp">HOME</a></li>
                <li><a href="workflow-scheduler.jsp">WORKFLOW SCHEDULER</a></li>
                <li><a href="search-customer.jsp">CRM</a></li>
                <li><a href="inventoryMain.jsp">INVENTORY</a></li>
                <li><a href="supplier.jsp">SUPPLIERS</a></li>
                <li><a href="staff-profile.jsp"><%= staff.getStaffName()%></a></li>             
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
            Connection connection = DriverManager.getConnection("jdbc:derby://localhost:1527/CarWorkshopDB","nbuser","nbuser");
            Statement statement = connection.createStatement();
            ResultSet rs1= statement.executeQuery("SELECT DISTINCT(VEHICLE_TYPE) FROM VEHICLE");
            
    %>
    
    <body>
        <div class="title-label">
            <h1>Welcome, <%= staff.getStaffName() %></h1>

            <span id="datetime"></span><br>
        </div>
                <script>
                    var dt = new Date();
                    var months = ["January","February","March","April","May","June","July","August","September","October","November","December"];
                    document.getElementById("datetime").innerHTML = (("0"+dt.getDate()).slice(-2)) +" "+ months[dt.getMonth()] +" "+ (dt.getFullYear()) +" <br> "+ (("0"+dt.getHours()).slice(-2)) +":"+ (("0"+dt.getMinutes()).slice(-2));
                </script>
                
                    
                <form action="ReportServlet" method="post">
                    
                    
                <div style="margin-left:70px;"> 
                <div class="group2">
                    <p style="font-family:Roboto;font-size: 20px">Select Vehicle :</p>
                </div>
                
                
                <div class="group">
                <select id="multiple-checkboxes" style="font-size: 15px;" name="vehicleSelectReport">
                    <% while(rs1.next()){  %><option value="<%= rs1.getString(1) %>"> <%= rs1.getString(1) %> </option><% } %>
                </select>
                </div> 
                      
                    
                <div class="group2">
                    <p style="font-family:Roboto;font-size: 20px">Select Month :</p>
                </div>
                <select id="multiple-checkboxes" style="font-size: 15px;" name="month" id="month">
                    <option value="1"> January</option>
                    <option value="2"> February</option>
                    <option value="3"> March</option>
                    <option value="4"> April</option>
                    <option value="5"> May</option>
                    <option value="6"> June</option>
                    <option value="7"> July</option>
                    <option value="8"> August</option>
                    <option value="9"> September</option>
                    <option value="10"> October</option>
                    <option value="11"> November</option>
                    <option value="12"> December</option>
                </select>
                </div>
                    <br>
                <input type="submit" class="customer-detail-btn" name="appointment" value="Current Appointments"><br>
                
                <input type="submit" class="add-vehicle-btn" name="vTrans" value="Vehicle Transaction"><br>
                
                <input type="submit" class="add-vehicle-btn" name="History" value="Transaction History"><br>
                
                <input type="submit" class="add-vehicle-btn" name="stocksold" value="Low Stock Count">
                
                </form>
                
        
    </body>
</html>
