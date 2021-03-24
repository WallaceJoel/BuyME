<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Create Customer Rep Account</title>
</head>
<body>
	Please enter in all information!
	<form action="addCRtoDB.jsp" method="POST">
       Username: <input type="text" name="username" required> <br/>
       Password: <input type="password" name="password" required> <br/>
       First Name: <input type="text" name="firstName" required> <br/>
       Last Name: <input type="text" name="lastName" required> <br/>
       Email: <input type="text" name="email" required> <br/>
       <input type="submit" value="Submit"/>
     </form>
     <form action="ViewCustomerReps.jsp" method="POST">
       <input type="submit" value="Back"/>
     </form>
</body>
</html>