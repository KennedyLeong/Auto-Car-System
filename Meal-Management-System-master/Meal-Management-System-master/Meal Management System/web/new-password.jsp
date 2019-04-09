<%-- 
    Document   : new-password
    Created on : Apr 9, 2019, 2:23:33 PM
    Author     : kiren
--%>

<html>
	<head>
		<link href="style.css" rel="stylesheet">
		<title>Apex Canteen | Reset Password</title>
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<link rel="shortcut icon" type="image/x-icon" href="Pictures/favicon.jpg"/>
	</head>
	
	<body>
		<h1 style="text-align: left; position: absolute; top:-6%; left: 5%;">Reset Your Password</h1>
		<div class="bg-text2"><p style="font-size: 28px">
			Reset Your Password</p><br/><br/>
			<p style="width: 55%; float: left;">Enter a new password for your account. We highly<br/> recommend you create a unique and easily<br/> remember password.</p>
			<div style="text-align: center; margin-left: 50%; width: 55%; ">
				<label for="pass" class="pass">
					<input type="password" id="pass" required placeholder="&nbsp;">
					<span class="label">New Password</span>
					<span class="border"></span>
				</label>
			
				<label for="confirm" class="confirm">
					<input type="password" id="confirm" required placeholder="&nbsp;">
					<span class="label">Confirm New Password</span>
					<span class="border"></span>
				</label><br/><br/>
				<input type="submit" value="Reset " class="submitBtn">
			</div>
		</div>
		
	</body>
</html>