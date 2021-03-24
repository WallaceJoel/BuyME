<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"
    import="java.sql.*"%>
    
    
    <%
    String SES_ID = (String)session.getAttribute("EDIT_ID");
    String SES_NAME = (String)session.getAttribute("SES_NAME");
    System.out.println(SES_ID);
    
    String un = request.getParameter("username");
    String pwd = request.getParameter("password");
    String firstName = request.getParameter("firstName");
    String lastName = request.getParameter("lastName");
    String email = request.getParameter("email");
    String phoneNum = request.getParameter("phoneNum");
    String address = request.getParameter("address");
    String city = request.getParameter("city");
    String country = request.getParameter("country");
    String state = request.getParameter("state");
    String bankInfo = request.getParameter("bank_info");
    
    Class.forName("com.mysql.jdbc.Driver");
	String url = "jdbc:mysql://cs336db.ceclq3s0q7y5.us-east-2.rds.amazonaws.com:3306/BuyMe";
	String username = "cs336admin";
	String password = "cs336password";
	String query = "select * from Users where userID ="+SES_ID+";";
	Connection con = DriverManager.getConnection(url,username,password);
	PreparedStatement stmt = con.prepareStatement(query);
	ResultSet resultSet = stmt.executeQuery();
    while(resultSet.next()){
    	if(un == null || un.equals("")){
    		un = resultSet.getString("username");
    	}if(pwd == null || pwd.equals("")){
    		pwd = resultSet.getString("password");
    	}if(firstName == null || firstName.equals("")){
    		firstName = resultSet.getString("firstName");
    	}if(lastName == null || lastName.equals("")){
    		lastName = resultSet.getString("lastName");
    	}if(email == null || email.equals("")){
    		email = resultSet.getString("email");
    	}if(phoneNum == null || phoneNum.equals("")){
    		phoneNum = resultSet.getString("phoneNum");
    	}if(address == null || address.equals("")){
    		address = resultSet.getString("address");
    	}if(city == null || city.equals("")){
    		city = resultSet.getString("city");
    	}if(country == null || country.equals("")){
    		country = resultSet.getString("country");
    	}if(state == null || state.equals("")){
    		state = resultSet.getString("state");
    	}if(bankInfo == null || bankInfo.equals("")){
    		bankInfo = resultSet.getString("bank_info");
    	}
    	
    	query = "update Users set username ='"+un+"',password ='"+pwd+"',firstName ='"+firstName+"',lastName ='"+lastName+"',email ='"+email+"',phoneNum = '"+phoneNum+"', address = '"+address+"',city ='"+city+"',state = '"+state+"',country = '"+country+"',bank_info ='"+bankInfo+"' where userID = "+SES_ID+";";
    	System.out.println(query);
    	stmt = con.prepareStatement(query);
    	try{
	    	stmt.executeUpdate();
	    	response.sendRedirect("CREditUserInfo.jsp");
    	}catch(SQLException e){
    		if(e.getErrorCode() == 1062 ){
    	        response.sendRedirect("UsernameExistsCR.jsp");
    	    }
    	}
    }
    
    %>