<%-- 
    Document   : top-up
    Created on : Apr 9, 2019, 4:03:09 PM
    Author     : asus
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" href="style.css">
        <title>Apex Canteen | Top-Up</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
		<link rel="shortcut icon" type="image/x-icon" href="Pictures/favicon.jpg"/>
    </head>
    
    <body>
        <h1>TOP UP</h1>
        <div class="bg-text">
            <div style="padding-top: 45px;">
                <label for="sId" class="pass">
				        <input type="text" id="sId" required placeholder="&nbsp;">
				        <span class="label">Student ID:</span>
				        <span class="border"></span>
			     </label><br><br>
                    <select style="width: 40%; height: 30px;">
                        <option value="">Select the amount</option>
                        <option value="100">RM 10 for 100 Credit Points</option>
                        <option value="250">RM 25 for 250 Credit Points</option>
                        <option value="500">RM 50 for 500 Credit Points</option>
                        <option value="1000">RM 100 for 1000 Credit Points</option>
                    </select><br><br><br>
                <button class="submitBtn">Proceed</button>
            </div> 
        </div>
     </body>
</html>
