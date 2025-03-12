<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*, java.text.*, com.model.*" %>

<%


    // Retrieve booking details if present
    Booking booking = (Booking) request.getAttribute("booked");
  
%>

<%
		HttpSession sess = request.getSession();

		User obj = (User) sess.getAttribute("user"); 
		String role;
		
		role=obj.getRole();
		
		if(role.equalsIgnoreCase("customer"))
		{
			sess.invalidate();
			response.sendRedirect("login.jsp");
			
			return;
		}

%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Delivery Status</title>
<link rel="stylesheet" href="./CSS/deliverydata.css">

</head>
<body>
	<jsp:include page="header.jsp"></jsp:include>

	<div class="container">
		<h2>Delivery Status</h2>



		<% if (booking != null) { %>
		<hr>
		<h3>Booking Details</h3>
		<p>
			<strong>Booking ID:</strong>
			<%= booking.getBookingID() %></p>
		<p>
			<strong>Full Name:</strong>
			<%= booking.getName() %></p>
		<p>
			<strong>Address:</strong>
			<%= booking.getAddress() %></p>
		<p>
			<strong>Recipient Name:</strong>
			<%= booking.getRecipientName() %></p>
		<p>
			<strong>Recipient Address:</strong>
			<%= booking.getRecipienAddress() %></p>
		<p>
			<strong>Date of Booking:</strong>
			<%= booking.getPaymentTime() %></p>
		<p>
			<strong>Parcel Status:</strong>
			<%= booking.getParcelStatus() %></p>

		<!-- Form to Update Delivery Status -->
		<form action="updateservlet" method="post">
			<input type="hidden" name="bookingID"
				value="<%= booking.getBookingID() %>"> 
				<label for="status">Update Status:</label> 
				<select id="status" name="status" required>
				<% if("Booked".equals(booking.getParcelStatus())){ %>
				<option value="Booked"
					<%= "Booked".equals(booking.getParcelStatus()) ? "selected" : "" %>>Booked</option>
				<option value="In Transit"
					<%= "In Transit".equals(booking.getParcelStatus()) ? "selected" : "" %>>In
					Transit</option>
				<option value="Delivered"
					<%= "Delivered".equals(booking.getParcelStatus()) ? "selected" : "" %>>Delivered</option>
				<option value="Returned"
					<%= "Returned".equals(booking.getParcelStatus()) ? "selected" : "" %>>Returned</option>
					<%}
				else if("In Transit".equals(booking.getParcelStatus())){ %>
				<option value="In Transit"
					<%= "In Transit".equals(booking.getParcelStatus()) ? "selected" : "" %>>In
					Transit</option>
				<option value="Delivered"
					<%= "Delivered".equals(booking.getParcelStatus()) ? "selected" : "" %>>Delivered</option>
				<option value="Returned"
					<%= "Returned".equals(booking.getParcelStatus()) ? "selected" : "" %>>Returned</option>
					<%}
				else if("Delivered".equals(booking.getParcelStatus())){ %>
				
				<option value="Delivered"
					<%= "Delivered".equals(booking.getParcelStatus()) ? "selected" : "" %>>Delivered</option>
				<option value="Returned"
					<%= "Returned".equals(booking.getParcelStatus()) ? "selected" : "" %>>Returned</option>
					<%} %>
			</select>

			<button type="submit" name="action"
							value="deliveryupdate1" onclick="alert('update successfull')">Update Status</button>
		</form>
		<% } %>

		<form action="deliveryupdate.jsp" method="get">
			<button type="submit">Back</button>
		</form>
	</div>
	

</body>
</html>