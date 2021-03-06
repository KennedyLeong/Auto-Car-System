  


<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="customer" scope="session" class="Entity.Customer" />
<jsp:useBean id="staff" scope="session" class="Entity.Staff" />
<!DOCTYPE html>

<%
           Connection connection = DriverManager.getConnection("jdbc:derby://localhost:1527/CarWorkshopDB","nbuser","nbuser");
           Statement statement = connection.createStatement() ;
          ResultSet resultset = statement.executeQuery("select * from STOCKS") ;
        %>

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Home</title>
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
            
            * { box-sizing:border-box; }
            
            .group{ 
                position:relative; 
                margin-bottom:45px; 
                  }
            input{
                font-size:18px;
                padding:10px 10px 10px 5px;
                display:block;
                width:300px;
                border:none;
                border-bottom:1px solid #757575;
                }
            input:focus{ outline:none; }
            
            label 				 {
  color:#999; 
  font-size:18px;
  font-weight:normal;
  position:absolute;
  pointer-events:none;
  left:5px;
  top:10px;
  transition:0.2s ease all; 
  -moz-transition:0.2s ease all; 
  -webkit-transition:0.2s ease all;
}

/* active state */
input:focus ~ label, input:valid ~ label 		{
  top:-20px;
  font-size:14px;
  color:#5264AE;
}

/* BOTTOM BARS ================================= */
.bar 	{ position:relative; display:block; width:300px; }
.bar:before, .bar:after 	{
  content:'';
  height:2px; 
  width:0;
  bottom:1px; 
  position:absolute;
  background:#5264AE; 
  transition:0.2s ease all; 
  -moz-transition:0.2s ease all; 
  -webkit-transition:0.2s ease all;
}
.bar:before {
  left:50%;
}
.bar:after {
  right:50%; 
}

/* active state */
input:focus ~ .bar:before, input:focus ~ .bar:after {
  width:50%;
}

/* HIGHLIGHTER ================================== */
.highlight {
  position:absolute;
  height:60%; 
  width:100px; 
  top:25%; 
  left:0;
  pointer-events:none;
  opacity:0.5;
}

/* active state */
input:focus ~ .highlight {
  -webkit-animation:inputHighlighter 0.3s ease;
  -moz-animation:inputHighlighter 0.3s ease;
  animation:inputHighlighter 0.3s ease;
}

/* ANIMATIONS ================ */
@-webkit-keyframes inputHighlighter {
	from { background:#5264AE; }
  to 	{ width:0; background:transparent; }
}
@-moz-keyframes inputHighlighter {
	from { background:#5264AE; }
  to 	{ width:0; background:transparent; }
}
@keyframes inputHighlighter {
	from { background:#5264AE; }
  to 	{ width:0; background:transparent; }
}

.container 		{ 
  font-family:'Roboto';
  width:600px; 
  margin:30px auto 0; 
  display:block; 
  background:#FFF;
  padding:10px 50px 50px;
}.container 		{ 
  font-family:'Roboto';
  width:600px; 
  margin:30px auto 0; 
  display:block; 
  background:#FFF;
  padding:10px 50px 50px;
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
                float: right;
                font-size: 16px;
            }
            
        </style>
       <% if (request.getSession().getAttribute("customerLoggedIn") != null) {%>
        <div class="navigation-bar">    
            <ul>
                <li><a href="billingEntry.jsp">BILLING</a></li>
                <li><a href="customer-profile.jsp"><%= customer.getCustomerName()%></a></li>
            </ul>
        </div>
        <%} else if (request.getSession().getAttribute("managerLoggdIn") != null) {%>
        <div class="navigation-bar">    
            <ul>
                <li><a href="main-menu.jsp">HOME</a></li>
                <li><a href="workflow-scheduler.jsp">WORKFLOW SCHEDULER</a></li>
                <li><a href="search-customer.jsp">CRM</a></li>
                <li><a href="inventoryMain.jsp">INVENTORY</a></li>
                <li><a href="supplier.jsp">SUPPLIERS</a></li>
                <li><a href="procurement.jsp">PROCUREMENT</a></li>
                <li><a href="manager-profile.jsp"><%= staff.getStaffName()%></a></li>             
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
                <li><a href="staff-profile.jsp"><%= staff.getStaffName()%></a></li>             
            </ul>
        </div>
        <%} else {%>
        <div class="navigation-bar">    
            <ul>
                <li><a href="index.jsp">HOME</a></li>
                <li><a href="staff-login.jsp">SECURITY</a></li>    
            </ul>
        </div>
        <%}%>
    
    </head>
    
    
    
    <body>
        <div class="container p-3 my-3 border" style="float:right">
                
            
            <div class="limiter" >
		<div class="container-table100">
			<div class="wrap-table100">
				<div class="table100">
                                    <h3> Current Inventory</h3>
                                    <br>
					<table>
						<thead>
							<tr class="table100-head">
								<th class="column1">STOCK ID</th>
								<th class="column2">STOCK NAME</th>
								<th class="column3">STOCK DESCRIPTION</th>
								<th class="column4">TOTAL AMOUNT</th>
								<th class="column5">SUPPLIER ID</th>
							</tr>
						</thead>
						<tbody>
								</TR>
      <% int count = 1; while(resultset.next()){ count++; %>
      <TR>
       <TD> <%= resultset.getString(1) %></td>
       <TD> <%= resultset.getString(2) %></TD>
       <TD> <%= resultset.getString(3) %></TD>
       <TD> <%= resultset.getString(4) %></TD>
       <TD> <%= resultset.getString(5) %></TD>
      </TR>
      <% } %>
								
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>
    </div>
      
        <h1 style="float:left">Stock Manager</h1>
        <div class="container p-3 my-3 border" style="float:bottom">
            
            <div class="container">
                
                <div class="group" style="bottom:15px">      
                    <strong style="font-family:Roboto;font-size: 20px">Stock Information</strong>
                </div>
                
                
   
                <form action="SendMail" method="post">  
                    To:<input type="text" name="to"/><br/>  
                    Subject:<input type="text" name="subject"><br/>  
                    Text:<textarea rows="10" cols="70" name="msg"></textarea><br/>  
                    <input type="submit" value="send"/>  
                </form>
                
                <form action="index.jsp">
                   <input type="submit" class="btn btn-primary" value = "Back" name="deletestock"  >
                </form>


            </div>
	</div>

    </body>
            
    
