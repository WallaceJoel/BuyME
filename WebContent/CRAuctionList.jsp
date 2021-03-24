<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"
    import="java.sql.*"%>
  <%
	Class.forName("com.mysql.jdbc.Driver");
	String url = "jdbc:mysql://cs336db.ceclq3s0q7y5.us-east-2.rds.amazonaws.com:3306/BuyMe";
	String username = "cs336admin";
	String password = "cs336password";
	Connection con = DriverManager.getConnection(url,username,password);
	String query = "select * from Auction";
	PreparedStatement stmt = con.prepareStatement(query);
	ResultSet rs = stmt.executeQuery();
  %> 
   
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>List of Ongoing Auctions</title>
</head>
<body>
	<h1>List of Auctions</h1>
	<table border="1">
		<tr>
			<td><b>Action ID</b></td>
			<td><b>Auction Item</b></td>
			<td><b>Seller</b></td>
			<td><b>Opening Date</b></td>
			<td><b>Closing Date</b></td>
		</tr>
		<%while(rs.next()){
			String query2 = "select title from Items where ItemId = "+rs.getString("Item_ID")+";";
			PreparedStatement stmt2 = con.prepareStatement(query2);
			ResultSet result = stmt2.executeQuery();
			String itemTitle ="";
			while(result.next()){itemTitle = result.getString("title");}
			String query3 = "select username from Users where userID ="+rs.getString("Seller_ID")+";";
			PreparedStatement stmt3 = con.prepareStatement(query3);
			ResultSet result2 = stmt3.executeQuery();
			String sellerUsername="";
			while(result2.next()){sellerUsername = result2.getString("username");}
			%>
			
		<tr>
			<td><%=rs.getString("Auction_ID")%></td>
			<td><%out.println(itemTitle);%></td>
			<td><%out.println(sellerUsername);%></td>
			<td><%=rs.getString("OpeningDate")%></td>
			<td><%=rs.getString("ClosingDate")%></td>
			<td><a href="CRViewAuctionDetails.jsp?id=<%=rs.getString("Auction_ID")%>">View</a></td>
			<td><a href="DeleteAuction.jsp?id=<%=rs.getString("Auction_ID")%>">Delete</a></td>
		</tr>
		<%} con.close();%>
	</table>
	<form action="customerRepHome.jsp" method="POST">
       <input type="submit" value="Back"/>
     </form>
</body>
</html>