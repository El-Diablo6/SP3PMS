<%@page import="com.model.Booking"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Parcel Management - Invoice</title>
    <link rel="stylesheet" href="./CSS/invoice.css">
</head>

<body>

	<%
	HttpSession sess=request.getSession();
	Booking b = (Booking) sess.getAttribute("booked");
	

	%>
	

     

    <jsp:include page="header.jsp"></jsp:include>
    

    
    <% if(b!=null) { %>
    <main>
        <section class="invoice-page">
            <h2>Invoice</h2>
            <div class="invoice-details">
                <div class="invoice-info">
                    <div class="form-group">
                        <label for="bookingId">Booking ID:</label>
                        <span id="bookingId"><%= b.getBookingID() %> </span>
                     
                    </div>
                </div>
                <div class="receiver-info">
                    <h3>Receiver Information</h3>
                    <div class="form-group">
                        <label for="receiverName">Receiver Name:</label>
                        <span id="receiverName"> <%= b.getRecipientName() %> </span>
                    </div>
                    <div class="form-group">
                        <label for="receiverAddress">Receiver Address:</label>
                        <span id="receiverAddress"> <%= b.getRecipienAddress() %> </span>
                    </div>
                    <div class="form-group">
                        <label for="receiverPin">Receiver Pin:</label>
                        <span id="receiverPin"> <%= b.getRecipientPin() %> </span>
                    </div>
                    <div class="form-group">
                        <label for="receiverMobile">Receiver Mobile:</label>
                        <span id="receiverMobile"><%= b.getRecipientMobile() %></span>
                    </div>
                </div>
                <div class="parcel-info">
                    <h3>Parcel Information</h3>
                    <div class="form-group">
                        <label for="parcelWeight">Parcel Weight:</label>
                        <span id="parcelWeight"><%= b.getParcelWeight() %></span>
                    </div>
                    <div class="form-group">
                        <label for="parcelContents">Parcel Contents Description:</label>
                        <span id="parcelContents"><%= b.getParcelContentsDescription() %></span>
                    </div>
                    <div class="form-group">
                        <label for="parcelDeliveryType">Parcel Delivery Type:</label>
                        <span id="parcelDeliveryType"><%=b.getParcelPackingPreference() %></span>
                    </div>
                    <div class="form-group">
                        <label for="parcelPackingPreference">Parcel Packing Preference:</label>
                        <span id="parcelPackingPreference"><%= b.getParcelDeliveryType() %></span>
                    </div>
                    <div class="form-group">
                        <label for="parcelPickupTime">Parcel Pickup Time:</label>
                        <span id="parcelPickupTime"> <%=b.getParcelPickupTime() %> </span>
                    </div>
                    <div class="form-group">
                        <label for="parcelDropoffTime">Parcel Drop-off Time:</label>
                        <span id="parcelDropoffTime"><%= b.getParcelDropoffTime() %> </span>
                    </div>
                </div>
                <div class="payment-summary"> 
                    <h3>Payment Summary</h3>
                    <div class="form-group">
                        <label for="parcelServiceCost">Parcel Service Cost:</label>
                        <span id="parcelServiceCost"> <%= b.getServiceCost() %> </span>
                    </div>
                    <div class="form-group">
                        <label for="paymentTime">Payment Time:</label>
                        <span id="paymentTime"> <%= b.getPaymentTime() %> </span>
                    </div>
                    
                </div>
            </div>
           
        </section>
    </main>
 <% } %>> 
    <jsp:include page="footer.jsp"></jsp:include>
    <script src="./JavaScript Files/invoice.js"></script>
</body>

</html>
