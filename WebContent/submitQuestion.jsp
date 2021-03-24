<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"
    import="java.sql.*"%>
<% Class.forName("com.mysql.jdbc.Driver");
	String url = "jdbc:mysql://cs336db.ceclq3s0q7y5.us-east-2.rds.amazonaws.com:3306/BuyMe";
	String username = "cs336admin";
	String password = "cs336password";
	
	String topic = request.getParameter("topic");
	String question = request.getParameter("question");
	String user = (String)session.getAttribute("SES_NAME");
	
	String query = "insert into Questions values (NULL,'"+topic+"','"+question+"',NULL,'"+user+"');";
	System.out.println(query);
	Connection con = DriverManager.getConnection(url,username,password);
	PreparedStatement stmt = con.prepareStatement(query);
	stmt.executeUpdate();
	response.sendRedirect("Questions.jsp");
	con.close();
%>