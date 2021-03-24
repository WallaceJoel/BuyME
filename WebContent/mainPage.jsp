<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Welcome to BuyMe</title>
</head>
<body>
	<%String username = (String)session.getAttribute("SES_NAME"); %>
	Welcome <%out.print(username); %>
	<%
	if(username == null){
		response.sendRedirect("index.jsp");
	}
	%>
	
	<form action="sortingItems.jsp" method="POST">
       <input type="submit" value="Search for an Item!"/>
     </form>
	
	<form action="AuctionMake.jsp" method="POST">
       <input type="submit" value="Start an Auction!"/>
     </form>
	<form action="questions.jsp" method="POST">
       <input type="submit" value="Have a Question?"/>
     </form>
     <form action="UserProfilePage.jsp" method="POST">
     	<input type="submit" value="View/Edit your profile"/>
     </form>
	<form action="index.jsp" method="POST">
       <input type="submit" value="Logout"/>
     </form>
</body>
</html>
