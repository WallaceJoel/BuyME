<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>BuyMe Error Page</title>
</head>
<body>
    <% if(session.getAttribute("SES_NAME") == null) { 
    		response.sendRedirect("index.jsp");
       } else { %>
    	<div class="content">
    		<p><a href="questions.jsp">Have a question?</a></p>
    		<p> <a href="index.jsp">Main Page</a></p>
    	</div>
    <% } %>
</body>
</html>
