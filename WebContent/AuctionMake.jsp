<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"
    import="java.sql.*"%>

    <!DOCTYPE html>
 
<html>
<meta charset="ISO-8859-1">
<title> Make an AUCTION PAGE</title>
<body bgcolor="white">

 <header>
<b>Making an Auction </b>  
</header>
 <!-- action = "AuctionMade.jsp" -->
     <form  action = "JSAuctionMade.jsp"  method = "post">
      Enter the name of the item <input  required type = "text" name = "itemName" /><br>
 <textarea required rows = "10" cols = "60"  autofocus name = "description">Give a description of the item.</textarea> <br>
 <br>Add a picture.  <input  required type="file" name="picture" accept="image/*" >
<br>Set the category for your item. <select id ="category" required form = "Item/Auction" name = "category">
		<option>Choose a Category</option>
  <option value="tops">shirts</option>
  <option value="jackets">jackets</option>
  <option value="pants">pants</option>
  <option value="shoes">shoes</option>
  <option value="electronics">electronics</option>
  <option value="kitchen supplies">kitchen supplies</option>
  <option value="other">other</option>
</select>
<br> How many of the items are you selling <input required type = "number" min = "1" step = "1" name = "quantity" />
<br>Set the starting price for your item <input  required type = "number" min = "1" step = "0.01" name = "price" />
<br>Set the starting date <input required type = "date" name = "StartDate" value = "mm/dd/year" /> and closing date <input required type = "date" name = "EndDate"  value = "mm/dd/year" /> for your auction 
<br><br><br>
  <input type = "submit" value = "Confirm Auction"/> </form> 

</body>


</html>