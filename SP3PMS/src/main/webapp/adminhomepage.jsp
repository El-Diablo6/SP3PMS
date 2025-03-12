<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" session="true"%>
<!DOCTYPE html>
<html lang="en">
<%@ page import="com.model.User"%>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Parcel Management - Officer Homepage</title>
<link rel="stylesheet" href="./CSS/homepage2.css">
</head>

<body>

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

	<jsp:include page="header.jsp"></jsp:include>

	<main>
		<section class="hero">
			<div class="hero-content">
				<h1>Welcome to Parcel Management - Officer Portal</h1>
				<p>Manage parcel deliveries efficiently.</p>
			</div>
		</section>
		<section class="features">
			<h2>Officer Actions</h2>
			<div class="feature-grid">
				<div class="feature">
					<h3>Tracking</h3>
					<p>Track parcels and update their status.</p>
					<a href="./custtracking.jsp" class="button">Track Now</a>
				</div>
				<div class="feature">
					<h3>Update Status</h3>
					<p>View and manage delivery statuses.</p>
					<a href="./deliveryupdate.jsp" class="button">View Status</a>
				</div>
				<div class="feature">
					<h3>Pickup Scheduling</h3>
					<p>Schedule parcel pickups.</p>
					<a href="./pickupscheduling.jsp" class="button">Schedule</a>
				</div>
				<div class="feature">
					<h3>Previous Bookings</h3>
					<p>View and manage details of previous bookings.</p>
					<a href="./adminpreviousbooking.jsp" class="button">View</a>
				</div>
			</div>
		</section>
	</main>

	<jsp:include page="footer.jsp"></jsp:include>
	<script src="./JavaScript Files/homepage.js"></script>
</body>

</html>
