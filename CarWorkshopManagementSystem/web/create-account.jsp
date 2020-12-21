<%-- 
    Document   : create-account
    Created on : Dec 18, 2020, 5:17:17 PM
    Author     : asus
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Create New Account</title>
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
                margin-top: 30px;
                margin-left: 35px;
                font-family: Arial, Helvetica, sans-serif;
            }
            
            h3 {
               margin-top: 15px;
               margin-left: 35px;
               font-family: Arial, Helvetica, sans-serif; 
               border-bottom: groove;
               width: 300px;
            }
            
            .admin-tbl {
                width: 650px;
                height: 175px;
                border: 1px solid black;
                border-radius: 10px;
                margin-left: 30px;
                font-family: Arial, Helvetica, sans-serif;
            }
            
            .admin-tbl input {
                
            }
            
            .email-label {
                margin-top: 20px;
                margin-left: 55px;
            }
            
            .admin-first-input {
                margin-left: 65px;
                width: 300px;
            }
            
            .password-label {
                margin-top: 20px;
                margin-left: 55px;
            }
            
            .admin-second-input {
                margin-left: 35px;
                width: 300px;
            }
            
            .staff-tbl {
                width: 650px;
                height: 325px;
                margin-top: 35px;
                margin-left: 30px;
                border: 1px solid black;
                border-radius: 10px;
                font-family: Arial, Helvetica, sans-serif;
            }
            
            .staff-tbl input {
                
            }
            
            .staff-first-label {
                margin-top: 45px;
                margin-left: 55px;
            }
            
            .staff-first-input {
                margin-left: 63px;
                width: 300px;
            }
            
            .staff-second-label {
                margin-top: 20px;
                margin-left: 55px;
            }
            
            .staff-second-input {
                margin-left: 34px;
                width: 300px;
            }
            
            .staff-third-label {
                margin-top: 20px;
                margin-left: 55px;
            }
            
            .staff-third-input {
                margin-left: 65px;
                width: 300px;
            }
            
            .staff-fourth-label {
                margin-top: 20px;
                margin-left: 55px;
            }
            
            .staff-fourth-input {
                margin-left: 35px;
                width: 300px;
            }
            
            .type-tbl {
                margin-top: 25px;
                margin-left: 55px;
            }

            .create-account-btn {
                font-family: Arial, Helvetica, sans-serif;
                margin-left: 45px;
                margin-top: 30px;
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
        
        <button onclick="document.location='staff-login.jsp'" class="back-btn">Back</button>
        
        <h1>New Account</h1>
        
        <div class="admin-tbl">
            <h3>Administration</h3>
            <label class="email-label">Email</label>
            <input type="text" class="admin-first-input"><br>
            <label class="password-label">Password</label>
            <input type="password" class="admin-second-input"><br>
        </div>
        
        <div class="staff-tbl">
            <label for="sname" class="staff-first-label">Name</label>
            <input type="text" name="sname" class="staff-first-input"><br>
            <label for="sphoneno" class="staff-second-label">Phone No</label>
            <input type="text" name="sphoneno" class="staff-second-input"><br>
            <label for="semail" class="staff-third-label">Email</label>
            <input type="text" name="semail" class="staff-third-input"><br>
            <label for="spassword" class="staff-fourth-label">Password</label>
            <input type="password" name="spassword" class="staff-fourth-input"><br>
            
            <div class="type-tbl">
                <input type="checkbox" name="optionone" value="technician">
                <label for="optionone">Technician</label><br>
            
                <input type="checkbox" name="optiontwo" value="staff">
                <label for="optiontwo">Staff</label><br>
            </div>
            
         </div>
        
        <button class="create-account-btn" class="create-account-btn">Create</button>

    </body>
</html>
