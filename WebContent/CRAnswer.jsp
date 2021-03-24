<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"
    import="java.sql.*"%>
    <%
    String qID = request.getParameter("id");
    if(qID == null){
    	response.sendRedirect("CRQuestions.jsp");	
    }
	Class.forName("com.mysql.jdbc.Driver");
	String url = "jdbc:mysql://cs336db.ceclq3s0q7y5.us-east-2.rds.amazonaws.com:3306/BuyMe";
	String username = "cs336admin";
	String password = "cs336password";
	String query = "select questionID,user,topic,question from Questions where questionID = "+qID+";";
	String topic="";
	String question="";
	Connection con = DriverManager.getConnection(url,username,password);
	PreparedStatement stmt = con.prepareStatement(query);
	ResultSet resultSet = stmt.executeQuery();
	while(resultSet.next()){
		topic = resultSet.getString("topic");
		question = resultSet.getString("question");
	}
	%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Question <%out.println(qID);%></title>
</head>	
<body>
	<h1>Topic: <%out.print(topic); %></h1>
	<h2>Question: </h2>
	<h2>&emsp;<%out.print(question); %></h2>
	<h2>Response: </h2>
	<form action="SubmitAnswer.jsp?id=<%out.print(qID);%>&topic=<%out.print(topic);%>&question=<%out.print(question);%>" method="POST">
		<textarea rows="7" cols="100" name="response"></textarea> <br/>
		<input type = "submit" value = "submit" />
	</form>
	<form action="CRQuestions.jsp" method="POST">
		<input type = "submit" value = "Back"/>
	</form>
	
</body>
</html>
<%
	con.close();
	%>