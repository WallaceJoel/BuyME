<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"
    import = "java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Customer Representative Deletion</title>
</head>
<body>
	<%
	String id = request.getParameter("id");
	//System.out.println(id);
	Class.forName("com.mysql.jdbc.Driver");
	Connection con = DriverManager.getConnection(
			"jdbc:mysql://cs336db.ceclq3s0q7y5.us-east-2.rds.amazonaws.com:3306/BuyMe", "cs336admin",
			"cs336password");
	Statement st = con.createStatement();
	ResultSet rs;
	String query = "delete from CustomerReps where repID = "+id+";";
	st.executeUpdate(query);
	response.sendRedirect("ViewCustomerReps.jsp");
	con.close();
	%>
</body>
</html>