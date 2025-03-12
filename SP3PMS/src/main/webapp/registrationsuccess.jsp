<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="com.model.User" %>
<!DOCTYPE html>
<html>
<head>
<style>

#heading{
color:green;
display:flex;
justify-content:center;
align-items:center;
font-style:italic;
}
</style>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
 <link rel="stylesheet" href="./CSS/deliverydata.css">
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



<% 

User user= (User)sess.getAttribute("user");
   // User user=new User("S","d","s");
%>


<div class="container">
        <h2 id="heading">Registration Successful !</h2>

   
<div>
    <div> User Name: <%= user.getName() %></div>
    <br/>
    <div> User ID: <%= user.getUserId() %></div>
        <br/>
    <div> User Email: <%= user.getEmail() %></div>
        <br/>
    <a href="login.jsp"><button>OK</button></a>
</div>
    

       

        
  </div>


</body>
</html>