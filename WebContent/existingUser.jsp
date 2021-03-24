<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<% String type ="user";
session.setAttribute("type",type); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Login</title>
</head>
<body>
	<h1>User Login</h1>
	<form action="checkLogin.jsp" method="POST">
       Username: <input type="text" name="username" required/> <br/>
       Password:<input type="password" name="password" required/> <br/>
       <input type="submit" value="Submit"/>
     </form>
     <form action="index.jsp" method="POST">
       <input type="submit" value="Back"/>
     </form>
</body>
</html>