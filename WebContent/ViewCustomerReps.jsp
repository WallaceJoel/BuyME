<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"
    import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Customer Representatives</title>
</head>
<body>
	<h1>List of all Customer Representatives</h1>
	
	<form action="addCustomerRep.jsp" method="POST">
       <input type="submit" value="Add Customer Reps"/>
     </form>
	<table border="1">
		<tr>
		<td><b>Username</b></td>
		<td><b>First Name</b></td>
		<td><b>Last Name</b></td>
		<td><b>Email</b></td>
	</tr>
	<%
	Class.forName("com.mysql.jdbc.Driver");
	String url = "jdbc:mysql://cs336db.ceclq3s0q7y5.us-east-2.rds.amazonaws.com:3306/BuyMe";
	String username = "cs336admin";
	String password = "cs336password";
	String query = "select username,firstName,lastName,email,repID from CustomerReps";
	Connection con = DriverManager.getConnection(url,username,password);
	PreparedStatement stmt = con.prepareStatement(query);
	ResultSet resultSet = stmt.executeQuery();
	while(resultSet.next()){
	%>
	<tr>
		<td><%=resultSet.getString("username") %></td>
		<td><%=resultSet.getString("firstName") %></td>
		<td><%=resultSet.getString("lastName") %></td>
		<td><%=resultSet.getString("email") %></td>
		<td><a href="deleteCR.jsp?id=<%=resultSet.getString("repID")%>">Delete </a> </td>
	</tr>

	<% 
	}
	con.close();
	%>
	</table>
	<form action="adminHome.jsp" method="POST">
       <input type="submit" value="Return to Admin Homepage"/>
     </form>
</body>
</html>