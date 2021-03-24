<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"
    import="java.sql.*"%>
<%
	String SES_NAME = (String)session.getAttribute("SES_NAME");
	String id = request.getParameter("id");
	Class.forName("com.mysql.jdbc.Driver");
	Connection con = DriverManager.getConnection(
			"jdbc:mysql://cs336db.ceclq3s0q7y5.us-east-2.rds.amazonaws.com:3306/BuyMe", "cs336admin",
			"cs336password");
	Statement st = con.createStatement();
	ResultSet rs;
	System.out.println(SES_NAME);
	if(id == null){
		String query = "delete from Users where username = '"+SES_NAME+"';";
		st.executeUpdate(query);
		con.close();
		response.sendRedirect("index.jsp");
	}else{
		String query = "delete from Users where userID = "+id+";";
		st.executeUpdate(query);
		con.close();
		response.sendRedirect("CREditUserInfo.jsp");
	}

%>