<%-- 
    Document   : create-your-account
    Created on : Apr 9, 2019, 2:22:53 PM
    Author     : kiren
--%>

<html>
	<head>
		<link href="style.css" rel="stylesheet">
		<title>Apex University College Canteen</title>
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<link rel="shortcut icon" type="image/x-icon" href="Pictures/favicon.jpg"/>
	</head>
	
	<body>
		<h1>Create Your Account</h1>
		<div class="bg-text">
			<label for="id" class="id">
				<input type="text" id="id" required placeholder="&nbsp;">
				<span class="label">ID</span>
				<span class="border"></span>
			</label>
			
			<label for="email" class="email">
				<input type="text" id="email" required placeholder="&nbsp;">
				<span class="label">Email</span>
				<span class="border"></span>
			</label>
			
			<label for="pass" class="pass">
				<input type="password" id="pass" required placeholder="&nbsp;">
				<span class="label">Password</span>
				<span class="border"></span>
			</label>
			
			<label for="confirm" class="confirm">
				<input type="password" id="confirm" required placeholder="&nbsp;">
				<span class="label">Confirm Password</span>
				<span class="border"></span>
			</label><br/><br/>
			<input type="submit" class="submitBtn">
		</div>
	</body>
</html>
