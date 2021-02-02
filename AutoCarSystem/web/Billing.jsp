<%-- 
    Document   : index
    Created on : Dec 22, 2020, 9:42:22 AM
    Author     : asus
--%>
<%@page import="java.math.RoundingMode"%>
<%@page import="java.math.BigDecimal"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="java.time.LocalDate"%>
<%@page import="java.sql.*"%>
<%@page import="java.sql.DriverManager"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="customer" scope="session" class="Entity.Customer" />
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Payment</title>
        <link href="bootstrap/css/bootstrap.css" rel="stylesheet" type="text/css"/>
        <link href="bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        
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
                padding: 60px;
                font-size: 15px;
            }
            
            h1 {
                float: left;
                padding-left: 80px;
                margin-top: 90px;
                font-family: Arial, Helvetica, sans-serif;
            }

            .right-side {
                float: right;
                padding-right: 100px;
                margin-top: 50px;
                font-family: Arial, Helvetica, sans-serif;
            }

            .table-signin {
                font-family: Arial, Helvetica, sans-serif;
                float: right;
                width: 380px;
                border: 1px solid black;
                border-radius: 10px;
                padding: 30px;
                margin-top: 25px;
                
            }

            .second-input {
                margin-top: 30px;
            }
            
            .login-input input {
                width: 300px;
                border-top-style: hidden;
                border-right-style: hidden;
                border-left-style: hidden;
                border-bottom-style: groove;
            }

            .submit-btn {
                width: 300px;
                height: 40px;
                margin-top:  30px;
            }
            
            input[type=checkbox] {
                transform: scale(2.0);
                margin-left: 15px;
            }


            u {
                color: blue;
            }
            
            .create-account-tbl {
                margin-top: 15px;
            }

            
        </style>
    
        <% if (request.getSession().getAttribute("customerLoggedIn") != null) {%>
        <div class="navigation-bar">    
            <ul>
                <li><a href="Billing.jsp">BILLING</a></li>
                <li><a href="customer-profile.jsp"><%= customer.getCustomerName()%></a></li>
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
        
        <%
            double price = 0;
            double pricereal =0;
            LocalDate poDate = java.time.LocalDate.now();
            
            Connection connection = DriverManager.getConnection("jdbc:derby://localhost:1527/CarWorkshopDB", "nbuser", "nbuser");
            Statement statement = connection.createStatement();
            ResultSet resultset = statement.executeQuery("SELECT APP.APPOINTMENT_TOTALPRICE FROM APPOINTMENT APP,CUSTOMER C WHERE APP.CUSTOMER_ID = C.CUSTOMER_ID AND APP.APPOINTMENT_DATE ='"+ poDate +"' AND APP.CUSTOMER_ID = '"+ customer.getCustomerId()+"'");
            System.out.println(customer.getCustomerId());
            System.out.println(poDate);

            while (resultset.next()){
                price = Double.parseDouble(resultset.getString(1));
            }
            System.out.println("USD" + price);
            pricereal = price;
            price = price * 0.23836;
            System.out.println("RM" + price);
            BigDecimal bd = new BigDecimal(price).setScale(2, RoundingMode.HALF_UP);
            price = bd.doubleValue();
            
            System.out.println("RM" + price);
        %>
        
        <h1>AUTOCAR <br> SYSTEM</h1>
        
        <div class="right-side">    
            <div class=" right-side-date-time">
                <span id="datetime"></span><br>

                <script>
                    var dt = new Date();
                    var months = ["January","February","March","April","May","June","July","August","September","October","November","December"];
                    document.getElementById("datetime").innerHTML = (("0"+dt.getDate()).slice(-2)) +" "+ months[dt.getMonth()] +" "+ (dt.getFullYear()) +" <br> "+ (("0"+dt.getHours()).slice(-2)) +":"+ (("0"+dt.getMinutes()).slice(-2));
                </script>
            </div>
            <form>
                <input type="hidden" value="<%=price%>" id="getPrice">
                
                <div class="table-signin">
                    <h2>Pay Now</h2><br>
                        <!-- Set up a container element for the button -->
    <div id="paypal-button-container"></div>

    <!-- Include the PayPal JavaScript SDK -->
    <script src="https://www.paypal.com/sdk/js?client-id=sb&currency=USD"></script>

    <script>
        // Render the PayPal button into #paypal-button-container
        paypal.Buttons({

            // Set up the transaction
            createOrder: function(data, actions) {
                var price = document.getElementById("getPrice").value;
                alert(price);
                return actions.order.create({
                    purchase_units: [{
                        amount: {
                            value: price,
                            currency: 'MYR'
                        }
                    }]
                });
            },

            // Finalize the transaction
            onApprove: function(data, actions) {
                return actions.order.capture().then(function(details) {
                    // Show a success message to the buyer
                    alert('Transaction completed by ' + details.payer.name.given_name + '!');
                    
                    <%
                            int count = 1;
                            Connection connection2 = DriverManager.getConnection("jdbc:derby://localhost:1527/CarWorkshopDB", "nbuser", "nbuser");
                            Statement statement2 = connection2.createStatement();
                            ResultSet resultset2 = statement2.executeQuery("SELECT * FROM TRANSACTIONS");
                            
                            while (resultset2.next()){
                                count++;
                            }
                            
                            String transactionID = "TR" + count;
                            ResultSet resultset3 = statement2.executeQuery("SELECT APP.APPOINTMENT_ID FROM APPOINTMENT APP,CUSTOMER C WHERE APP.CUSTOMER_ID = C.CUSTOMER_ID AND APP.APPOINTMENT_DATE ='"+ poDate +"' AND APP.CUSTOMER_ID = '"+ customer.getCustomerId()+"'");
                            String appID="invalid";
                            while(resultset3.next()){
                                appID=resultset3.getString(1);
                            }
                            System.out.println(appID);
                            statement2.executeUpdate("INSERT INTO TRANSACTIONS VALUES ('"+ transactionID +"','"+ poDate +"',"+pricereal+",'"+appID+"')");
                    %>
                    window.location.href="http://localhost:8080/carWorkshopSystem2/customer-profile.jsp";
                });
            }


        }).render('#paypal-button-container');
    </script>
                </div>
            </form>
        </div>
        
    </body>
</html>
