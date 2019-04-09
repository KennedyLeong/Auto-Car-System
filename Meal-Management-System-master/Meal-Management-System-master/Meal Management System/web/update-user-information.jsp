<%-- 
    Document   : update-user-information
    Created on : Apr 9, 2019, 4:00:53 PM
    Author     : asus
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" href="style.css">
        <title>Apex Canteen | Update User Information</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
		<link rel="shortcut icon" type="image/x-icon" href="Pictures/favicon.jpg"/>
    </head>
    
    <body>
        <h1 style="text-align: left; position: absolute; top:-6%; left: 5%;">UPDATE USER INFORMATION</h1>
        <div class="bg-text2">
            <div>
            <div style="width: 60%; float: left;">
                <input type="file" name="profilepic" accept="image/*">
            </div>
            
            <div style="width:30%; float: left;"><p style="text-align: left; font-size: 12px;">
                 <p>First Name   ${d}</p><br>
                 <p>Last Name   ${d} </p><br>
                 <p> Student ID  ${d}</p><br>
                
                 <label for="sEmail" class="pass">
				        <input style="width: 90%;" type="text" id="sEmail" required placeholder="&nbsp;">
				        <span class="label">Email   ${d}</span>
				        <span class="border"></span>
			     </label><br>
                
                 <label for="sPhoneNo" class="pass">
				        <input style="width: 90%;" type="text" id="sPhoneNo" required placeholder="&nbsp;">
				        <span class="label">Phone No   ${d}</span>
				        <span class="border"></span>
			     </label><br>
                
                <label for="sCurrentPassword" class="pass">
				        <input style="width: 90%;" type="text" id="sCurrentPassword" required placeholder="&nbsp;">
				        <span class="label">Current Password   ${d}</span>
				        <span class="border"></span>
			     </label><br>
                
                <label for="sNewPassword" class="pass">
				        <input style="width: 90%;" type="text" id="sNewPassword" required placeholder="&nbsp;">
				        <span class="label">New Password   ${d}</span>
				        <span class="border"></span>
			     </label><br>
                
                <label for="sConfirmPassword" class="pass">
				        <input style="width: 90%;" type="text" id="sConfirmPassword" required placeholder="&nbsp;">
				        <span class="label">New Confirm Password   ${d}</span>
				        <span class="border"></span>
			     </label><br><br><br>
                
                <button class="submitBtn" href="">Back</button>
                <button class="submitBtn">Update</button>
            </div>
        </div> 
        </div>
     </body>
    <footer>
    
    </footer>
</html>
