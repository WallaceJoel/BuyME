<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
		
	<% 
		String url = "jdbc:mysql://cs336db.ceclq3s0q7y5.us-east-2.rds.amazonaws.com:3306/BuyMe";
		Connection conn = null;
		PreparedStatement ps = null;
			
		try {
			Class.forName("com.mysql.jdbc.Driver").newInstance();
			conn = DriverManager.getConnection(url, "cs336admin", "cs336password");
			
			int questionId = Integer.parseInt(request.getParameter("questionID"));
			String answer = request.getParameter("Answer");

			if(answer != null && !answer.isEmpty()){
				
				String insert = "UPDATE Questions SET answer=? WHERE questionID=?";
				
				ps = conn.prepareStatement(insert);
				
				ps.setString(1, answer);
				ps.setInt(2, questionID);
				
				int result = 0;
		        result = ps.executeUpdate();
		        if (result < 1) {
		        	out.println("Error: Question failed.");
		        } else { %>
		        	<jsp:include page="Questions.jsp" flush="true"/>
					<div class="content center">
						<h1>Successfully answered!.</h1>
					</div>
		    <%  }
			} else {
				response.sendRedirect("questionErrorPage.jsp");
				return;
			}    
		} catch(Exception e) {
	        out.print("<p>Error connecting to server.</p>" + e);
	     
	    } finally {
	        try { ps.close(); } catch (Exception e) {}
	        try { conn.close(); } catch (Exception e) {}
	    }
		        
		        
	%>
