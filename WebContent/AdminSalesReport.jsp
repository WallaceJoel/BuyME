<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"
    import = "java.sql.*"%>
    <%
    	String column = request.getParameter("column");
    	System.out.println(column);
	    Class.forName("com.mysql.jdbc.Driver");
		String url = "jdbc:mysql://cs336db.ceclq3s0q7y5.us-east-2.rds.amazonaws.com:3306/BuyMe";
		String username = "cs336admin";
		String password = "cs336password";
		Connection con = DriverManager.getConnection(url,username,password);
		String query = "";
		if(column == null){
			query = "select * from Transactions";
		}
		else if(column.equals("1")){
			query = "select * from Transactions order by TransactionID asc";
		}
		else if(column.equals("2")){
			query = "select * from Transactions order by TransactionID desc";
		}
		else if(column.equals("3")){
			query = "select * from Transactions order by ItemTitle asc";
		}
		else if(column.equals("4")){
			query = "select * from Transactions order by ItemTitle desc";
		}
		else if(column.equals("5")){
			query = "select * from Transactions order by ItemID asc";
		}
		else if(column.equals("6")){
			query = "select * from Transactions order by ItemID desc";
		}
		else if(column.equals("7")){
			query = "select * from Transactions order by Category asc";
		}
		else if(column.equals("8")){
			query = "select * from Transactions order by Category desc";
		}
		else if(column.equals("9")){
			query = "select * from Transactions order by SellerUsername asc";
		}
		else if(column.equals("10")){
			query = "select * from Transactions order by SellerUsername desc";
		}
		else if(column.equals("11")){
			query = "select * from Transactions order by BuyerUsername asc";
		}
		else if(column.equals("12")){
			query = "select * from Transactions order by BuyerUsername desc";
		}
		else if(column.equals("13")){
			query = "select * from Transactions order by Amount asc";
		}
		else if(column.equals("14")){
			query = "select * from Transactions order by Amount desc";
		}
		else if(column.equals("15")){
			query = "select * from Transactions order by Date asc";
		}
		else if(column.equals("16")){
			query = "select * from Transactions order by Date desc";
		}
		PreparedStatement stmt = con.prepareStatement(query);
		ResultSet resultSet = stmt.executeQuery();
		String query2 = "select SellerUsername,Count(*) from Transactions group by sellerUsername order by Count(*) DESC limit 1";
		PreparedStatement stmt2 = con.prepareStatement(query2);
		ResultSet resultSet2 = stmt2.executeQuery();
		String seller = "";
		String numSold = "";
		while(resultSet2.next()){
			seller = resultSet2.getString("SellerUsername");
			numSold = resultSet2.getString("Count(*)");
		}
		String query3 = "select Category,Count(*) from Transactions group by Category order by Count(*) DESC limit 1";
		PreparedStatement stmt3 = con.prepareStatement(query3);
		ResultSet resultSet3 = stmt3.executeQuery();
		String PopCategory = "";
		String numOfItemsInCategory="";
		while(resultSet3.next()){
			PopCategory = resultSet3.getString("Category");
			numOfItemsInCategory = resultSet3.getString("Count(*)");
		}
		String query4 = "select BuyerUsername,Count(*) from Transactions group by BuyerUsername order by Count(*) desc limit 1;";
		PreparedStatement stmt4 = con.prepareStatement(query4);
		ResultSet resultSet4 = stmt4.executeQuery();
		String FrequentBuyer = "";
		String ItemsBought="";
		while(resultSet4.next()){
			FrequentBuyer = resultSet4.getString("BuyerUsername");
			ItemsBought = resultSet4.getString("Count(*)");
		}
		String sellerquery = "select distinct SellerUsername from Transactions";
		PreparedStatement stmtSell = con.prepareStatement(sellerquery);
		ResultSet resultSetSeller = stmtSell.executeQuery();
		String buyerquery = "select distinct BuyerUsername from Transactions";
		PreparedStatement stmtBuy = con.prepareStatement(buyerquery);
		ResultSet resultSetBuy = stmtBuy.executeQuery();
		String itemquery = "select distinct ItemTitle from Transactions";
		PreparedStatement stmtItem = con.prepareStatement(itemquery);
		ResultSet resultSetItem = stmtItem.executeQuery();
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Sales Report</title>
</head>
<body>
	<h1>List of Transactions</h1>
	<h2>Top Seller : <%out.print(seller); %> (sold <%out.print(numSold); %> items)</h2>
	<h2>Frequent Buyer : <%out.print(FrequentBuyer); %> (bought <%out.print(ItemsBought); %> items)</h2>
	<h2>Most Popular Category : <%out.print(PopCategory); %> (sold <%out.print(numOfItemsInCategory); %> items)</h2>
	View Items sold by specific Items:
	<form action="SortSalesReport.jsp">
	<select name="item">
		<%while(resultSetItem.next()){ %>
			<option value=<%=resultSetItem.getString("ItemTitle") %>><%=resultSetItem.getString("ItemTitle") %></option>
		<%}%>
	</select>
		<input type="submit" value="Sort"/>
	</form>
	View Items sold by specific Buyer:
	<form action="SortSalesReport.jsp">
	<select name="buyer">
		<%while(resultSetBuy.next()){ %>
			<option value=<%=resultSetBuy.getString("BuyerUsername") %>><%=resultSetBuy.getString("BuyerUsername") %></option>
		<%}%>
	</select>
		<input type="submit" value="Sort"/>
	</form>
	View Items sold by specific Seller:
	<form action="SortSalesReport.jsp">
	<select name="seller">
		<%while(resultSetSeller.next()){ %>
			<option value=<%=resultSetSeller.getString("SellerUsername") %>><%=resultSetSeller.getString("SellerUsername") %></option>
		<%}%>
	</select>
		<input type="submit" value="Sort"/>
	</form>
	View specific Category of items:
	<form action="SortSalesReport.jsp">
	<select name="category">
		<option value="tops">shirts</option>
		<option value="jackets">jackets</option>
		<option value="pants">pants</option>
		<option value="shoes">shoes</option>
		<option value="electronics">electronics</option>
		<option value="kitchen supplies">kitchen supplies</option>
		<option value="other">other</option>
	</select>
		<input type="submit" value="Sort"/>
	</form>
	<table border="1">
		<tr>
			<td>Transaction ID<a href="AdminSalesReport.jsp?column=1">up</a> <a href="AdminSalesReport.jsp?column=2">down</a></td>
			<td>Item <a href="AdminSalesReport.jsp?column=3">up</a> <a href="AdminSalesReport.jsp?column=4">down</a></td>
			<td>Item ID <a href="AdminSalesReport.jsp?column=5">up</a> <a href="AdminSalesReport.jsp?column=6">down</a></td>
			<td>Category <a href="AdminSalesReport.jsp?column=7">up</a> <a href="AdminSalesReport.jsp?column=8">down</a></td>
			<td>Seller <a href="AdminSalesReport.jsp?column=9">up</a> <a href="AdminSalesReport.jsp?column=10">down</a></td>
			<td>Buyer <a href="AdminSalesReport.jsp?column=11">up</a> <a href="AdminSalesReport.jsp?column=12">down</a></td>
			<td>Amount <a href="AdminSalesReport.jsp?column=13">up</a> <a href="AdminSalesReport.jsp?column=14">down</a></td>
			<td>Date <a href="AdminSalesReport.jsp?column=15">up</a> <a href="AdminSalesReport.jsp?column=16">down</a></td>
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
	<form action="adminHome.jsp" method="POST">
       <input type="submit" value="Return to Admin Homepage"/>
    </form>
</body>
</html>