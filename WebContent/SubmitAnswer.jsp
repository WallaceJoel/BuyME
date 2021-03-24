<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"
    import="java.sql.*"%>
<%
   	String qID = request.getParameter("id");
	String topic = request.getParameter("topic");
	String answer = request.getParameter("response");
	String question = request.getParameter("question");
	System.out.println(question);
	if(question == null){
		response.sendRedirect("CRQuestions.jsp");
	}
	Class.forName("com.mysql.jdbc.Driver");
	String url = "jdbc:mysql://cs336db.ceclq3s0q7y5.us-east-2.rds.amazonaws.com:3306/BuyMe";
	String username = "cs336admin";
	String password = "cs336password";
	String query = "insert into AnsweredQuestions values (null,'"+topic+"','"+question+"','"+answer+"');";
	String query2 = "delete from Questions where questionID = "+qID+";";
	System.out.println(query);
	System.out.println(query2);
	Connection con = DriverManager.getConnection(url,username,password);
	PreparedStatement stmt = con.prepareStatement(query);
	PreparedStatement stmt2 = con.prepareStatement(query2);
	stmt.executeUpdate();
	stmt2.executeUpdate();
	response.sendRedirect("CRQuestions.jsp");
%>