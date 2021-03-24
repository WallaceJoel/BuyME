<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"
    import="java.sql.*"%>
    <%String ses_name = (String)session.getAttribute("SES_NAME"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>User Info</title>
</head>
			<%
				if(ses_name == null){
					System.out.println("Customer Rep User");
				}

				Class.forName("com.mysql.jdbc.Driver");
				String url = "jdbc:mysql://cs336db.ceclq3s0q7y5.us-east-2.rds.amazonaws.com:3306/BuyMe";
				String username = "cs336admin";
				String password = "cs336password";
				String query = "select * from Users where username = '"+ses_name+"';";
				Connection con = DriverManager.getConnection(url,username,password);
				PreparedStatement stmt = con.prepareStatement(query);
				ResultSet resultSet = stmt.executeQuery();
				
			%>
<body>
<form action="UserEditingTheUser.jsp">
	<table>
		<%
		while(resultSet.next()){
			session.setAttribute("USER_ID",resultSet.getString("userID"));
		%>
		<tr><td>Username: <%=resultSet.getString("username") %></td><td><input type="text" name="username"> </td></tr>
		<tr><td>Password: <%=resultSet.getString("password") %></td><td><input type="text" name="password"> </td></tr>
		<tr><td>First Name: <%=resultSet.getString("firstName") %></td><td><input type="text" name="firstName"> </td></tr>
		<tr><td>Last Name: <%=resultSet.getString("lastName") %></td><td><input type="text" name="lastName"> </td></tr>
		<tr><td>Email: <%=resultSet.getString("email") %></td><td><input type="text" name="email"> </td></tr>
		<tr><td>Phone Number: <%=resultSet.getString("phoneNum") %></td><td><input type="text" name="phoneNum"> </td></tr>
		<tr><td>Address: <%=resultSet.getString("address") %></td><td><input type="text" name="address"> </td></tr>
		<tr><td>City: <%=resultSet.getString("city") %></td><td><input type="text" name="city"> </td></tr>
		<tr><td>State: <%=resultSet.getString("state") %></td><td><input type="text" name="state"> </td></tr>
		<tr><td>Country: <%=resultSet.getString("country") %></td><td><input type="text" name="country"> </td></tr>
		<tr><td>Bank Information: <%=resultSet.getString("bank_info") %></td><td><input type="text" name="bank_info"> </td></tr>
		<%
		}
		con.close();
		%>
	</table>
	<input type="submit" value="Edit Details">
	</form>	
	<form action="UserSelfDelete.jsp" method="POST">
       <input type="submit" value="Delete Account"/>
     </form>
	<form action="mainPage.jsp" method="POST">
       <input type="submit" value="Back"/>
     </form>
</body>
</html>