<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"
    import="java.sql.*"%>
    <%
    	String Category = request.getParameter("category");
    	String Seller = request.getParameter("seller");
    	String Buyer = request.getParameter("buyer");
    	String Item = request.getParameter("item");
	    Class.forName("com.mysql.jdbc.Driver");
		String url = "jdbc:mysql://cs336db.ceclq3s0q7y5.us-east-2.rds.amazonaws.com:3306/BuyMe";
		String username = "cs336admin";
		String password = "cs336password";
		Connection con = DriverManager.getConnection(url,username,password);
		String query="";
		if(Category!=null){
			query = "select * from Transactions where Category='"+Category+"';";
		}
		else if(Seller!=null){
			query = "select * from Transactions where SellerUsername='"+Seller+"';";
		}
		else if(Buyer!=null){
			query = "select * from Transactions where BuyerUsername='"+Buyer+"';";
		}
		else{
			query = "select * from Transactions where ItemTitle='"+Item+"';";
		}
		PreparedStatement stmt = con.prepareStatement(query);
		ResultSet resultSet = stmt.executeQuery();
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Sorted List of Transaction</title>
</head>
<body>
<table border="1">
		<tr>
			<td>Transaction ID</td>
			<td>Item</td>
			<td>Item ID</td>
			<td>Category</td>
			<td>Seller</td>
			<td>Buyer</td>
			<td>Amount</td>
			<td>Date</td>
		</tr>
		<%while(resultSet.next()){ %>
			<tr>
				<td><%=resultSet.getString("TransactionID") %></td>
				<td><%=resultSet.getString("ItemTitle") %></td>
				<td><%=resultSet.getString("ItemID") %></td>
				<td><%=resultSet.getString("Category") %></td>
				<td><%=resultSet.getString("SellerUsername") %></td>
				<td><%=resultSet.getString("BuyerUsername") %></td>
				<td><%=resultSet.getString("Amount") %></td>
				<td><%=resultSet.getString("Date") %></td>
			</tr>
		<%}con.close(); %>
	</table>
	<form action="AdminSalesReport.jsp" method="POST">
       <input type="submit" value="Back"/>
    </form>
</body>
</html>