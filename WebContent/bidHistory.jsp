<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.io.*,java.util.*,java.sql.*,java.text.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <title>Bidding History</title>
</head>
<body>
	<% 
	String url = "jdbc:mysql://cs336db.ceclq3s0q7y5.us-east-2.rds.amazonaws.com:3306/BuyMe";
	Connection conn = null;
	PreparedStatement ps = null;
	ResultSet rs1 = null;
	ResultSet rs2 = null;
	try {   		
		Class.forName("com.mysql.jdbc.Driver").newInstance();
		conn = DriverManager.getConnection(url, "cs336admin", "cs336password");
		String user = (session.getAttribute("User")).toString(); 				
		String bid = "SELECT * FROM bidHistory WHERE buyer=?";
		ps = conn.prepareStatement(bid);
		ps.setString(1, user);
		rs1 = ps.executeQuery();
		if (rs1.next()) { %>
			<p>Bid History</p>
			<table>
			  <tr>
			    <th>Item Name</th>
			    <th>Bid Amount</th>
			  </tr>
		<%do { 
			int ItemID = rs1.getInt("ItemID");
			String itemName = null;
			String ItemID = "SELECT * FROM Item WHERE ItemID=?";
			ps = conn.prepareStatement(ItemID);
			ps.setInt(1, ItemID);
			rs2 = ps.executeQuery();
		%>
			<tr>
			<td><%= Title %></td>
			<td><%= currency.format(rs1.getDouble("bid")) %></td>
			</tr>
		<%	} while (rs1.next()); %>
			</table>		
	<%} else { %>
	<p>No bids placed.</p>
	<%} 		
	<% } %>
</body>
</html>	
