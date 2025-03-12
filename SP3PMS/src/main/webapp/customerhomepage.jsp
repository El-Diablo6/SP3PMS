<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import ="com.model.*" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Parcel Management - Homepage</title>
    
    <!-- Updated CSS path -->
    <link rel="stylesheet" href="./CSS/custHomePage.css">
</head>

<body>
<%
		HttpSession sess = request.getSession();

		User obj = (User) sess.getAttribute("user"); 
		String role;
		
		role=obj.getRole();
		
		if(role.equalsIgnoreCase("admin"))
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
                <h1>Welcome to Parcel Management</h1>
                <p>Your reliable partner for all your parcel delivery needs.</p>
            </div>
        </section>
        <section class="features">
            <h2>Our Services</h2>
            <div class="feature-grid">
                <div class="feature">
                    <h3>Booking Service</h3>
                    <p>Book your parcel pickup and delivery with ease.</p>
                    <a href="./booking(modified).jsp" class="button">Book Now</a>
                </div>
                <div class="feature">
                    <h3>Tracking</h3>
                    <p>Track your parcels in real-time.</p>
                    <a href="./custtracking.jsp" class="button">Track Now</a>
                </div>
                <div class="feature">
                    <h3>Previous Bookings</h3>
                    <p>View your past bookings and details.</p>
                    <a href="trackingservlet?action=history" class="button">View</a>
                </div>
                <div class="feature">
                    <h3>Contact Support</h3>
                    <p>Get help from our dedicated support team.</p>
                    <a href="./support.jsp" class="button">Contact Us</a>
                </div>
            </div>
        </section>
    </main>

   <jsp:include page="footer.jsp"></jsp:include>

    <!-- Updated JS path -->
    <script src="./JavaScript Files/homepage.js"></script>
</body>

</html>
