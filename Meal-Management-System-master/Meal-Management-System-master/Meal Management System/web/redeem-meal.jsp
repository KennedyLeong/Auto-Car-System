<%-- 
    Document   : redeem-meal
    Created on : Apr 9, 2019, 2:21:10 PM
    Author     : kiren
--%>

<html>
	<head>
		<link href="style.css" rel="stylesheet">
		<title>Apex Canteen | Redeem Meal</title>
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<link rel="shortcut icon" type="image/x-icon" href="Pictures/favicon.jpg"/>
	</head>
	
	<body>
		<h1 style="text-align: left; padding-left: 10%;">Redeem Meal<span style="float: right; padding-right: 5%;"><p style="font-size: 16px;" id="date"></p></span></h1>
		<script>
			var months = ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"];
			var n = new Date();
			var y = n.getFullYear();
			var m = n.getMonth();
			var d = n.getDate();
			document.getElementById("date").innerHTML = d + " " + months[m] + " " + y;
		</script>
		
		<div class="bg-text">
			<label for="id" class="id">
				<input type="text" id="id" required placeholder="&nbsp;">
				<span class="label">Order Code</span>
				<span class="border"></span>
			</label><br/>
			<button class="submitBtn" onclick="alertBox()">Claim</button>
			<script>
			function alertBox(){
				alert("Meal Claimed!");
			}
			</script>
			<p style="padding-top: 20%">Please enter a valid order code to redeem meal.</p>
		</div>
	</body>
</html>
