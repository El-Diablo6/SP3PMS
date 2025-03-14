<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Parcel Management - Tracking</title>
    
    <!-- Corrected CSS Path -->
    <link rel="stylesheet" href="./CSS/tracking.css">
</head>

<body>
   
    <jsp:include page="header.jsp"></jsp:include>

    <main>
        <section class="tracking-page">
        <form action="trackingservlet.java" method="post">
        <h2>Track Your Parcel</h2>
            <div class="tracking-form">
                <div class="form-group">
                    <label for="bookingId">Booking ID:</label>
                    <input type="text" id="bookingId" name="bookingId" maxlength="12" required>
                    <span class="error-message" id="bookingIdError"></span>
                </div>
                <div class="form-group">
                    <button id="searchButton" class="button" name="action" value="searchparcel">Search</button>
                </div>
            </div>
            <div id="trackingStatus" class="tracking-status" style="display: none;">
                <h3>Tracking Status</h3>
                <div class="status-message"></div>
            </div>
        </form>
            
        </section>
    </main>

    <jsp:include page="footer.jsp"></jsp:include>
    <!-- Corrected JavaScript Path -->
    <script src="./JavaScript Files/tracking.js"></script>

</body>

</html>
