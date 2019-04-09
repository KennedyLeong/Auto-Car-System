<%-- 
    Document   : student-login
    Created on : Apr 9, 2019, 2:22:00 PM
    Author     : kiren
--%>

<html>
	<head>
		<link href="style.css" rel="stylesheet">
		<title>Apex Canteen | Login</title>
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<link rel="shortcut icon" type="image/x-icon" href="Pictures/favicon.jpg"/>
	</head>
	<body>
		<h1>LOGIN</h1>
		<div class="bg-text">
			<p style="font-size: 20px">STUDENT</p>
			<label for="id" class="id">
				<input type="text" id="id" required placeholder="&nbsp;">
				<span class="label">Student ID</span>
				<span class="border"></span>
			</label>
			
			<label for="pass" class="pass">
				<input type="password" id="pass" required placeholder="&nbsp;">
				<span class="label">Password</span>
				<span class="border"></span>
			</label>
			
			<div style="width: 55%; float: left;"><p style="text-align: left; font-size: 12px; padding-left: 45%" ><a href="create-your-account.html">Sign Up</a></p></div>
			<div style="width:45%; float: left;"><p style="text-align: left; font-size: 12px;"><a href="reset-password.html">Forgot Your Password?</a></p></div>
			
			<div style="width: 100%">
				<button class="submitBtn">Login</button>
			</div>	
		</div>
	</body>
</html>