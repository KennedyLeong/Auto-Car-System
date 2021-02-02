<%-- 
    Document   : vehicle-service-history
    Created on : Feb 1, 2021, 7:25:10 PM
    Author     : asus
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="customer" scope="session" class="Entity.Customer" />
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Service History</title>
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
                float: left;
                margin-top: 25px;
                margin-left: 40px;
                width: 110px;
                height: 30px;
                font-size: 16px;
            }
            
            h5 {
               font-family: Arial, Helvetica, sans-serif;
               margin-top: 60px;
               margin-left: 80px;
            }
            
            .history-content {
                font-family: Arial, Helvetica, sans-serif;
                margin-top: 30px;
                margin-left: 80px;
            }
            
        </style>
        
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
                <li><a href="staff-login.jsp">SECURITY</a></li>             
            </ul>
        </div>
        <%}%>
        
    </head>
    <body>
        <a href="view-vehicle-details.jsp"><button class="return-btn">Back</button></a><br>
        
        <h5>Service History</h5>
        
        ${output}
        
    </body>
</html>
