<%-- 
    Document   : staff-information
    Created on : Apr 9, 2019, 4:04:41 PM
    Author     : asus
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" href="style.css">
        <title>Apex Canteen | Staff Information</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
		<link rel="shortcut icon" type="image/x-icon" href="Pictures/favicon.jpg"/>
    </head>
    
    <body>
        <h1 style="text-align: left; position: absolute; top:-6%; left: 5%;">STAFF INFORMATION</h1>
        <div class="bg-text2">
            <div style="padding-top: 50px;">
                <div style="width: 60%; float: left;"><p style="text-align: left; font-size: 12px; padding-left: 45%">
                    <p name="stName">${d}</p>
                    <p name="stId">${d}</p>
                    <p name="stPosition">${d}</p>
                    <p name="stEmail">${d}</p>
                    <p name="stPhoneNo">${d}</p>
                </div>
                <div style="width:30%; float: left;"><p style="text-align: left; font-size: 12px;">
                    <button style="width: 70%;" class="submitBtn" href="" >UPDATE MEAL SET</button><br><br><br>
                    <button style="width: 70%;" class="submitBtn" href="" >REPORTS</button><br><br><br>
                    <button style="width: 70%;" class="submitBtn" href="" >UPDATE USER INFORMATION</button><br><br><br>
                    <button style="width: 70%;" class="submitBtn" href="" >UPDATE USER INFORMATION</button><br>
                </div>
            </div>    
        </div>
    </body>
    <footer>
    </footer>
</html>
