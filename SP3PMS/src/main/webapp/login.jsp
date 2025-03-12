<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Parcel Management - Login</title>
    <link rel="stylesheet" href="./CSS/login.css">
    
   <style>
   #heading{
color:#d5636d;
font-style:italic;

}
.main{
display:flex;
flex-direction:column;
align-items:center;
justify-content:center;
}
   </style>
</head>

<body>
<%   String error=(String) request.getAttribute("error"); %>

 <div class="main">
 <% if(error!=null){ %>
    <h2 id="heading">Login Failed</h2>
  <%} %>
 <div class="login-container">
        <div class="login-header">
            <h1>Parcel Management</h1>
        </div>
        <form id="loginForm" action="loginservlet" method="post">
            <div class="form-group">
                <label for="username">User ID:</label>
                <input type="text" id="username" name="username" minlength="5" maxlength="20" required>
                <p id="usernameError" class="error-message"></p>
            </div>
            
            <div class="form-group">
                <label for="password">Password:</label>
                <input type="password" id="password" name="password" maxlength="30" required>
                <p id="passwordError" class="error-message"></p>
            </div>
            <div class="form-group">
                <button type="submit" name="action" value="login">Log In</button>
            </div>
            <div class="form-group">
                <p id="generalError" class="error-message"></p>
            </div>
             
            <div >
                <p style="text-align:center">
                   Don't have an account? <span><a href="registration.jsp">Sign up</a></span>
                </p>
                
            </div>
        </form>
    </div>
 </div>
    
   
</body>

</html>
