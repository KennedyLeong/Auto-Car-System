<%-- 
    Document   : order-confirmation
    Created on : Apr 9, 2019, 4:00:15 PM
    Author     : asus
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" href="style.css">
        <title>Apex Canteen | Order Confirmation</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
		<link rel="shortcut icon" type="image/x-icon" href="Pictures/favicon.jpg"/>
    </head>
    
    <body>
        <h1 style="text-align: left; position: absolute; top:-6%; left: 5%;">ORDER CONFIRMATION</h1>
        <div class="bg-text2">
            <div style="padding-top: 20px;">
                <div style="width: 60%; float: left;"><p style="text-align: left; font-size: 12px; padding-left: 45%">
                    <p name="mealName">${d}</p>
                    <p name="mealPrice">${d}</p>
                </div>
                <div style="width:30%; float: left;"><p style="text-align: left; font-size: 12px;"></p>
                        <p style="text-decoration: underline;">Date</p>
                            <label style="padding-right: 25px;" for="mealDateFrom">From</label>
                            <input style="width: 60%; text-align: center;"  type="date" id="mealDateFrom" value=""/><br/><br>
                            <label style="padding-right: 47px;" for="mealDateTo">To</label>
                            <input style="width: 60%; text-align: center;" type="date" id="mealDateTo" value=""/><br><br><br>
                        <p style="text-decoration: underline;">Remark</p>
                        <label for="comment"></label>
                            <input style="width: 300px; height: 150px;" type="text" id="comment" value=""/><br><br>
                            <button style="width: 40%" class="submitBtn">Continue</button>
                </div>
            </div>
        </div>
     </body>
</html>
