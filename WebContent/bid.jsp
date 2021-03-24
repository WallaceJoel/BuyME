<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*"%>
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

String AuctionId = request.getParameter("AuctionId");
String itemTitle = request.getParameter("TheItem");
String itemImage = request.getParameter("ThePic");
String itemDescript = request.getParameter("TheDescription");

String UserBidLimit = request.getParameter("Bid_Limit");

String BID = request.getParameter("BID"); 
double bidamount = Double.parseDouble(BID);
String getCurrentBid = "Select MinimumFloor, CurrentBidValue, BuyerID from Auction where Auction_ID = 10;";
ResultSet CB  = st.executeQuery(getCurrentBid); String Bidding = ""; String MF = ""; String PreviousBidder = "";
if(CB.next())  {
	     Bidding =new String(CB.getString(1));
	     MF = new String(CB.getString(2));
	     PreviousBidder = new String(CB.getString(3));
	    System.out.println("BID is :"+ Bidding + "MF is : " + MF);  
	}
String PreviousBidderBidLimit ="Select Bid_Limit from Bids where AuctionID = "+AuctionId+" AND (BuyerID = "+PreviousBidder+");";
ResultSet PB = st.executeQuery(PreviousBidderBidLimit); String BidLimit = "";
if(PB.next())  {
	     BidLimit = new String(PB.getString(1));
	    System.out.println("Limit is :"+BidLimit);  
	}


double CurrentBid = Double.parseDouble(Bidding);
double MiniFloor = Double.parseDouble(MF);
double PBLimit = Double.parseDouble(BidLimit);
String bidStatus = "";
if( bidamount > CurrentBid && bidamount > MiniFloor){ 
	 if(PBLimit > bidamount){
	String updateBid = "Update Auction Set CurrentBidValue  ="+bidamount+ "  where Auction_ID = "+AuctionId+";";
	bidStatus = "Bid Was too low try to bid higher";
	 st.execute(updateBid);
	 response.sendRedirect("PlaceBid.jsp");
   }else{
	 String updateBid = "Update Auction Set CurrentBidValue  ="+bidamount+ "  where Auction_ID = "+AuctionId+";";
	 String changeBidLimit = "Update Bids Set Bid_Limit = "+UserBidLimit+", BuyerID = "+user_ID+", BID_Value = "+bidamount+" where AuctionID = "+AuctionId+" ";
	 String updateBidder = "Update Auction Set CurrentLeadBidder = "+user_ID+" where Auction_ID ="+AuctionId+";";
	 st.execute(updateBid); 
	 st.execute(updateBidder); 
	 st.execute(changeBidLimit);
	 String OutBid = "insert into Alerts (user, message) values ("+PreviousBidder+","+"'You've been outbid on an Auction for the item:   "+itemTitle+ " ');";
	 st.execute(OutBid);
	 response.sendRedirect("Checkout.jsp");
   }
}else{
	 response.sendRedirect("PlaceBid.jsp");
}

%>

