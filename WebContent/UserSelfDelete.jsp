<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Are you sure you want to delete this Account?</title>
</head>
<body>
	<h1>Are you sure you want to delete this account?</h1>
	<form action="DeletingUser.jsp" method="POST">
       <input type="submit" value="Yes"/>
     </form>
     <form action="UserProfilePage.jsp" method="POST">
       <input type="submit" value="No"/>
     </form>
</body>
</html>