<%-- 
    Document   : meal-order
    Created on : Apr 9, 2019, 4:05:31 PM
    Author     : asus
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" href="style.css">
        <title>Apex Canteen | Meal Order</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
		<link rel="shortcut icon" type="image/x-icon" href="Pictures/favicon.jpg"/>
    </head>
    
    <body>
        <div>
        <h1 style="text-align: left; position: absolute; top:-6%; left: 5%;">MEAL ORDER</h1>
        </div>
            <div class="bg-text2">
                <div>
                   <p>${d}</p>
                   <P>${d}</P><br>
                    <label style="padding-right: 25px;" for="mealOrderDate">Date</label>
                    <input style="width: 20%; text-align: center;"  type="date" id="mealOrderDate" value=""/><br/><br>
                    <p>Nothing in the moment.</p>
                </div>
            </div>
    </body>
</html>
