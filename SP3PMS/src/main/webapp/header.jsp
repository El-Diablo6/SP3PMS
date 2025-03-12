
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="com.model.User"%>

<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="./CSS/header.css">
<meta charset="ISO-8859-1">
<title>header</title>
</head>
<body>

	<header>
		<div class="logo-container">
			<img src="./parcelLogo.jpg" alt="Parcel Management Logo" class="logo">
		</div>

		<%
		HttpSession sess = request.getSession();

		User obj = (User) sess.getAttribute("user");
		if (obj != null) {
			String role = obj.getRole();
			if (role.equalsIgnoreCase("customer")) {
		%>
		<nav>

			<ul>

				<li><a href="./customerhomepage.jsp">Home</a></li>
				<li><a href="./booking(modified).jsp">Booking Service</a></li>
				<li><a href="./custtracking.jsp">Tracking</a></li>
				<li><a href="./invoice1.jsp">Generate Invoice</a></li>
				<li><a href="trackingservlet?action=history">Previous Bookings</a></li>
				<li><a href="./support.jsp">Contact Support</a></li>



			</ul>

		</nav>

		<%
		} else {
		%>
		<nav>
			<ul>
				<li><a href="./adminhomepage.jsp">Home</a></li>
				<li><a href="./bookingadmin.jsp">BookingService</a></li>
				<li><a href="./invoice1.jsp">Generate Invoice</a></li>
				<li><a href="./custtracking.jsp">Tracking</a></li>

				<li><a href="./deliveryupdate.jsp">Update Status</a></li>
				<li><a href="./pickupscheduling.jsp">Pickup Scheduling</a></li>
				<li><a href="./adminpreviousbooking.jsp">Previous Bookings</a></li>
			</ul>
		</nav>
		<%
		}
		}
		%>






		<div class="user-info">
			<span id="welcomeMessage"> Welcome, <%=obj.getName()%>
			</span> <a href="loginservlet?action=logout" id="logoutLink">Logout</a>
		</div>
	</header>

</body>
</html>