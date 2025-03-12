<%@page import="com.model.Booking"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link href="./CSS/paymentcss.css" rel="stylesheet">
</head>
<body>
<% 
Booking b=(Booking) request.getAttribute("booked");
request.setAttribute("booked", b);

%>
	<header>
		<h2>Enter Card Details</h2>
	</header>
	<main class="payment-container">
		<form id="cardForm" action="bookingservlet" method="post">
			<fieldset>
				<legend></legend>
				<div class="form-group">
					<label>Payment Method:</label> <select id="paymentMethod">
						<option value="credit">Credit Card</option>
						<option value="debit">Debit Card</option>
					</select>
				</div>
				<div class="form-group">
					<label for="cardNumber">Card Number:</label>
					<div id="card-number-fields">
						<input type="text" class="cardNumberPart" maxlength="4"
							pattern="\d{4}" required> <b>-</b> <input type="text"
							class="cardNumberPart" maxlength="4" pattern="\d{4}" required>

						<b>-</b> <input type="text" class="cardNumberPart" maxlength="4"
							pattern="\d{4}" required> <b>-</b> <input type="text"
							class="cardNumberPart" maxlength="4" pattern="\d{4}" required>
					</div>

					<div id="cardNumberError" class="error-message hidden">Please
						enter a valid 16-digit card number.</div>
				</div>
				<div class="form-group">
					<label for="cardHolder">Card Holder Name:</label> <input
						type="text" id="cardHolder" required>
					<div id="cardHolderError" class="error-message hidden">Please
						enter card holder name.</div>
				</div>
				<div class="form-group">
					<div class="form-set">
						<label for="expiryDate">Expiry Date (MM/YY):</label> <label
							for="cvv">CVV:</label>
					</div>
					<div class="form-set">
						<input type="text" id="expiryDate"
							pattern="^(0[3-9]|1[0-2])\/([2-9][5-9]|[3-9][0-9])$" required title="Invalid month or year">

						<input type="text" id="cvv" pattern="\d{3}" maxlength="3" required
							title="Enter a valid 3-digit CVV">
					</div>
					<div class="form-set"></div>
					<div id="expiryDateError" class="error-message hidden">Format:
						MM/YY.</div>
					<div id="cvvError" class="error-message hidden">Enter a valid
						3-digit CVV.</div>
				</div>
				</div>
			</fieldset>
			<div class="form-group">
				<div class="form-set"></div>
				<button type="submit" class="button" id="payment" name="action" value="pay">Pay now</button>

			</div>
			<div class="form-set"></div>
			<button type="submit" class="button" onclick="history.back()" id="cancel" name="action" value="cancel">Cancel</button>
			</div>
			</div>

		</form>
	</main>

	<script>
	
document.addEventListener('DOMContentLoaded', function () {
	
	
const cardForm = document.getElementById('cardForm');
const cardNumberParts = document.querySelectorAll('.cardNumberPart');
const cardHolderInput = document.getElementById('cardHolder');
const expiryDateInput = document.getElementById('expiryDate');
const cvvInput = document.getElementById('cvv');
const cardName = document.getElementById('cardName');
const cardNumberError = document.getElementById('cardNumberError');
const cardHolderError = document.getElementById('cardHolderError');
const expiryDateError = document.getElementById('expiryDateError');
const cvvError = document.getElementById('cvvError');
function validateCardNumber(number) {
const pattern = /^\d{16}$/;
return pattern.test(number);
}
function validateCardHolder(name) {
const pattern = /^[A-Za-z\s]+$/;
return pattern.test(name);
}
function validateExpiryDate(date) {
const pattern = /^(0[1-9]|1[0-2])\/\d{2}$/;
return pattern.test(date);
}
function validateCVV(cvv) {
const pattern = /^\d{3}$/;
return pattern.test(cvv);
}

function onclick(){
	window.back();
}

function combineCardNumber() {
let fullNumber = '';
cardNumberParts.forEach(part => {
fullNumber += part.value;
});

return fullNumber;
}
//card type detection
cardNumberParts.forEach((part, index) => {
part.addEventListener('input', function (event) {
const input = event.target;
if (input.value.length >= input.maxLength) {
if (index < cardNumberParts.length - 1) {
cardNumberParts[index + 1].focus();
}
}
const fullNumber = combineCardNumber();
if (!validateCardNumber(fullNumber)) {
cardNumberError.classList.remove('hidden');
}
else {
cardNumberError.classList.add('hidden');
}
});
});

cardHolderInput.addEventListener('input', function () {
const cardHolder = cardHolderInput.value.trim();
if (!validateCardHolder(cardHolder)) {
cardHolderError.classList.remove('hidden');
cardHolderInput.setCustomValidity('Invalid Card holder Name');
} else {
cardHolderError.classList.add('hidden');
cardHolderInput.setCustomValidity('');
}
});
expiryDateInput.addEventListener('input', function () {
const expiryDate = expiryDateInput.value.trim();
if (!validateExpiryDate(expiryDate)) {
expiryDateError.classList.remove('hidden');
expiryDateInput.setCustomValidity('Invalid Expiry date');
} else {
expiryDateError.classList.add('hidden');
expiryDateInput.setCustomValidity('');
}

});
cvvInput.addEventListener('input', function () {
const cvv = cvvInput.value.trim();
if (!validateCVV(cvv)) {
cvvError.classList.remove('hidden');
cvvInput.setCustomValidity('Invalid CVV');
} else {
cvvError.classList.add('hidden');
cvvInput.setCustomValidity('');
}
});
cardForm.addEventListener('submit', function (event) {
const fullNumber = combineCardNumber();
if (!validateCardNumber(fullNumber)) {
event.preventDefault();
cardNumberError.classList.remove('hidden');
} else {
cardNumberError.classList.add('hidden');
}
if (!cardForm.checkValidity()) {
event.preventDefault();
return;
}
alert('Payment Successful!');
});
});
</script>
</body>
</html>