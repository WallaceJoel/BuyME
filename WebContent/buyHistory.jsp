<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.io.*,java.util.*,java.sql.*,java.text.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <title>Buy History</title>
</head>
<body>
   	<% 
	  String url = "jdbc:mysql://cs336db.ceclq3s0q7y5.us-east-2.rds.amazonaws.com:3306/BuyMe";
	  Connection conn = null;
	  PreparedStatement ps = null;
	  ResultSet rs1 = null;
	  ResultSet rs2 = null;
	  ResultSet rs3 = null;		
   	try {   		
		Class.forName("com.mysql.jdbc.Driver").newInstance();
		conn = DriverManager.getConnection(url, "cs336admin", "cs336password");
		String user = (session.getAttribute("User")).toString(); 				
		String buy = "SELECT * FROM buyHistory WHERE buyer=?"; 
		ps = conn.prepareStatement(buy);
		ps.setString(1, user);
		rs1 = ps.executeQuery();

		if (rs1.next()) { %>
   			<p>Buy History</p>
   			<table>
   			<tr>
   			<th>Item Name</th>
   			</tr>
   		<% do { 
			int ItemID = rs1.getInt("ItemID");
			String itemName = null;
			String item = "SELECT * FROM Items WHERE ItemID=?";
			ps = conn.prepareStatement(item);
			ps.setInt(1, ItemID);
			rs2 = ps.executeQuery();
			ps.close();

			String seller = "SELECT * FROM Users WHERE ItemID=?";
			ps = conn.prepareStatement(seller);
			ps.setInt(1, ItemID);
			rs3 = ps.executeQuery();
			rs3.next();
   		%>
   			<tr>
   			<td><%= Title %></td>
   			</tr>
   		<%	} while (rs1.next()); %>
   			</table>		
   		<%	} else { %>
   			<p>No items.</p>
   			<%} 		
   			} finally {
			try{rs1.close(); }catch(Exception e){}
			try{rs2.close(); }catch(Exception e){}
			try{rs3.close(); }catch(Exception e){}
			try{ps.close(); }catch(Exception e){}   				
			try{conn.close(); }catch(Exception e){}
   			} %>   		
	<% } %>
</body>
</html>		
