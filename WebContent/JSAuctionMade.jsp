<%@ page import="java.sql.*"%>
<%


String itemName =request.getParameter("itemName");
String itemDescription = request.getParameter("description");
String itemImage = request.getParameter("picture");
String itemCategory = request.getParameter("category");
String itemQuantity = request.getParameter("quantity");
String AuctionMinimumBid = request.getParameter("price");
String AuctionOpenDate = request.getParameter("StartDate");
String AuctionCloseDate = request.getParameter("EndDate");

System.out.println(itemQuantity);

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
	  
	String sql =  "insert into Items (SellerID, Title, Description, Photo, Category, Quantity ) values ("+user_ID+","+"'"+itemName+"'"+","+"'"+itemDescription+"'"+"," +"'"+itemImage+"'"+", "+"'"+itemCategory+"'"+","+itemQuantity+");";
	  String ItemID = "select ItemID from Items where Title = "+ "'"+itemName+"' AND ( Description = "+"'"+itemDescription+"' )AND (Category = "+"'"+itemCategory+"') AND ( Quantity = "+itemQuantity +");";
	  
  
	st.executeUpdate(sql);
	 ResultSet rs2 = st.executeQuery(ItemID);
	String item_ID = "";
	if(rs2.next())  {
	     item_ID =new String(rs2.getString(1));
	    System.out.println("itemID :"+ item_ID);  
	}
	
  String sql2 =  "insert into Auction (SellerID, Item_ID, MinimumFloor, OpeningDate, ClosingDate, CurrentBidValue )  values ("+user_ID+","+item_ID+","+AuctionMinimumBid+","+"'"+AuctionOpenDate+"'"+"," +"'"+AuctionCloseDate+"'"+"0.00);"; 

	st.executeUpdate(sql2);
	 
	String GetA_ID =  "Select Auction_ID from Auction where Item_ID = "+item_ID+";"; 
	 ResultSet AID = st.executeQuery(GetA_ID);
		String AuctID = "";
		if(AID.next())  {
		     AuctID =new String(AID.getString(1));
		    System.out.println("Auction ID:"+ AuctID);  
		}
	
	String firstBidder = "insert into Bids (AuctionID, BuyerID, Bid_Value, Bid_Limit) values ("+AuctID+", 0 , 0.00 , 0.00);";
	st.executeQuery(firstBidder);
	response.sendRedirect("AuctionMade.jsp");
	
	
%> 
