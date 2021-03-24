<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>BuyMe</title>
</head>
<body>
	Welcome To BuyMe!
	<form action="newUser.jsp" method="POST">
       <input type="submit" value="New User"/>
     </form>
     <form action="existingUser.jsp" method="POST">
       <input type="submit" value="Existing User"/>
     </form>
     <form action="StaffLogin.jsp" method="POST">
     	<input type="submit" value="Staff Login">
     </form>
</body>
</html>