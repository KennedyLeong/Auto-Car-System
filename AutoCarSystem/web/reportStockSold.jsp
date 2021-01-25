<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="customer" scope="session" class="Entity.Customer" />
<jsp:useBean id="staff" scope="session" class="Entity.Staff" />
<!DOCTYPE html>

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Low Stock Count List</title>
        <link href="bootstrap/css/bootstrap.css" rel="stylesheet" type="text/css"/>
        <link href="bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <!-- Latest compiled and minified CSS -->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">

        <!-- jQuery library -->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

        <!-- Popper JS -->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>

        <!-- Latest compiled JavaScript -->
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
        
        <!--===============================================================================================-->	
	<link rel="icon" type="image/png" href="images/icons/favicon.ico"/>
        <!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="vendor/bootstrap/css/bootstrap.min.css">
        <!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="fonts/font-awesome-4.7.0/css/font-awesome.min.css">
        <!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="vendor/animate/animate.css">
        <!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="vendor/select2/select2.min.css">
        <!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="vendor/perfect-scrollbar/perfect-scrollbar.css">
        <!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="css/util.css">
	<link rel="stylesheet" type="text/css" href="css/main.css">
        <!--===============================================================================================-->
        
        <!--===============================================================================================-->	
	<script src="vendor/jquery/jquery-3.2.1.min.js"></script>
        <!--===============================================================================================-->
	<script src="vendor/bootstrap/js/popper.js"></script>
	<script src="vendor/bootstrap/js/bootstrap.min.js"></script>
        <!--===============================================================================================-->
	<script src="vendor/select2/select2.min.js"></script>
        <!--===============================================================================================-->
	<script src="js/main.js"></script>
        
        <style>

            .navigation-bar {
                font-family: Arial, Helvetica, sans-serif;
                height: 35px;
                padding-top: 6px;
                background-color: #cccccc; 
            }
            
            a {
                text-decoration: none;
                color: black;
            }
            
            ul {
                text-align:center;
                list-style-type: none;
            }
            
            li{
                display: inline;
                padding: 50px;
                font-size: 15px;
            }
            
            h1 {
                float: left;
                padding-left: 50px;
                margin-top: 60px;
                font-family: Arial, Helvetica, sans-serif;
            }
            
            
            
            .right-side {
                float: right;
                padding-right:  50px;
                margin-top: 30px;
                font-family: Arial, Helvetica, sans-serif;
            }
            
            .right-side-date-time {
                
            }
            
            .table-appointment {
                font-family: Arial, Helvetica, sans-serif;
                float: right; 
                width: 380px;
                border: 1px solid black;
                border-radius: 10px;
                padding: 20px;
                margin-top: 5px;
                
            }
            
            .appointment-label {
                border-bottom: groove;
            }
                
                .submit-btn {
                font-family: Arial, Helvetica, sans-serif;
                margin-left: 100px;
                margin-top: 20px;
                height: 35px;
                width: 150px;
            }
            
            .appointment-tbl input {
                border-top-style: hidden;
                border-right-style: hidden;
                border-left-style: hidden;
                border-bottom-style: groove;
            }
            
        </style>
        <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
        
        <% if (request.getSession().getAttribute("customerLoggedIn") != null) {%>
        <div class="navigation-bar">    
            <ul>
                <li><a href="Billing.jsp">BILLING</a></li>
                <li><a href="customer-profile.jsp"><%= customer.getCustomerName()%></a></li>
            </ul>
        </div>
        <%} else if (request.getSession().getAttribute("staffLoggdIn") != null) {%>
        <div class="navigation-bar">    
            <ul>
                <li><a href="main-menu.jsp">HOME</a></li>
                <li><a href="workflow-scheduler.jsp">WORKFLOW SCHEDULER</a></li>
                <li><a href="search-customer.jsp">CRM</a></li>
                <li><a href="inventoryMain.jsp">INVENTORY</a></li>
                <li><a href="supplier.jsp">SUPPLIERS</a></li>
                <li><a href="procurement.jsp">PROCUREMENT</a></li>
                <li><a href=staff-profile.jsp><%= staff.getStaffName()%></a></li>             
            </ul>
        </div>
        <%} else {%>
        <div class="navigation-bar">    
            <ul>
                <li><a href="index.jsp">HOME</a></li>
                <li><a href=staff-login.jsp>SECURITY</a></li>             
            </ul>
        </div>
        <%}%>
    
    </head>
    
    
    
    <body>
<%
           Connection connection = DriverManager.getConnection("jdbc:derby://localhost:1527/CarWorkshopDB","nbuser","nbuser");
           Statement statement = connection.createStatement() ;
           ResultSet resultset = statement.executeQuery("SELECT STOCKTYPE,STOCKDESC,TOTALAMOUNT from STOCKS WHERE TOTALAMOUNT <= 8 ORDER BY TOTALAMOUNT ASC") ;
%>
        <div class="container p-3 my-3 border">
                
            
            <div class="limiter">
		<div class="container-table100">
			<div class="wrap-table100">
				<div class="table100">
                                    <h3>Stock Count Report</h3>
                                    <br>
					<table>
						<thead>
							<tr class="table100-head">
								<th class="column1">STOCK TYPE</th>
								<th class="column2">STOCK DESCRIPTION</th>
								<th class="column4">QUANTITY</th>
							</tr>
						</thead>
						<tbody>
								</TR>
      <% while(resultset.next()){  %>
      <TR>
       <TD> <%= resultset.getString(1) %></td>
       <TD> <%= resultset.getString(2) %></TD>
       <TD> <%= resultset.getString(3) %></TD>
      </TR>
      <% } %>
								
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>
                
                <br><br>
            

            <form action="reportMain.jsp">
                <input type="submit" class="submit-btn" value = "Back" name="report" style="float:left;margin-top:-20px;" >
            </form>
            
            </div>
    </body>
            
    
