<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Welcome Customer Representatives!</title>
</head>
<body>
	Customer Representatives Main Page
	<form action="CRQuestions.jsp" method="POST">
       <input type="submit" value="Questions"/>
     </form>
     <form action="CREditUserInfo.jsp" method="POST">
       <input type="submit" value="Edit Users"/>
     </form>
     <form action="CRAuctionList.jsp" method="POST">
     	<input type="submit" value="Auctions">
     </form>
	<form action="index.jsp" method="POST">
       <input type="submit" value="Logout"/>
     </form>
</body>
</html>