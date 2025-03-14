<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" session="true" %>
<%@ page import="com.model.*" %>
<!DOCTYPE html>
<html lang="en">


<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Parcel Management - Delivery Update</title>
    
    <!-- Corrected CSS Path -->
    <link rel="stylesheet" href="./CSS/tracking.css">
    <style>
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
		HttpSession sess = request.getSession();

		User obj = (User) sess.getAttribute("user"); 
		String role;
		
		
		
		if(obj==null ||obj.getRole().equalsIgnoreCase("customer"))
		{
			sess.invalidate();
			response.sendRedirect("login.jsp");
			
			return;
		}

%>
   
    <jsp:include page="header.jsp"></jsp:include>
     <% 
 String error=(String) request.getAttribute("error");
 if(error!=null) { %>
  <h2 id="heading">Booking ID not found</h2>
 <% } %>
 

    <main>
        <section class="tracking-page">
        <form action="updateservlet" method="get">
        <h2>Update Pickup and Drop Time</h2>
            <div class="tracking-form">
                <div class="form-group">
                    <label for="bookingId">Booking ID:</label>
                    <input type="text" id="bookingId" name="bookingId" maxlength="12" required>
                    <span class="error-message" id="bookingIdError"></span>
                </div>
                <div class="form-group">
                    <button id="searchButton" class="button" name="action" value="timeupdate">Search</button>
                </div>
            </div>
           
        </form>
            
        </section>
    </main>

    <jsp:include page="footer.jsp"></jsp:include>
    <!-- Corrected JavaScript Path -->
    <script src="./JavaScript Files/tracking.js"></script>

</body>

</html>
 
