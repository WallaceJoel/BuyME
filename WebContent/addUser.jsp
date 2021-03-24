<%@ page import="java.sql.*"%>
<%
	String userid = request.getParameter("username");
	String pwd = request.getParameter("password");
	String fn = request.getParameter("firstName");
	String ln = request.getParameter("lastName");
	String email = request.getParameter("email");
	String phoneNum = request.getParameter("phoneNum");
	String address = request.getParameter("address");
	String city = request.getParameter("city");
	String state = request.getParameter("state");
	String country = request.getParameter("country");
	String bankInfo = request.getParameter("bankInfo");
	
	Class.forName("com.mysql.jdbc.Driver");
	Connection con = DriverManager.getConnection(
			"jdbc:mysql://cs336db.ceclq3s0q7y5.us-east-2.rds.amazonaws.com:3306/BuyMe", "cs336admin",
			"cs336password");
	Statement st = con.createStatement();
	ResultSet rs;
	try{
		String query = "INSERT INTO Users VALUES ('"+userid+"','" + pwd + "','" + fn + "','" + ln + "','"+ email+"','"+phoneNum+"','"+address+"','"+city+"','"+state+"','"+country+"','"+bankInfo+"',NULL)";
		System.out.println(query);
		//add values into the Customer Rep Database
		st.executeUpdate(query);
		response.sendRedirect("index.jsp");
	} catch(SQLException e){
		
	    if(e.getErrorCode() == 1062 ){
	    	
	        response.sendRedirect("UsernameExists.jsp");
	    }
	}
%>