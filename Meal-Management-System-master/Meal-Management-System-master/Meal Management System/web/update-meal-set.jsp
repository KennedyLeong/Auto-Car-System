<%-- 
    Document   : update-meal-set
    Created on : Apr 9, 2019, 4:01:40 PM
    Author     : asus
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" href="style.css">
        <title>Apex Canteen | Update Meal Set</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
		<link rel="shortcut icon" type="image/x-icon" href="Pictures/favicon.jpg"/>
    </head>
    
    <body>
        <h1 style="text-align: left; position: absolute; top:-6%; left: 5%;">UPDATE MEAL SET</h1>
            <div class="bg-text2">
            <div>
                <p>Please choose ingredients which is needed in the meal set.</p><br>
                <p>Meal Name${d}</p>
                <p>Price ${d}</p>
            </div>
                <div align="right">
                <div style="padding-right: 100px;" >
                    <input type="checkbox" name=""> Sausage
                    <input type="checkbox" name=""> Egg
                    <input type="checkbox" name=""> Chicken Wing
                    <input type="checkbox" name=""> Drumstick
                </div><br>
                <div style="padding-right: 125px;" >
                    <input type="checkbox" name=""> Vegetable
                    <input type="checkbox" name=""> Fish
                    <input type="checkbox" name=""> Fish Cake
                    <input type="checkbox" name=""> Coleslaw
                </div><br>
                <div style="padding-right: 98px" >
                    <input type="checkbox" name=""> Mushroom
                    <input type="checkbox" name=""> Mash Potatp
                    <input type="checkbox" name=""> Speggeti
                    <input type="checkbox" name=""> Rice
                </div><br><br>
                <div style="padding-right: 13%" >
                    <p style="padding-right: 170px;">Notes and Remarks</p>
                    <label for="comment"></label>
                    <input style="width: 300px; height: 70px;" type="text" id="comment" value=""/><br><br><br><br>
                </div>
                
                    <button style="width: 25%" class="submitBtn">SAVE & BACK TO HOME</button>
            </div>
        </div>
    </body>
</html>
