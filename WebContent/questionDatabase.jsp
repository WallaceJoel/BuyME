<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
		
	<% 
		
		Connection conn = null;
		PreparedStatement ps = null;
			
		try {
			String url = "jdbc:mysql://cs336db.ceclq3s0q7y5.us-east-2.rds.amazonaws.com:3306/BuyMe"; //create connection string
			Class.forName("com.mysql.jdbc.Driver").newInstance(); //load the jdbc driver
			conn = DriverManager.getConnection(url, "cs336admin", "cs336password"); //create connection to database
			
			String username = (session.getAttribute("SES_NAME")).toString();  //get username
			String question = request.getParameter("Question"); //get question
			if(username != null && question != null && !question.isEmpty()){ //check for codebreaking stuff
				
				String insert = "INSERT INTO Questions (user, message, response)" + "VALUES (?, ?, ?)"; //insert into questions schema
				
				ps = conn.prepareStatement(insert); 
				
				ps.setString(1, username); //set username
				ps.setString(2, question); //set message
				ps.setString(3, "Please wait for a response. Thank you for your question."); //default, since it is not answered yet
				
				int result = 0;
		        result = ps.executeUpdate();
		        if (result < 1) {
		        	out.println("error");
		        } else {
		        	response.sendRedirect("questions.jsp?submit=success");
		        	return;
		        }
			} else {
				response.sendRedirect("questionErrorPage.jsp");
				return;
			}    
		} catch(Exception error) {
	        out.print("<p>Error connecting to server</p>" + error);
	    } finally {
	        try { ps.close(); 
	        } 
	        catch (Exception error) {}
	        try { conn.close(); 
	        } 
	        catch (Exception error) {}
	    }
		        
		        
	%>
