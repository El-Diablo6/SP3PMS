<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>



	<%@ page import="com.model.User" %>
		<%@ page import="java.time.LocalDateTime" %>
			<%@ page import="java.time.format.DateTimeFormatter" %>

				<!DOCTYPE html>
				<html lang="en">

				<head>
					<meta charset="UTF-8">
					<meta name="viewport" content="width=device-width, initial-scale=1.0">
					<title>Parcel Management - Booking Service</title>
					<link rel="stylesheet" href="./CSS/booking.css">

				</head>

				<body>

					<% HttpSession sess=request.getSession(); 
					User obj=(User) sess.getAttribute("user"); 
					String role=obj.getRole();
					if(role.equalsIgnoreCase("customer")) 
					{ sess.invalidate();
						response.sendRedirect("login.jsp"); 
						return; } %>
						<% LocalDateTime myDateObj=LocalDateTime.now(); 
						DateTimeFormatter myFormatObj=DateTimeFormatter.ofPattern("yyyy-MM-dd'T'HH:mm"); 
						String formattedDate=myDateObj.format(myFormatObj); %>


							<jsp:include page="header.jsp"></jsp:include>

							<% String error=(String) request.getAttribute("error"); 
							if(error!=null) { %>
								<h2 id="heading"> User not Found</h2>
								<% } %>

									<main>
										<section class="booking-form">
											<h2>Book a Parcel :</h2>
											<form action="bookingservlet" method="post">
												<div class="form-section">



													<h3>Sender Information</h3>
													<div class="form-group">
														<label for="senderName">User Id:</label>
														<input type="text" id="senderName" name="userid" required>
													</div>


												</div>

												<div class="form-section">
													<h3>Receiver Information</h3>
													<div class="form-group">
														<label for="receiverName">Name:</label>
														<input type="text" id="receiverName" name="receiverName"
															required>
													</div>
													<div id="uservalidate">
														<p> Please enter a valid user name. </p>
													</div>
													<div class="form-group">
														<label for="receiverAddress">Address:</label>
														<input type="text" id="receiverAddress" name="receiverAddress"
															required>
													</div>
													<div class="form-group">
														<label for="receiverPincode">Pin Code:</label>
														<input type="text" id="receiverPincode" name="receiverPincode"
															required>
													</div>
													<div id="pincodevalidate">
														<p> Please enter a valid pin code. </p>
													</div>
													<div class="form-group">
														<label for="receiverContact">Contact Details:</label>
														<input type="text" id="receiverContact" name="receiverContact"
															required>
													</div>
													<div id="mobilevalidate">
														<p> Please enter a valid phone number. </p>
													</div>
												</div>

												<div class="form-section">
													<h3>Parcel Details</h3>

													<div class="form-group">
														<label for="parcelWeight">Weight (g):</label>
														<input type="number" id="parcelWeight" name="parcelWeight"
															required>
													</div>
													<div class="form-group">
														<label for="parcelContents">Contents Description:</label>
														<textarea id="parcelContents" name="parcelContents"
															required></textarea>
													</div>


												</div>
												<div class="form-section">
													<h3>Shipping Options</h3>
													<div class="form-group">
														<label for="deliverySpeed">Delivery Speed:</label>
														<select id="preference" name="preference">
															<option value="standard">Standard Delivery</option>
															<option value="express">Express Delivery</option>
															<option value="same-Day">Same-Day Delivery</option>
															<option value="overnight">Overnight Shipping</option>
															<option value="international">International Delivery
															</option>

														</select>

														<br>
														<br>


														<label for="deliverySpeed">Packaging Preference:</label>
														<select id="deliverySpeed" name="deliverySpeed">
															<option value="standard">Standard</option>
															<option value="fragile">Fragile</option>
															<option value="waterproof">Waterproof</option>
															<option value="eco">Eco-Friendly</option>
															<option value="gift">Gift Wrap</option>
															<option value="temperature">Temperature-Controlled</option>
														</select>
														<br>

														<br>
														<div class="datetime">
															<div class="pickup">
																<label for="pickupTime">Pickup Time:</label>
																<input type="datetime-local" id="pickupTime"
																	name="pickupTime" min="<%=formattedDate%>" required>
															</div>
															<br>
															<br>
															<div class="dropoff">
																<label for="dropTime">Dropoff Time:</label>
																<input type="datetime-local" id="dropTime"
																	name="dropTime" min="<%=formattedDate%>" required>
															</div>
															
														</div>
														<div id="timeError" class="error-message" style="display: none;">
																Dropoff time cannot be before pickup time
															</div>



													</div>
												</div>

												<div class="form-section">
													<h3>Payment</h3>
													<div class="form-group">
														<label for="parcelCost">Parcel Service Cost:</label>
														<input type="text" id="parcelCost" name="parcelCost" readonly>

														<div id="parcelError" class="error-message"
															style="display: none;"></div>

													</div>
												</div>



												<div class="form-group">
													<button type="submit" class="button" name="action" id="payment"
														value="adminbooking"  >Make Payment</button>
												</div>
											</form>
										</section>
									</main>
									<jsp:include page="footer.jsp"></jsp:include>
									<script>


										document.addEventListener('DOMContentLoaded', function () {
											const parcelWeight = document.getElementById('parcelWeight');
											const deliverySpeed = document.getElementById('deliverySpeed');
											const preference = document.getElementById('preference');
											const parcelCostTextarea = document.getElementById('parcelCost');
											const parcelErrorDiv = document.getElementById('parcelError');
											const receiverName = document.getElementById('receiverName');
											const uservaliddiv = document.getElementById('uservalidate');
											const receiverpin = document.getElementById('receiverPincode');
											const receiverContact = document.getElementById('receiverContact');
											const mobileValidateDiv = document.getElementById('mobilevalidate');
											const pincodeValidateDiv = document.getElementById('pincodevalidate');
											const payment=document.getElementById('payment');
											var namebool = false;
											var contactbool = false;
											var pinbool = false;
											var	timebool = false;
											receiverName.addEventListener('input', function () {
												
												const user1 = receiverName.value.trim();
												const user = user1.toLowerCase();
												const pattern1 = /^[A-Za-z\s]+$/;
												if (user === "" || user === "null" || user === "nan" || user === "undefined" || !pattern1.test(user) ){
													uservaliddiv.style.display = "block";
													namebool = false;
												}
												else if (user.length < 3) {
													uservaliddiv.style.display = "block";
													namebool = false;
												}
												else {
													uservaliddiv.style.display = "none";
													namebool = true;
													
												}
											});

											

											receiverContact.addEventListener('input', function () {
												
												const mobile = receiverContact.value;
												const mobilePattern = /^[6-9]\d{9}$/;

												if (!mobilePattern.test(mobile)) {
													mobileValidateDiv.style.display = 'block';
													mobileValidateDiv.querySelector('p').textContent = 'Please enter a valid phone number.';
													contactbool = false;
												}
												else if (/(.)\1{5,}/.test(mobile)) {
													mobileValidateDiv.style.display = 'block';
													contactbool = false;
													// More than 6 consecutive identical digits
												}
												else {
													mobileValidateDiv.style.display = 'none';
													contactbool = true;
													
													
												}
											});
											   
											
											receiverpin.addEventListener('input', function () {
												
												const pin = receiverpin.value;
												const pinPattern = /^[1-9][0-9]{5}$/;

												if (!pinPattern.test(pin)) {
													pincodeValidateDiv.style.display = 'block';
													pincodeValidateDiv.querySelector('p').textContent = 'Please enter a valid pin code.';
													pinbool = false;
												} else {
													pincodeValidateDiv.style.display = 'none';
													pinbool = true;
													

												}
											});


											function calculateParcelCost() {
												
												const weight = parseFloat(parcelWeight.value);
												const selectedDeliverySpeed = deliverySpeed.value;
												const selectedPreference = preference.value;

												let cost = 50;
												let error = '';

												if (isNaN(weight) || weight <= 0) {
													error = 'Please enter a valid parcel weight.';
												} else {

													cost = (weight * 0.01) * cost;

													if (selectedPreference === "standard") { // Corrected the selector here
														cost *= 1;
													} else if (selectedPreference === "express") {
														cost *= 1.5;
													} else if (selectedPreference === "same-Day") {
														cost *= 2.5;
													} else if (selectedPreference === "overnight") {
														cost *= 2;
													} else if (selectedPreference === "international") {
														cost *= 3;
													}

													if (selectedDeliverySpeed === "standard") {  //Corrected the selector here
														cost *= 1; // No extra cost for basic
													} else if (selectedDeliverySpeed === "fragile") {
														cost *= 1.1; // Add 10% for fragile
													} else if (selectedDeliverySpeed === "waterproof") {
														cost *= 1.07; // Add 7% for waterproof
													} else if (selectedDeliverySpeed === "eco") {
														cost *= 1.05; // Add 5% for eco-friendly
													} else if (selectedDeliverySpeed === "gift") {
														cost *= 1.12; // Add 12% for gift wrap
													} else if (selectedDeliverySpeed === "temperature") {
														cost *= 1.2; // Add 20% for temperature-controlled
													}

												}

												if (error) {
													parcelErrorDiv.textContent = error;
													parcelErrorDiv.style.display = 'block';
													parcelCostTextarea.value = '';
												} else {
													parcelErrorDiv.style.display = 'none';
													parcelCostTextarea.value = 'Rs.' + cost.toFixed(2);
													console.log(cost.toFixed(2));
													
												}

											}
										
											function validateDateTime() {
												
												const pickupTime = document.getElementById("pickupTime").value;
												const dropTime = document.getElementById("dropTime").value;
												const timeError = document.getElementById("timeError");

												if (pickupTime && dropTime) {
													
													if (dropTime < pickupTime) {
														timebool=false;
														timeError.style.display = "block"; // Show the error message
														timeError.textContent = "dropoff cannot be before pickup"
													} else {
														
														timebool=true;
														timeError.style.display = "none"; // Hide the error message
														timeError.textContent = ""
													}
												}
												else {
													timebool=false;
													timeError.style.display = "none";
													timeError.textContent = ""
														
												}
											}

                                          
                                           
											receiverName.addEventListener('blur', function () {
                                        	   if(namebool && contactbool && pinbool && timebool  ){
                                                   payment.disabled=false;
   											}
                                           });
											
											receiverContact.addEventListener('blur', function () {
	                                        	   if(namebool && contactbool && pinbool && timebool  ){
	                                                   payment.disabled=false;
	   											}
	                                           });
											receiverpin.addEventListener('blur', function () {
	                                        	   if(namebool && contactbool && pinbool && timebool  ){
	                                                   payment.disabled=false;
	   											}
	                                           });
											receiverpin.addEventListener('blur', function () {
	                                        	   if(namebool && contactbool && pinbool && timebool  ){
	                                                   payment.disabled=false;
	   											}
	                                           });
											document.getElementById("pickupTime").addEventListener('change', function () {
	                                        	   if(namebool && contactbool && pinbool && timebool  ){
	                                                   payment.disabled=false;
	   											}
	                                           });
											document.getElementById("dropTime").addEventListener('change', function () {
	                                        	   if(namebool && contactbool && pinbool && timebool  ){
	                                                   payment.disabled=false;
	                                                   
	   											}
	                                           });
											document.getElementById("pickupTime").addEventListener("change", validateDateTime);
											document.getElementById("dropTime").addEventListener("change", validateDateTime);


											parcelWeight.addEventListener('input', calculateParcelCost);
											deliverySpeed.addEventListener('change', calculateParcelCost);
											preference.addEventListener('change', calculateParcelCost);



										});
									</script>
				</body>

				</html>