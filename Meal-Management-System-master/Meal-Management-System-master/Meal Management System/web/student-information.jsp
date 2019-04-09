<%-- 
    Document   : student-information
    Created on : Apr 9, 2019, 4:04:16 PM
    Author     : asus
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <header>
        <link rel="stylesheet" href="style.css">
        <title>Apex Canteen | Student Information</title>
         <meta name="viewport" content="width=device-width, initial-scale=1.0">
		<link rel="shortcut icon" type="image/x-icon" href="Pictures/favicon.jpg"/>
    </header>
    
    <body>
        <h1 style="text-align: left; position: absolute; top:-6%; left: 5%;">STUDENT INFORMATION</h1>
        <div class="bg-text2">
            <div style="padding-top: 80px;">
                <div style="width: 60%; float: left;"><p style="text-align: left; font-size: 12px; padding-left: 45%">
                    <p name="sName">${d}</p>
                    <p name="sId">${d}</p>
                    <p name="sEmail">${d}</p>
                    <p name="sPhoneNo">${d}</p>
                    <p name="creditPoint">${d}</p>
                </div>
                <div style="width:30%; float: left;"><p style="text-align: left; font-size: 12px;">
                    <button style="width: 60%;" class="submitBtn" href="">MEAL ORDERED</button><br><br><br>
                    <button style="width: 60%;" class="submitBtn" href="">ORDER HISTORY</button><br><br><br>
                    <button style="width: 60%;" class="submitBtn" href="">UPDATE USER INFORMATION</button><br><br><br>
                    <button style="width: 60%;" class="submitBtn" href="">CALORIES INTAKE</button>
                </div>
            </div>
        </div>
    </body>
</html>
