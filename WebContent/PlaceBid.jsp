<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.*"%>
<!DOCTYPE html>

<html>
<title>Place a Bid</title>
<body>
<form action = mainPage.jsp>
<input type = "submit"  value = "GO HOME"/> </form> <br> <br> <br>
<%

Class.forName("com.mysql.jdbc.Driver");
Connection con = DriverManager.getConnection(
		"jdbc:mysql://cs336db.ceclq3s0q7y5.us-east-2.rds.amazonaws.com:3306/BuyMe", "cs336admin",
		"cs336password");
Statement st = con.createStatement();

String user = session.getAttribute("SES_NAME").toString(); 
String userFind = "select UserID from Users where username = '"+user+"';";
ResultSet rs = st.executeQuery(userFind);
String user_ID = "";
if(rs.next())  {
     user_ID =new String(rs.getString(1));
    System.out.println("userID :"+ user_ID);  
}

String AuctionId = request.getParameter("Auction");
String itemTitle = request.getParameter("itemName");
String itemImage = request.getParameter("itemPic");
String itemDescript = request.getParameter("itemDescription");
 
%>

	<header> <b>Placing a Bid</b>  </header>
	<p> The Auction Order ID is  AUCT-<%=AuctionId %>-ION . </p>
       <p> <%= itemTitle %> </p>
        <p> <%= itemDescript %>
        <img src = <%= itemImage %> height = "100" width = "100">   </p>
      
       
       <form  action = bid.jsp>
	   How much do you want to bid on the item <input name = BID type = "number" min = "1" step = "0.01" />
		     <input type = "hidden" name="TheItem"  value =<%= itemTitle %> /> 
		     <input type = "hidden" name="ThePic"  value =<%= itemImage %> /> 
		     <input type = "hidden" name="TheDescription"  value =<%= itemDescript %> /> 
		      <input type = "hidden" name="AuctionId"  value =<%= AuctionId %> /> 
		     
		     <br> <br>
		     What is your limit for auto bidding? (if you don't want auto bidding then just leave it at 0.00); <input type = "number" name = "Bid_Limit" value = "0.00" min = "0" step = "0.01"/>
		     
		     IF YOU ARE REDIRECTED TO THIS PAGE, Your BID WAS TOO LOW;
		      	
			<input type = "submit" value = "Place BID" />  
			
       </form>
       
</body>

</html>
