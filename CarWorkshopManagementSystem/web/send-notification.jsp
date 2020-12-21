<%-- 
    Document   : send-notification
    Created on : Dec 18, 2020, 3:30:46 PM
    Author     : asus
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Send Notification</title>
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
            
            .back-btn {
                font-family: Arial, Helvetica, sans-serif;
                margin-left: 45px;
                margin-top: 20px;
                height: 35px;
                width: 100px;
            }
            
            h1 {
                margin-top: 35px;
                margin-left: 50px;
                font-family: Arial, Helvetica, sans-serif;
            }
            
            .recipient-tbl input {
                border-top-style: hidden;
                border-right-style: hidden;
                border-left-style: hidden;
                border-bottom-style: groove;
            }
            
            .to-label {
                font-family: Arial, Helvetica, sans-serif;
                margin-top: 15px;
                margin-left: 50px;
            }
            
            .email-input {
                margin-left: 80px;
                width: 300px;
            }
            
            .subject-label {
                font-family: Arial, Helvetica, sans-serif;
                margin-left: 50px;
            }
            
            .subject-input {
                margin-top: 15px;
                margin-left: 44px;
                width: 300px;
            }
            
            .message-input {
                width: 500px;
                height: 250px;
                border-radius: 10px;
                margin-top: 25px;
                margin-left: 45px;
            }
            
            .send-btn {
                font-family: Arial, Helvetica, sans-serif;
                margin-left: 45px;
                margin-top: 20px;
                height: 35px;
                width: 100px;
            }
        </style>
    </head>
    <body>
        
        <div class="navigation-bar">    
            <ul>
                <li><a href=main-menu.jsp>HOME</a></li>
                <li><a href=workflow-scheduler.jsp>WORKFLOW SCHEDULER</a></li>
                <li><a href=search-customer.jsp>CRM</a></li>
                <li><a href=>BILING</a></li>
                <li><a href=>INVENTORY</a></li>
                <li><a href=staff-login.jsp>SECURITY</a></li>
            </ul>
        </div>
        <button onclick="document.location='view-customer-details.jsp'" class="back-btn">Back</button>
        <h1>Send Notification</h1>
        
        <div class="recipient-tbl">
            <label class="to-label">To
                <input  type="email" class="email-input">
            </label><br>
            <label class="subject-label">Subject
                <input type="Subject" class="subject-input">
            </label><br>
        </div>
        
        <input type="text" placeholder="Enter your message..." class="message-input"><br>
        
        <button class="send-btn">Send</button>
    </body>
</html>
