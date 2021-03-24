<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title> FAQ </title>
</head>
<body>	
	<div class="content">
	
        <h1>Have A Question?</h1>
        
        <form> Submit your question here. A customer rep will get back to you shortly.<br> <input type = "text" > </form>
		<form action="questionsDatabase.jsp" method="post">
		<input type="submit" value="Submit">					
		</form>	
		
			  <form action="mainPage.jsp" method="POST">
		       <input type="submit" value="Return Home"/>
		</form>
			
		
		<%	if (request.getParameter("submit") != null && request.getParameter("submit").toString().equals("success")) { %>
			<h1>Submitted successfully!</h1>
	<%	} %>
	<% 
		String url = "jdbc:mysql://cs336db.ceclq3s0q7y5.us-east-2.rds.amazonaws.com:3306/BuyMe";
	
		Connection con = null;
		PreparedStatement st = null;
		ResultSet rs = null;
		
		try {   		
   
			Class.forName("com.mysql.jdbc.Driver").newInstance(); //load jdbc driver
			con = DriverManager.getConnection(url, "cs336admin", "cs336password"); //connect to database 

			String query = "SELECT * FROM AnsweredQuestions";
			String check = "Awaiting response";
			
			st = con.prepareStatement(query);
			rs = st.executeQuery();
			
			if(rs.next()){ %> 
				<h1> Results </h1>
				<table> 
					<tr>
						<th>Question</th>
						<th>Answer</th>
					</tr>				
					<% while(rs.next()){ %> 
						<tr>
							<td><%= rs.getString("question") %> </td>
							<% if (check.equals(rs.getString("answer"))){ %>
								<form action="answerDatabase.jsp?questionId=<%=rs.getInt("questionId") %>" method="POST">
									<td>
										<textarea type="textarea" name="Answer"></textarea>
										<input type="submit" value="Answer">
									</td>
								</form>
							<% } else { %>
							<td><%= rs.getString("answer") %> </td>
							<% } %>
						</tr>
			<% 		}  %>
				</table>
			<% 	} else { %>
					<br><h2>Nothing here.</h2>	
			<%	}  %>
			
		<%
		
		  
		} catch (SQLException e){
			System.out.println(e);
		
		} finally {
			try { rs.close(); } catch (Exception e) {} 
			try { con.close(); } catch (Exception e) {} 
		}   		
	%>
		
		
		
	</div>
</body>
</html>
