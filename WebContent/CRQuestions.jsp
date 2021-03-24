<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"
    import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Questions That Need to be Answered</title>
</head>
<body>
	
	<h1>Questions that need to be answer!</h1>
	<table>
		<tr>
		<td><b>Username</b></td>
		<td><b>Topic</b></td>
	</tr>
	<%
	String admin = request.getParameter("admin");
	System.out.println(admin);
	Class.forName("com.mysql.jdbc.Driver");
	String url = "jdbc:mysql://cs336db.ceclq3s0q7y5.us-east-2.rds.amazonaws.com:3306/BuyMe";
	String username = "cs336admin";
	String password = "cs336password";
	Connection con = DriverManager.getConnection(url,username,password);
	String query = "select questionID,user,topic from Questions";
	PreparedStatement stmt = con.prepareStatement(query);
	ResultSet resultSet = stmt.executeQuery();
	while(resultSet.next()){
	%>
	<tr>
		<td><%=resultSet.getString("user") %></td>
		<td><%=resultSet.getString("topic") %></td>
		<td><a href="CRAnswer.jsp?id=<%=resultSet.getString("questionID")%>">Answer Question </a> </td>
	</tr>

	<% 
	}
	con.close();
	%>
	</table>
	<%if(admin==null){ %>
	<form action="customerRepHome.jsp" method="POST">
       <input type="submit" value="Return to Customer Representative Homepage"/>
     </form>
     <%} else{%>
     <form action="adminHome.jsp" method="POST">
       <input type="submit" value="Return to Admin Homepage"/>
     </form>
     <%}%>
</body>
</html>