URL:
http://ec2-18-217-144-53.us-east-2.compute.amazonaws.com:8080/BuyMeWebsite/


private key: PrivateKeyPair.pem
-----BEGIN RSA PRIVATE KEY-----
MIIEogIBAAKCAQEAlbIzGLzXOP8y6KYI6XUsyK1eDjsKqxwfuIdLrla4dL4E+0S8kw0qmFHPJh43
we3m+66IPNNvpGl+JMJY+lntzxSbRdCoQnxnW5IG1v61XYnui3xIChCsgJYXJwlaJQlyXd/3KQWI
3JGCwyt91cEgyooH11XR46C0/ovtbTHaF6bSAzIU1w/R6O+J6cBfymsOwZHB3DEt3h02VehSlsOe
gqkbGrac7TvbediK3dU7jxbrPQvei+RMmU3J9SXaFUQVnZr4hsrGdkz4HZZY1+j0U/UnIyzyz6tW
c+v9OlCCGgs0NvsiephdmccOSumsLLjf9xJJ7Dy3HYilorfj//bjiQIDAQABAoIBAEz1sXlNVKTT
5rte6QQFHsIJB2rvhbuUmOZIgGsf4HL8YhlALGa5hSWMIaBqNqY4BeFsyFPlK+dt6NFDLXWAGFe3
M2DANlEAHi8gsu2DQ4DUcdQ6T9sE2Xq+Lyb9kt+prKeAhlQLqWIkWQK38FidkpsuPXvCfka1j3ey
Pp093O79IeiPPysyNM1pNobJLi29XiH/CsTozefYVBtQ5SQUSjVve2IcXULGnHIo1cyGqRcu/CcG
1HqtQZkJHdlZi2sQjVfKPguqw3ET3NsUXlVI2v3Gk5UQRW6v+FhxouxMyEVmqDFQq32HXhD0gPdi
UKtsLxqt5BARjLBdyQFJTxHGxUUCgYEA8kZ1jGf3KuiORt/59ZahgTnt1vGrzPYegjzr5bnigks7
cs+fZBJGa15GBeK0186CnrCJ5K4fkbWcXV9/3qlWaerMHX2IcxNFO95y3NDDoxN1A0CavuZx78k0
U1WJngVUrHmTJY0uotrEorVM1LCs/dJdcJGOzbtX77UYhN+EZT8CgYEAni0h+9Y+f4KIqmjClfHX
CF8v58F0+8GpQa6Huz6Aw+JRVVddCZZEGynihuKkaHq66sze42r6ybAqXNh0ahb1wm3b8sARnyH3
UQgNIMNeudV4dqU33b4C4J6XVM/BZKsZ4o8miFWVOT458IcdDtC4R0Q1Nj91ZkHywt350NCzHTcC
gYBQGRFV2S1zRy16qyP1mNZOZfuG+6FEAv61KjUHXzxOvVarL49Pw2b6qlFWMsx9KK4wjscYDqUr
RDKtABzDXZLPM6xF97G78dwK3hF1haOYb59Y8uv2PzPeBdRB1N7JmpOS7iLC4HlRqCgobu42xy56
QClaRRVEWTLKckHn9AnOewKBgBFGsK2G6vCWW0Lxij9CWNArRVo0wQg2ULxBycVjwECk2WlOz3Sa
mvm0i29cFcTrkrrOgZGpP5cDzLyzT5O+yjzgLuPGoqYU2aRaEsT/UbtOW4fp574qYLoT2EeFIYRT
Q9KA/B5r6o6EA2QH/d5+YYI3KvCv4ay3i0JJaF2sTcPlAoGAEOGwNKsasbW21wLQyadX9+xFkfhv
oDAe3Y1jmZuBCravuCu7CD1Ej+S1ub+tKsHRNq/QiG1SWldKFUoFLQtNgjYobtwokL6pJfuoJIRq
0BFK6pwNbHNO9451REE3Oett28oAG0hS2/KID1bEFGFG2/95H/lEnulvSE3g1Fg+qxU=
-----END RSA PRIVATE KEY-----

Tomcat Login:
Username: cs336admin
Password: cs336password

Admin login: Through the staff login page
Username: admin
passowrd: adminpassword


Work distribution:

Jerry Zhu (Parts I and V)
-Created Login options for Users and Staff
	-User have new and existing user
	-Staff is just login because the Admin creates the Customer representative accounts
-Created main login page
	-links to other interactions of the site
-Profile page
	-displays profile of current logged on User and allows them to edit the information
	-they can also deactivate their own account if they choose to
Admin page
	-allows the admin user to add customer represenatives
	-generate sales reports
Sales report
	-The admin can view all the transactions that have taken place
	-up and down buttons orgainize the columns from ascending and descending order
	-can view entries in the table with specific items, categories, sellers, and buyers
	-transaction entries were manualy added as adding to the transaction table was not added
Customer Representative page
	-Can view active auctions and delete auctions that the customer representatives deem as incorrect
	-Can view bids on the auction and delete bids that the customer reps deem as incorrect
	-Can edit User information
	-Can answer questions that have no response to them, answered questions will be displayed in the answered questions area where users can ask questions
JSP Files I created:
	-addCRtoDB.jsp (Adds new customer rep user to the CustomerRep table)
	-addCustomerRep.jsp (window that askes for information about the customer rep)
	-addUser.jsp (insert new user information into the Users table)
	-adminHome.jsp (Admin home page)
	-AdminSalesReport.jsp (admin sales report page)
	-checkLogin.jsp (checks if the login is either staff or regular user and then checks if login credetials are valid)
	-CRAnswer.jsp (Displays topic and question and an area for staff to enter response to)
	-CRAuctionList.jsp (Display the list of active Auctions)
	-crConfirmatoin.jsp (after CR has been entered into the database gives admin option to add another rep or return to admin home)
	-CRDeleteBid.jsp (deletes bid that CR deems invalid from bid table)
	-CREditUserInfo.jsp(List of all Users for Customer Reps, has links to edit and delete user
	-CRQuestions.jsp (List of all Questions for staff to answer)
	-CRViewAuctionDetails.jsp (CR view of the bids on specific auction)
	-customerRepHome.jsp (Homepage for the customer rep)
	-DeleteAuction.jsp (deletes auction from the Auction table)
	-deleteCR.jsp (delete customer rep from customer rep table)
	-DeletingUser.jsp (deleting user from user table)
	-EditInfo.jsp (Edit page for entering new information about user)
	-EditingTheUser.jsp (updates the information about the user from edit page)
	-existingUser.jsp (login page for users with accounts)
	-SortSalesReport.jsp (Sorts the admin sales report accordingly)
	-StaffLogin.jsp (login page for staff members)
	-SubmitAnswer.jsp (takes response and answers and places it into the answeredQuestions table)
	-submitQuestion.jsp (insert Question into the question table)
	-UserEditingTheUser.jsp (Editing the user information from the user themselves)
	-UsernameExists.jsp (Username exists page error page)
	-UsernameExistsCR.jsp (Username exists page error page)   } this pages just redirect to different pages
	-UsernameExistsUser.jsp (Username exists page error page)
	-UserProfilePage.jsp (Edit page for the user to enter information about themselves, or delete)
	-UserSelfDelete.jsp (self delete of user profile)
	-ViewCustomerReps.jsp (admin view of all the customer reps for the site).
	
Justin Song (Part IV)

-Alerts
	-Alert the buyer that a higher bid has been placed
	-Alert the buyer that someone has bid higher than the upper limit (for automatic bidding)
-Questions
	-User can post questions
	-User can also browse and search for questions already asked
	
JSP Files:
	questionDatabase.jsp
	questionErrorPage.jsp
	questions.jsp
	questionResponses.jsp
	answerDatabase.jsp
	PlaceBid.jsp (alerts)
	
	
Joel Wallace (Part II)
 -Auctions
     -The Sellers can create items and auction, each item is tied to an auction
  -Placing Bids
     - The buyers can place a bid on an auction and will insert the bid into the table
    The JSP files I created: 
    	 AuctionMade.jsp    (confirms the auction has been made)
	 AuctionMake.jsp    (Used to create auctions and insert items into the database)
	 Checkout.jsp        (Takes user's card information to bid)
	 confirmationpage.jsp (confirmation page of bid)
	 JSAuctionMade.jsp   (Java code needed to run AuctionMade.jsp, redirects to AuctionMade.jsp)
	 PlaceBid.jsp    (after clicking on an item on brings you to this page to place a bid on the item, then directs you to checkout)

Andy Kim (Part III)
- Browsing and advanced search functionality
	- let people browse on the items and see the status of current bidding
	- sort by different criteria (by type, bidding price)
	- search the list of items by various criteria
	- viewing history of bids for any auction
	- view list of all auctions a specific buyer or seller participated in
JSP:
	bidHistory.jsp
	browsed.jsp
	buyHistory.jsp
	sortingItems.jsp
