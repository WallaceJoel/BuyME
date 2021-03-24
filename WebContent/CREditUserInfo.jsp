<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"
    import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>List of All Users</title>
</head>
<body>
	<h1>All current users</h1>
	<table>
		<tr>
			<td><b>Username</b></td>
		</tr>
			<%
			/*
			String ses_name = (String)session.getAttribute("SES_NAME");
				if(ses_name == null){
					response.sendRedirect("index.jsp");
				}
			*/
				Class.forName("com.mysql.jdbc.Driver");
				String url = "jdbc:mysql://cs336db.ceclq3s0q7y5.us-east-2.rds.amazonaws.com:3306/BuyMe";
				String username = "cs336admin";
				String password = "cs336password";
				String query = "select userID,username from Users";
				Connection con = DriverManager.getConnection(url,username,password);
				PreparedStatement stmt = con.prepareStatement(query);
				ResultSet resultSet = stmt.executeQuery();
				while(resultSet.next()){
			%>
			<tr>
				<td><%=resultSet.getString("username") %></td>
				<td><a href="EditInfo.jsp?id=<%=resultSet.getString("userID")%>">Edit </a> </td>
				<td><a href="DeletingUser.jsp?id=<%=resultSet.getString("userID")%>">Delete </a> </td>
			</tr>
			<%
				}
				con.close();
			%>
	</table>
		<form action="customerRepHome.jsp" method="POST">
       <input type="submit" value="Return to Customer Representative Homepage"/>
     </form>
</body>
</html>