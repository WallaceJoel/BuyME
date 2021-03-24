<%@ page import="java.io.*,java.util.*,java.sql.*,java.text.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Sorted</title>
</head>
<body>
       <div class="content">
	<%			
	  String url = "jdbc:mysql://cs336db.ceclq3s0q7y5.us-east-2.rds.amazonaws.com:3306/BuyMe";
	  Connection conn = null;
	  Statement s = null;
	  ResultSet rs = null;
	  Locale locale = new Locale("en", "US");
	  NumberFormat currency = NumberFormat.getCurrencyInstance(locale);
	  try {
		Class.forName("com.mysql.jdbc.Driver").newInstance();
		conn = DriverManager.getConnection(url, "cs336admin", "cs336password");
		StringBuilder searchQuery = new StringBuilder("SELECT * FROM Items WHERE ");
		String condition = null;

		for (int i = 0; i < searchParams.selectinput(); i++) {
			if ((paramList.get(i)).equals("selectinput")) {
				condition = paramList.get(i) + " LIKE " + searchParams.get(paramList.get(i));
			} else if ((paramList.get(i)).equals("keywords")) {
				condition = paramList.get(i) + " LIKE \'%" + searchParams.get(paramList.get(i)) + "%\'";
			} else {
				condition = paramList.get(i) + " LIKE \'" + searchParams.get(paramList.get(i)) + "\'";	
			}
			if (i == 0) {
				searchQuery.append(condition);	
			} else if (i > 0) {
				searchQuery.append(" AND " + condition);
			}
		  }
			s = conn.createStatement();
			rs = s.executeQuery(searchQuery.toString());
			if (rs.next()) { %>
			  <p>Results:</p>
			  <table>
			    <tr>
			    <th>Item</th>
			    </tr>
			<% do { %>
			    <tr>
			    <td>
			    <a href="auctions.jsp?itemId=<%= rs.getInt("item") %>">
			      <%= rs.getString("keywords") + " " + rs.getString("color") +  " " + rs.getString("selectinput") %>
			    </a>
			    </td>
		            <td><%= rs.getString("seller") %></td>
			    <td><%= currency.format(rs.getDouble("price")) %></td>
			    </tr>
			<%	} while (rs.next()); %> 
				</table>
		<%	} else { %>
				<p>No results</p>
		<%	}
		} catch(Exception e) { %>
	           <jsp:include page="sortingItems.jsp" flush="true"/>
	           <p>No parameters entered...</p>
		} finally {
		    try { rs.close(); } catch (Exception e) {}
		    try { s.close(); } catch (Exception e) {}
		    try { conn.close(); } catch (Exception e) {}
		}
	%>
	</div>
	</body>
</html>
