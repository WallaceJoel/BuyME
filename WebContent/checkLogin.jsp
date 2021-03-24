<%@ page import="java.sql.*"%>
<%
	
	String userid = request.getParameter("username");
	String pwd = request.getParameter("password");
	String type = (String)session.getAttribute("type");
	if(type == null){
		response.sendRedirect("index.jsp");
	}
	System.out.println("type");
	session.setAttribute("SES_NAME",userid);
	System.out.println(type);
	Class.forName("com.mysql.jdbc.Driver");
	Connection con = DriverManager.getConnection(
			"jdbc:mysql://cs336db.ceclq3s0q7y5.us-east-2.rds.amazonaws.com:3306/BuyMe", "cs336admin",
			"cs336password");
	Statement st = con.createStatement();
	ResultSet rs;
	if(type.equals("staff")){
		rs = st.executeQuery("select username,password from AdminUser where username='" + userid + "' and password='" + pwd + "'");
		if(rs.next()==false){
			rs = st.executeQuery("select username,password from CustomerReps where username='"+userid+"' and password='"+pwd+"'");
			if(rs.next()==false){
				out.println("Invalid password <a href='StaffLogin.jsp'>try again</a>");
			}
			else{
				response.sendRedirect("customerRepHome.jsp");
			}
		}
		else{
			response.sendRedirect("adminHome.jsp");
		}
	}else{
		rs = st.executeQuery("select username,password from Users where username='"+userid+"' and password='"+pwd+"'");
		System.out.println("select username,password from Users where username'"+userid+"' and password='"+pwd+"'");
		if(rs.next()==false) {
			out.println("Invalid password <a href='existingUser.jsp'>try again</a>");
		}else{
			response.sendRedirect("mainPage.jsp");
		}
	}
	con.close();

%>