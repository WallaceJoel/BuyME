<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title> FAQ </title>
</head>
<body>	
	<div class="content">
	
	<% 
		
		String url = "jdbc:mysql://cs336db.ceclq3s0q7y5.us-east-2.rds.amazonaws.com:3306/BuyMe";
		Connection conn = null;
		PreparedStatement st = null;
		ResultSet rs = null;
		
		try {   		
			Class.forName("com.mysql.jdbc.Driver").newInstance();
			conn = DriverManager.getConnection(url, "cs336admin", "cs336password");
			String username = (session.getAttribute("SES_NAME")).toString();
			String Query = "SELECT question, answer FROM Questions WHERE user=?";
			
			st = conn.prepareStatement(Query);
			rs = ps.executeQuery();
			st.setString(1, username);
			
			if(rs.next()){ %> 
				<h1> Question Results: </h1>
				<table> 
					<tr>
						<th> Question </th>
						<th> Answer </th>
					</tr>				
					<% do { %>
						<tr>
							<td><%= rs.getString("question") %> </td>
							<td><%= rs.getString("answer") %> </td>
						</tr>						
			<% 		} while(rs.next()); %>
				</table>
			<% 	} else { %>
					<br><h3> There are currently no answers. </h3>	
			<%	}  %>	
			
		<%
		
		} catch (SQLException e){
			out.print("<p>Error connecting to server.</p>");
    			
		} finally {
			try { rs.close(); } catch (Exception e) {} 
			try { conn.close(); } catch (Exception e) {} 
		}   		
	%>
	</div> 
</body>
</html>
