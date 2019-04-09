<%-- 
    Document   : order-history
    Created on : Apr 9, 2019, 4:05:05 PM
    Author     : asus
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" href="style.css">
        <title>Apex Canteen | Order History</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
		<link rel="shortcut icon" type="image/x-icon" href="Pictures/favicon.jpg"/>
        <style>
            tr, th {border: 1px solid black;}
        </style>
    </head>
    
    <body>
        <div>
        <h1 style="text-align: left; position: absolute; top:-6%; left: 5%;">ORDER HISTORY</h1>
        </div>
        <div class="bg-text2">
            <div style="float: right; width: 35%; padding-left: ">
                 <label for="search" class="pass">
				        <input type="text" id="search" required placeholder="&nbsp;">
				        <span class="label">Search</span>
				        <span class="border"></span>
			     </label><br><br><br>
            </div>
                <table style="width: 100%; border-collapse: collapse; height: 50px;">
                    <tr>
                        <th>Order Date</th>
                        <th>Order ID</th>
                        <th>Order Summary</th>
                        <th>Credit Point</th>
                    </tr>
                    <tr>
                        <th>${d}</th>
                        <th>${d}</th>
                        <th>${d}</th>
                        <th>${d}</th>
                    </tr>
                </table>
            <div>
            <p>Total Orders: ${d}</p><br>
            <button style="float: right;" type="button" class="submitBtn">Forward</button>
            <button type="button" class="submitBtn">Backward</button>
            </div>
        </div>
    </body>
</html>
