<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"
    import="java.sql.*"%>
<%
	String id = request.getParameter("id");
	if(id == null){
		response.sendRedirect("CRAuctionList.jsp");
	}
	Class.forName("com.mysql.jdbc.Driver");
	String url = "jdbc:mysql://cs336db.ceclq3s0q7y5.us-east-2.rds.amazonaws.com:3306/BuyMe";
	String username = "cs336admin";
	String password = "cs336password";
	Connection con = DriverManager.getConnection(url,username,password);
	String query = "select * from Bids where AuctionID ="+id+";";
	PreparedStatement stmt = con.prepareStatement(query);
	ResultSet rs1 = stmt.executeQuery();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Auction Info</title>
</head>
<body>
	<h1>Auction <%out.print(id);%></h1>
	<h2>Bid History of Auction:</h2>
	<table border="1">
		<tr>
			<td>Bid ID</td>
			<td>Seller Name(ID)</td>
			<td>Bid Value</td>
		</tr>
		<%while(rs1.next()){ %>
		<tr>
			<td><%=rs1.getString("BidID") %></td>
			<% query="select username from Users where userID = "+rs1.getString("BuyerID")+";";
			PreparedStatement stmt2 = con.prepareStatement(query);
			ResultSet rs2 = stmt2.executeQuery();
			String biderName ="";
			while(rs2.next()){ biderName = rs2.getString("username");}%>
			<td><%out.println(biderName);%> (<%=rs1.getString("BuyerID")%>)</td>
			<td><%=rs1.getString("Bid_Value")%></td>
			<td><a href="CRDeleteBid.jsp?BidID=<%=rs1.getString("BidID")%>">Delete</a></td>
		</tr>
		<%} con.close(); %>
	</table>
	<form action="CRAuctionList.jsp" method="POST">
       <input type="submit" value="Back"/>
     </form>
</body>
</html>