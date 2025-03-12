
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.model.Booking"%>
<%@ page import="java.util.*"%>

<%
    ArrayList<Booking> bookings  = (ArrayList<Booking>) request.getAttribute("bookings");
%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Parcel Tracking Status</title>
    <link rel="stylesheet" href="./CSS/historydata.css">
    
    <style>
     .error{
     color:#d5636d;
        display:flex;
        justify-content:center;
        
     }
    </style>

</head>
<body>
	<jsp:include page="header.jsp"></jsp:include>
	<div class="container">
	
	
	 <% 
 String error=(String) request.getAttribute("error");
 
 
 %>
 
 


		<% if (bookings!=null) { %>


		<table>
			<tr>
				<th>Customer Id</th>
				<th>Booking Id</th>
				<th>Date of Booking</th>
				<th>Recipient Name</th>
				<th>Delivery Address</th>
				<th>Ammount</th>
				<th>Parcel Status</th>
				
			</tr>
			<% for(Booking booking:bookings) {%>
			<tr>
				<td><%= booking.getUserId() %></td>
				<td><%= booking.getBookingID() %></td>
				<td><%= booking.getPaymentTime() %></td>
				<td><%= booking.getRecipientName() %></td>
				<td><%= booking.getRecipienAddress() %></td>
				<td><%= booking.getServiceCost() %></td>
				<td><%= booking.getParcelStatus() %></td>
				
			</tr>
			<% } %>
		</table>
		<% } else { %>
		<h3 class="error">No records found </h3>
		<% } %>
	</div>

	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>

