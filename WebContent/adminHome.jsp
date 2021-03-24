<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Admin</title>
</head>
<body>
	Admin Home Page
     <form action="ViewCustomerReps.jsp" method="POST">
       <input type="submit" value="View Customer Reps"/>
     </form>
     <form action="AdminSalesReport.jsp" method="POST">
       <input type="submit" value="Create Sales Report"/>
     </form>
     <form action="CRQuestions.jsp" method="POST">
       <input name="admin" type="submit" value="Questions"/>
     </form>
     <form action="index.jsp" method="POST">
       <input type="submit" value="Logout"/>
     </form>
</body>
</html>