DROP DATABASE IF EXISTS BuyMe;
CREATE DATABASE BuyMe;
USE BuyMe;

/*admin*/
DROP TABLE IF EXISTS AdminUser;
CREATE TABLE AdminUser(
	username VARCHAR(255),
    password VARCHAR(255),
    adminID INT(8) NOT NULL AUTO_INCREMENT PRIMARY KEY
);

INSERT INTO AdminUser VALUES("admin", "adminPassword",NULL);

/*customer rep*/
DROP TABLE IF EXISTS CustomerReps;
CREATE TABLE CustomerReps(
	username VARCHAR(255) NOT NULL,
    password VARCHAR(255) NOT NULL,
    firstName VARCHAR(255) NOT NULL,
    lastName VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL,
    repID INT(8) NOT NULL AUTO_INCREMENT PRIMARY KEY
);

/*basic user*/
DROP TABLE IF EXISTS Users;
CREATE TABLE Users(
	username VARCHAR(255) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL,
    firstName VARCHAR(255) NOT NULL,
    lastName VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL,
    phoneNum VARCHAR(255) NOT NULL,
    address VARCHAR(255) NOT NULL,
    city VARCHAR(255) NOT NULL,
    state VARCHAR(255) NOT NULL,
    country VARCHAR(255) NOT NULL,
    bank_info VARCHAR(255) NOT NULL,
    userID INT(8) NOT NULL AUTO_INCREMENT,
    PRIMARY KEY (userID,username)
);
/*alerting buyer outbid*/
DROP TABLE IF EXISTS Alerts;
CREATE TABLE Alerts(
	messageID INT NOT NULL AUTO_INCREMENT,
    user VARCHAR(255) NOT NULL,
    message VARCHAR(255) NOT NULL,
    FOREIGN KEY (user) REFERENCES Users(username)
		ON DELETE CASCADE,
    PRIMARY KEY(messageID)
);

drop table if exists Questions;
create table Questions(
	questionID int(8) not null auto_increment, 
	topic varchar(255) not null, 
    question text not null,
    answer mediumtext,
	user varchar(255) not null,
    foreign key (user) references Users(username) on delete cascade on update cascade,
    primary key(questionID)
);

drop table if exists AnsweredQuestions;
create table AnsweredQuestions(
	questionID int(8) not null auto_increment, 
	topic varchar(255) not null, 
    question text not null,
    answer mediumtext not null,
    primary key(questionID)
);



drop table if exists Items;
CREATE TABLE Items (

  `ItemID` int(8) NOT NULL AUTO_INCREMENT,

  `SellerID` int(8) DEFAULT NULL,

  `Quantity` int(11) DEFAULT NULL,

  `Title` text,

  `Photo` blob,

  `Description` text,

  `Category` varchar(15) DEFAULT NULL,

  PRIMARY KEY (`ItemID`),

  KEY `SellerID` (`SellerID`),

  CONSTRAINT `Items_ibfk_1` FOREIGN KEY (`SellerID`) REFERENCES `Users` (`userID`) ON DELETE CASCADE

) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=latin1;

drop table if exists Auction;
CREATE TABLE Auction (

  `Auction_ID` int(8) NOT NULL AUTO_INCREMENT,

  `Item_ID` int(8) DEFAULT NULL,

  `Seller_ID` int(8) DEFAULT NULL,

  `OpeningDate` varchar(10) DEFAULT NULL,

  `ClosingDate` varchar(10) DEFAULT NULL,

  `MinimumFloor` double(10,2) DEFAULT NULL,

  `CurrentBidValue` double(10,2) DEFAULT NULL,

  `CurrentLeadBidder` int(8) DEFAULT NULL,

  PRIMARY KEY (`Auction_ID`),

  KEY `Item_ID` (`Item_ID`),

  KEY `Seller_ID` (`Seller_ID`),

  KEY `CurrentLeadBidder` (`CurrentLeadBidder`),

  CONSTRAINT `Auction_ibfk_1` FOREIGN KEY (`Item_ID`) REFERENCES `Items` (`ItemID`) ON DELETE CASCADE,

  CONSTRAINT `Auction_ibfk_2` FOREIGN KEY (`Seller_ID`) REFERENCES `Users` (`userID`) ON DELETE CASCADE,

  CONSTRAINT `Auction_ibfk_3` FOREIGN KEY (`CurrentLeadBidder`) REFERENCES `Users` (`userID`)

) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;
drop table if exists Bids;
CREATE TABLE `Bids` (

  `BidID` int(8) NOT NULL AUTO_INCREMENT,

  `AuctionID` int(8) DEFAULT NULL,

  `BuyerID` int(8) DEFAULT NULL,

  `Bid_Value` double DEFAULT NULL,

  `Bid_Limit` decimal(10,0) DEFAULT NULL,

  `Status` bit(1) DEFAULT NULL,

  PRIMARY KEY (`BidID`),

  KEY `AuctionID` (`AuctionID`),

  KEY `BuyerID` (`BuyerID`),

  CONSTRAINT `Bids_ibfk_1` FOREIGN KEY (`AuctionID`) REFERENCES `Auction` (`Auction_ID`) ON DELETE CASCADE,

  CONSTRAINT `Bids_ibfk_2` FOREIGN KEY (`BuyerID`) REFERENCES `Users` (`userID`) ON DELETE CASCADE

) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;




drop table if exists Transactions;
create table Transactions(
	TransactionID int(8) not null auto_increment,
    ItemTitle varchar(255),
    ItemID int(8) not null,
    BuyerUsername varchar(255),
    SellerUsername varchar(255),
    Date date,
    Amount double,
    Category varchar(255),
    primary key(TransactionID)
);

insert into Users values('DoNotDelete','Delete?NO','Do\Not','Delete','doNotDeleteMe@gmail.com','5556667777','In Do Not Delete District','NoDelete','ND','Forever','SQL FOREVERRRRRR',0);
insert into Users values('testuser','test','test','user','testuser@gmail.com','1234567890','123 testing lane','testing town','test state','test nation','test bank',2);

insert into Transactions values (NULL,"shoe",1,"a","b",20190421,2.00,"shoes");
insert into Transactions values (NULL,"hat",2,"b","a",20190422,5.00,"shoes");
insert into Transactions values (null,"computer",3,"test","b",20190423,100.00,"electronics");
insert into Transactions values (null,"computer",3,"test","b",20190423,100.00,"electronics");
insert into Transactions values (null,"Dell computer",4,"test","a",20190423,100.00,"electronics");
insert into Transactions values (null,"HP computer",5,"test","c",20190423,2000.00,"electronics");

insert into Items values(1,2,2,'Big Hat',null,'A very big hat','other');

insert into Auction values(1,1,2,'04-23-2019','05-23-2019',3.00,5.00,null);
insert into Auction values(2,1,2,'04-23-2019','03-23-2019',7.00,5.00,null);

insert into Bids values(null,2,1,7.00,2.00,1);
insert into Bids values(null,2,2,-7.00,2.00,1);

insert into Questions values (NULL,'topic','Where do I leave questions?',null,'testuser');