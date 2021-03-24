<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"
    import="java.sql.*"%>
<%
	String id = request.getParameter("id");
	if(id == null){
		response.sendRedirect("CRAuctionList.jsp");
	}else{
	Class.forName("com.mysql.jdbc.Driver");
	String url = "jdbc:mysql://cs336db.ceclq3s0q7y5.us-east-2.rds.amazonaws.com:3306/BuyMe";
	String username = "cs336admin";
	String password = "cs336password";
	Connection con = DriverManager.getConnection(url,username,password);
	String query = "delete from Auction where Auction_ID = "+id+";";
	PreparedStatement stmt = con.prepareStatement(query);
	stmt.executeUpdate();
	con.close();
	response.sendRedirect("CRAuctionList.jsp");
	}
%>