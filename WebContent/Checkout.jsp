<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.*"%>
<!DOCTYPE html>

<html>
<title>CHECKOUT</title>
<meta charset="ISO-8859-1">

<body>

		<header>Enter address info and Confirm Bid</header>


	<p>

			<form action="confirmationpage.jsp" > Enter your Shipping Information 

			<p><small> You are billed to whatever address is associated with your account </small></p>

		 
		 <br>Enter your address <input  type = "text" name ="add" required /> 

		 <br>Enter your zipcode <input type="number" maxLength = "5" name = "zip" required/> 

		 <br>Enter your phone Number  <input type="number" name = "phone" maxLength = "11" required/> 

			</p>



			Enter your payment info 

			<p> 

			 Enter your card number <input type="number" name = "card" required /> 

			 <br>Enter your expiration date (mm/year) <input type="text" maxLength = "7" name = "exp" required/> 

			 <br>Enter your cvv <input type = "number" maxlength = "3" name ="cvv" required/> 

			</p> 

			

			<br><input type = "submit" value = "Confirm Your Bid"  required />

			</form>

				<b><small> WARNING!!!! Once you confirm your bid, you are pledging to pay that amount if you win the auction, you can not back out!!! The only way you won't be charged is if you lose. </small></b>


</body>

</html>