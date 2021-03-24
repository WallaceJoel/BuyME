<%@ page import="java.sql.*"%>
<%
	String userid = request.getParameter("username");
	String pwd = request.getParameter("password");
	String fn = request.getParameter("firstName");
	String ln = request.getParameter("lastName");
	String email = request.getParameter("email");
	Class.forName("com.mysql.jdbc.Driver");
	Connection con = DriverManager.getConnection(
			"jdbc:mysql://cs336db.ceclq3s0q7y5.us-east-2.rds.amazonaws.com:3306/BuyMe", "cs336admin",
			"cs336password");
	Statement st = con.createStatement();
	ResultSet rs;
	String query = "INSERT INTO CustomerReps VALUES ('" + userid + "','" + pwd + "','" + fn + "','" + ln + "','"+ email+"',NULL)";
	System.out.println(query);
	//add values into the Customer Rep Database
	st.executeUpdate(query);
	response.sendRedirect("crConfirmatoin.jsp");
%>