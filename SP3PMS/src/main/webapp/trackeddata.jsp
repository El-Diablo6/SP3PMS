<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.*, java.text.*, com.model.Booking" %>

<%


    // Retrieve booking details if present
    Booking booking = (Booking) request.getAttribute("booked");
  
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Tracking Status</title>
   <link rel="stylesheet" href="./CSS/deliverydata.css">
    
</head>
<body>
<jsp:include page="header.jsp"></jsp:include>



    <div class="container">
        <h2>Parcel Tracking</h2>
        
        

        <% if (booking != null) { %>
            <hr>
            <h3>Tracking Details</h3>
            <p><strong>Booking ID:</strong> <%= booking.getBookingID() %></p>
            <p><strong>Full Name:</strong> <%= booking.getName() %></p>
            <p><strong>Address:</strong> <%= booking.getAddress() %></p>
            <p><strong>Recipient Name:</strong> <%= booking.getRecipientName()%></p>
            <p><strong>Recipient Address:</strong> <%= booking.getRecipienAddress()%></p>
            <p><strong>Date of Booking:</strong> <%= booking.getPaymentTime() %></p>
            <p><strong>Parcel Status:</strong> <%= booking.getParcelStatus() %></p>
        <% } %>
        
         <form action="custtracking.jsp" method="get">
                <button type="submit">Back</button>
            </form>

       
    </div>
    
    <jsp:include page="footer.jsp"></jsp:include>

</body>
</html>


