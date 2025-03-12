<%@ page import ="com.model.*" %>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<style>
body {
    font-family: 'Arial', sans-serif;
    display: flex;
    justify-content: center;
    align-items: center;
    min-height: 100vh;
    background-color: #f0f4f8;
    color: #333;
}

.message p{
	color:red;
}
.registration-container {
    background-color: #fff;
    padding: 40px;
    border-radius: 8px;
    box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
    width: 600px; /* Wider form for more content */
}

.registration-header {
    text-align: center;
    margin-bottom: 30px;
}

.logo {
    max-width: 150px;
    margin-bottom: 10px;
}

.registration-header h1 {
    font-size: 1.8em;
    color: #2c67a7;
}

/* Form Styles */
.section {
    margin-bottom: 30px;
}

.section h2 {
    margin-bottom: 15px;
    color: #2c67a7;
}

.form-group {
    margin-bottom: 15px;
}

.form-group label
 {
    display: block;
    margin-bottom: 5px;
    font-weight: 600;
}

.form-group input[type="text"],
.form-group input[type="email"],
.form-group input[type="password"],
.form-group input[type="tel"],
.form-group select,
.form-group textarea {
    width: 100%;
    padding: 12px;
    border: 1px solid #ccc;
    border-radius: 4px;
    box-sizing: border-box;
    font-size: 1em;
}

.form-group textarea {
    resize: vertical; /* Allow vertical resizing */
}

.form-group .mobile-input {
    display: flex;
    gap: 10px;
}

.form-group .mobile-input select {
    width: auto;
}

.form-group .mobile-input input {
    flex-grow: 1;
}

/* Form Actions */
.form-actions {
    margin-top: 30px;
    text-align: center;
}

.form-actions button {
    background-color: #2c67a7;
    color: white;
    padding: 14px 20px;
    border: none;
    border-radius: 4px;
    cursor: pointer;
    font-size: 1.1em;
    transition: background-color 0.3s;
    margin-left: 10px;
}

.form-actions button[type="reset"] {
    background-color: #6c757d; /* Grey for reset */
}

.form-actions button:hover {
    background-color: #1e4a79;
}

/* Error Messages */
.error-message {
    color: #d9534f;
    font-size: 0.9em;
    margin-top: 5px;
}

/* Success Message */
#registrationSuccess {
    background-color: #dff0d8; /* Light green */
    border: 1px solid #d0e9c6;
    color: #3c763d; /* Dark green */
    padding: 20px;
    border-radius: 4px;
    margin-top: 30px;
}

.hidden {
    display: none;
}
   #emailvalidate {
	color:red;
	font-size:0.8em;
	display:none;
}
#mobilevalidate {
	color:red;
	font-size:0.8em;
	display:none;
}
#pswvalidate {
	color:red;
	font-size:0.8em;
	display:none;
}
#cnfpswvalidate {
	color:red;
	font-size:0.8em;
	display:none;
}
#uservalidate{
    color:red;
	font-size:0.8em;
	display:none;
}

        #heading{
color:#d5636d;
font-style:italic;
display:flex;
justify-content:center;

}

</style>
</head>
<body>



<% 
 String error=(String) request.getAttribute("error");
%>

    <div class="registration-container">
        <div class="registration-header">
            <img src="parcelLogo.jpg" alt="Parcel Management Logo" class="logo">
            <h1>Parcel Management - Registration</h1>
        </div>
        <form id="registrationForm" action="loginservlet" method="post">
            <div class="section">
            <br>
                <% if(error!=null) { %>
                <h3 id="heading"> <%= error %> </h3>
               <% } %>
                <h2>Personal Information</h2>
                
                <div class="form-group">
                    <label for="customerName">Customer Name:</label>
                    <input type="text" id="customerName" name="customerName" maxlength="50" required>
                </div>
                <div id="uservalidate"> <p > Please enter a valid user name. </p>
                </div>
                <div class="form-group">
                    <label for="email">Email:</label>
                    <input type="email" id="email" name="email" required>
                </div>
                <div id="emailvalidate"> <p > Please enter a valid email address. </p>
                </div>
                <div class="form-group">
                    <label for="mobileNumber">Mobile Number:</label>
                    <div class="mobile-input">
                        <select id="countryCode" name="countryCode">
                            <option value="+91">+91 (India)</option>
                        </select>
                        <input type="tel" id="mobileNumber" name="mobileNumber" required>
                    </div>
                </div>
                <div id="mobilevalidate"> <p> Please enter a valid phone number. </p>
                </div>
                <div class="form-group">
                    <label for="address">Address:</label>
                    <textarea id="address" name="address" rows="4" required></textarea>
                </div>
            </div>
            <div class="section">

                <div class="form-group">
                    <label for="password">Password:</label>
                    <input type="password" id="password" name="password" maxlength="30"  required>
                </div>
                <div id="pswvalidate"> <p> Password must contain at least one uppercase, one lowercase, one number and one special character. </p>
                </div>
                <div class="form-group">
                    <label for="confirmPassword">Confirm Password:</label>
                    <input type="password" id="confirmPassword" name="confirmPassword" maxlength="30" required>
                </div>
                <div id="cnfpswvalidate"> <p> Passwords do not match. </p>
                </div>
            </div>
            <div class="section">
                <h2>Preferences</h2>
             
                <div class="form-group">
                    <label for="notifications">Notifications:</label>
                    <input type="checkbox" id="notifications" name="notifications" value="true" checked>
                    <span>Receive email notifications</span> <br/><br/>
                    <input type="checkbox" id="notifications" name="notifications" value="true" checked>
                    <span>Receive SMS notifications</span>
                </div>
            </div>
            <div class="form-actions">
                <button type="submit" name="action" id="Registrationform" value="Registration" disabled>Register</button>
                <button type="reset">Reset</button>
            </div>
            <br>
            
             <div >
                <p style="text-align:center">
                   Already have an account?<span><a href="login.jsp">Login In</a></span>
                </p>
                
            </div>
           
        </form>
    </div>
				
<script>
document.addEventListener('DOMContentLoaded', function() {
    const emailInput = document.getElementById('email');
    const emailValidateDiv = document.getElementById('emailvalidate');
    const mobileInput = document.getElementById('mobileNumber');
    const mobileValidateDiv = document.getElementById('mobilevalidate');
    const passwordInput = document.getElementById('password');
    const passwordValidateDiv = document.getElementById('pswvalidate');
    const confirmPasswordInput = document.getElementById('confirmPassword');
    const confirmPasswordValidateDiv = document.getElementById('cnfpswvalidate');
    const customerNameInput = document.getElementById("customerName");
    const customerValidateDiv = document.getElementById("uservalidate");

/*
    emailInput.addEventListener('focus', function() {
        emailValidateDiv.style.display = 'block';
    });

    emailInput.addEventListener('blur', function() {
        emailValidateDiv.style.display = 'none';
    });

    mobileInput.addEventListener('focus', function() {
        mobileValidateDiv.style.display = 'block';
    });

    mobileInput.addEventListener('blur', function() {
        mobileValidateDiv.style.display = 'none';
    });

    passwordInput.addEventListener('focus', function() {
        passwordValidateDiv.style.display = 'block';
    });

    passwordInput.addEventListener('blur', function() {
        passwordValidateDiv.style.display = 'none';
    });

    confirmPasswordInput.addEventListener('focus', function() {
        confirmPasswordValidateDiv.style.display = 'block';
    });

customerNameInput.addEventListener('blur', function() {
        passwordValidateDiv.style.display = 'none';
    });
*/
    let allEmailValid = false;
    let allMobileValid = false;
    let allPasswordValid = false;
    let allConfirmPasswordValid = false;
    let allUserValid = false;

    customerNameInput.addEventListener('input', function() {
        const user1 = customerNameInput.value;
        const user = user1.trim();
        if(user.length>2 && user.toLowerCase() !=="null" && user.toLowerCase() !=="nan" && user.toLowerCase() !=="null"){
            document.getElementById("uservalidate").style.display="none";
            allUserValid=true;
        }
        else{
            document.getElementById("uservalidate").style.display="block";
            customerValidateDiv.querySelector('p').textContent="Please enter a valid user name.";
            allUserValid=false;
        }
    });
    emailInput.addEventListener('input', function() {
        const email = emailInput.value;
        const pattern = /^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/;
        if (!pattern.test(email)) {
            emailValidateDiv.style.display = 'block';
             emailValidateDiv.querySelector('p').textContent = 'Please enter a valid email address.';
             allEmailValid=false;
        } else {
			emailValidateDiv.style.display = 'none';
            allEmailValid=true;
		}
       
    });


    mobileInput.addEventListener('input', function() {
        const mobile = mobileInput.value;
        const mobilePattern = /^[6-9]\d{9}$/;

        if (!mobilePattern.test(mobile)) {
            mobileValidateDiv.style.display = 'block';
            mobileValidateDiv.querySelector('p').textContent = 'Please enter a valid phone number.';
            allMobileValid=false;
        } 
        else if (/(.)\1{5,}/.test(mobile)) {
                    mobileValidateDiv.style.display = 'block';
                    mobileValidateDiv.querySelector('p').textContent = 'Phone number cannot have 5 or more consecutive identical digits.';
                    allMobileValid=false;
                    // More than 6 consecutive identical digits
                }
        else {
            mobileValidateDiv.style.display = 'none';
            allMobileValid=true;
        }
    });

    passwordInput.addEventListener('input', function() {
        const password = passwordInput.value;
        const passwordPattern = /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$/;

        if (!passwordPattern.test(password)) {
            passwordValidateDiv.style.display = 'block';
            passwordValidateDiv.querySelector('p').textContent = 'Password must contain at least one uppercase, one lowercase, one number, one special character, and be at least 8 characters long.';
            allPasswordValid=false;
        } else {
            passwordValidateDiv.style.display = 'none';
            allPasswordValid=true;
        }
    });

    confirmPasswordInput.addEventListener('input', function() {
        const password = passwordInput.value;
        const confirmPassword = confirmPasswordInput.value;

        if (password !== confirmPassword) {
            confirmPasswordValidateDiv.style.display = 'block';
            confirmPasswordValidateDiv.querySelector('p').textContent = 'Passwords do not match.';
            allConfirmPasswordValid=false;
        } else {
            confirmPasswordValidateDiv.style.display = 'none';
            allConfirmPasswordValid=true;
        }
    });
    const registrationButton = document.getElementById('Registrationform');
   /* const allInputFields = document.querySelectorAll('input[type="text"], input[type="email"], input[type="tel"], input[type="password"], textarea');
*/
    function enableRegisterButton() {
   
        registrationButton.disabled = false;
    }
    confirmPasswordInput.addEventListener('blur', function() {
        confirmPasswordValidateDiv.style.display = 'none';
        if(allEmailValid && allMobileValid && allPasswordValid && allConfirmPasswordValid && allUserValid)
        enableRegisterButton();
    });
    

});




</script>

</body>
</html>