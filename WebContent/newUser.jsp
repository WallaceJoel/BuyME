<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Register</title>
</head>
<body>
	Please enter in all information!
	<form action="addUser.jsp" method="POST">
       Username: <input type="text" name="username" required> <br/>
       Password: <input type="password" name="password" required> <br/>
       First Name: <input type="text" name="firstName" required> <br/>
       Last Name: <input type="text" name="lastName" required> <br/>
       Email: <input type="text" name="email" required> <br/>
       Phone Number: <input type="text" name="phoneNum" required> <br/>
       Address: <input type="text" name="address" required> <br/>
       City: <input type="text" name="city" required> <br/>
       State: <input type="text" name="state" required> <br/>
       Country: <input type="text" name="country" required> <br/>
       Bank info <input type="text" name="bankInfo" required> <br/>
       <input type="submit" value="Submit"/>
     </form>
     <form action="index.jsp" method="POST">
       <input type="submit" value="Back"/>
     </form>
</body>
</html>