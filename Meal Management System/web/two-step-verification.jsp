<%-- 
    Document   : two-step-verification
    Created on : Apr 9, 2019, 2:23:57 PM
    Author     : kiren
--%>

<html>
	<head>
		<link href="style.css" rel="stylesheet">
		<title>Apex Canteen | Two-Step Verification</title>
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<link rel="shortcut icon" type="image/x-icon" href="Pictures/favicon.jpg"/>
	</head>
	
	<body>
		<div class="bg-text2">
			<p style="font-size: 24px; margin: 0%;">Two Step-Verification</p>
		</div>
		<div class="bg-text3">
			<p style="text-align: left; padding-left: 8%; padding-right: 8%;">To verify you are not a robot, please enter your password to proceed your payment.</p>
			<label for="pass" class="pass">
				<input type="password" id="pass" required placeholder="&nbsp;">
				<span class="label">Password</span>
				<span class="border"></span>
			</label><br/><br/>
			<input type="submit" value="Verify" class="submitBtn">
		</div>
	</body>
</html>