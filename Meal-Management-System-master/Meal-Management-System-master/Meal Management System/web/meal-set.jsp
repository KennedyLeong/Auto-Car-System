<%-- 
    Document   : meal-set
    Created on : Apr 9, 2019, 3:59:31 PM
    Author     : asus
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" href="style.css">
        <title>Apex Canteen | Meal Set</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
		<link rel="shortcut icon" type="image/x-icon" href="Pictures/favicon.jpg"/>
    </head>
    
    <body> 
        <h1 style="text-align: left; position: absolute; top:-6%; left: 5%;">MEAL SET</h1>
            <div class="bg-text2">
                <div style="padding-top: 100px;">
                    <div style="width: 60%; float: left;"><p style="text-align: left; font-size: 12px; padding-left: 45%">
                        <p name="mName">${d}</p>
                        <p name="mId">${d}</p>
                        <p name="mPosition">${d}</p>
                        <p name="mEmail">${d}</p>
                        <p name="mPhoneNo">${d}</p>
                    </div>
                    <div style="width:30%; float: left;"><p style="text-align: left; font-size: 12px;">
                        <button style="width: 50%" class="submitBtn" href="">NEW</button><br><br><br>
                        <button style="width: 50%" class="submitBtn" href="">DELETE</button><br><br><br>
                        <button style="width: 50%" class="submitBtn" href="">MODIFY</button><br>
                    </div>
                </div>
            </div>  
    </body>
</html>