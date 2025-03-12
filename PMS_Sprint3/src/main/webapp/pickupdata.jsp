<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.*, java.text.*, com.model.*" %>
  <%@ page import="java.time.LocalDateTime" %>
    <%@ page import="java.time.format.DateTimeFormatter" %>


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


<%
    Booking booking = (Booking) request.getAttribute("booked");

%>
<%
	LocalDateTime myDateObj = LocalDateTime.now();
       
        DateTimeFormatter myFormatObj = DateTimeFormatter.ofPattern("yyyy-MM-dd'T'HH:mm");

        String formattedDate = myDateObj.format(myFormatObj);
       
        %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Pick-up Schedule</title>
    <link rel="stylesheet" href="./CSS/pickupdata.css">
</head>
<body>
     <jsp:include page="header.jsp"></jsp:include>

    <div class="container">
        <h2>Pick-up Schedule</h2>
        <% if (booking == null) { %>
            <p class="error">Error: Booking details not found!</p>
        <% } else { %>
            <p><strong>Booking ID:</strong> <%= booking.getBookingID() %></p>
            <p><strong>Full Name:</strong> <%= booking.getName() %></p>
            <p><strong>Address:</strong> <%= booking.getAddress() %></p>
            <p><strong>Recipient Name:</strong> <%= booking.getRecipientName() %></p>
            <p><strong>Recipient Address:</strong> <%= booking.getRecipienAddress() %></p>
            <p><strong>Date of Booking:</strong> <%= booking.getPaymentTime() %></p>
            <p><strong>Parcel Status:</strong> <%= booking.getParcelStatus() %></p>

            <form action="updateservlet" method="get">
                <input type="hidden" name="bookingId" value="<%= booking.getBookingID() %>">
                
                <label for="pickupTime">Pick-up Time:</label>
                <input type="datetime-local" id="pickupTime" name="pickupTime" 
                        value="<%=booking.getParcelPickupTime() %>" min="<%=formattedDate%>" required>
                
                <label for="dropoffTime">Drop-off Time:</label>
                <input type="datetime-local" id="dropoffTime" name="dropoffTime" 
                       value="<%=booking.getParcelDropoffTime() %>" min="<%=formattedDate%>" required>

                <button type="submit" name="action" value="timeupdate1" onclick="alert('Updation Successful')">Update</button>
            </form>

            <form action="pickupscheduling.jsp" method="get">
                <button type="submit">Back</button>
            </form>
        <% } %>
    </div>
    
     <jsp:include page="footer.jsp"></jsp:include>
</body>
</html>