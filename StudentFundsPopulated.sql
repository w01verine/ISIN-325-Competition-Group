Create Database StudentFunds
GO 
USE StudentFunds
GO

Drop Table if exists Category
CREATE TABLE Category(
	CatID int IDENTITY(1,1) NOT NULL,
	CatName nvarchar(50) NULL,
	StateName nvarchar(50) NULL,
		CONSTRAINT [pk_CatID] PRIMARY KEY CLUSTERED
			(CatID ASC)
) ON [PRIMARY]

Drop Table if exists Recipient
CREATE TABLE Recipient(
	RecipientID int IDENTITY(1,1) NOT NULL,
	FName nvarchar(50) NULL,
	LName nvarchar(50) NULL,
	StateID nvarchar(2) NULL,
	AwardID nvarchar(50) null,
		CONSTRAINT [pk_RecipientID] PRIMARY KEY CLUSTERED
			(RecipientID ASC)
) ON [PRIMARY]

Drop Table if exists Donor
CREATE TABLE Donor(
	DonorID int IDENTITY(1,1) NOT NULL,
	FName nvarchar(50) NULL,
	LName nvarchar(50) NULL,
	StateID nvarchar(2) NULL,
	DonationAmount money NULL,
	DonationName nvarchar(50) NULL,
		CONSTRAINT [pk_DonorID] PRIMARY KEY CLUSTERED
			(DonorID ASC)
) ON [PRIMARY]

Drop Table if exists Fund
CREATE TABLE Fund(
	FundID int IDENTITY(1,1) NOT NULL,
	FundName nvarchar(50) NULL,
	FundAmount money NULL,
	CatID int NULL,
	AwardID int NULL,
	DonorID int NULL,
	AwardName varchar(50) NULL,
	AwardDate Date NULL,
	AwardAmount money NULL,
		CONSTRAINT [fk_CatID] FOREIGN KEY(CatID)
			REFERENCES Category(CatID),
		CONSTRAINT [fk_DonorID] FOREIGN KEY(DonorID)
			REFERENCES Donor (DonorID),
		CONSTRAINT [pk_FundID] PRIMARY KEY CLUSTERED
			(FundID ASC)
) ON [PRIMARY]



USE StudentFunds
--Generate Fund Data
Declare @counter int = 1 
Declare @max int = 500 --set number of repetitions here
Declare @catname nvarchar(50)
Declare @statename nvarchar(50)

While @counter <= @max
Begin
Set @catname = (SELECT TOP 1 CategoryName
	From (SELECT 'Scholarship' AS CategoryName
	UNION SELECT 'RoomBoard' AS CategoryName
	UNION SELECT 'Grant' AS CategoryName
	UNION SELECT 'Research' AS CategoryName) as CategoryName ORDER BY NEWID())

Set @statename = (SELECT TOP 1 StateName
	From (SELECT 'MI' AS StateName
	UNION SELECT 'TX' AS StateName
	UNION SELECT 'FL' AS StateName
	UNION SELECT 'OR' AS StateName
	UNION SELECT 'CA' AS StateName
	UNION SELECT 'IL' AS StateName
	UNION SELECT 'IN' AS StateName
	UNION SELECT 'PA' AS StateName
	UNION SELECT 'NV' AS StateName
	UNION SELECT 'NM' AS StateName) as StateName ORDER BY NEWID())

	INSERT INTO Category (CatName, StateName)
	VALUES (@catname, @statename)

	SET @counter = @counter + 1
End
go

USE StudentFunds
--Generate Data for Donors 
Declare @counter2 int = 1 
Declare @max2 int = 500 --set number of repetitions here
Declare @fname nvarchar(50)
Declare @lname nvarchar(50)
Declare @StateID nvarchar(2) 
Declare @DonationAmount money
Declare @DonationName nvarchar(50)

While @counter2 <= @max2
Begin

Set @fname = (SELECT TOP 1 FirstName
	FROM (SELECT 'John' AS FirstName
	UNION SELECT 'Seth' AS FirstName
	UNION SELECT 'Bill' AS FirstName
	UNION SELECT 'Tom' AS FirstName
	UNION SELECT 'Bruce' AS FirstName
	UNION SELECT 'Mike' AS FirstName
	UNION SELECT 'James' AS FirstName
	UNION SELECT 'Colby' AS FirstName
	UNION SELECT 'Luke' AS FirstName
	UNION SELECT 'Dan' AS FirstName
	UNION SELECT 'Willard' AS FirstName
	UNION SELECT 'Sam' AS FirstName
	UNION SELECT 'Jeff' AS FirstName
	UNION SELECT 'Curt' AS FirstName
	UNION SELECT 'Sean' AS FirstName
	UNION SELECT 'Tim' AS FirstName
	UNION SELECT 'Matt' AS FirstName
	UNION SELECT 'Mark' AS FirstName
	UNION SELECT 'David' AS FirstName
	UNION SELECT 'Kevin' AS FirstName
	UNION SELECT 'Dani' AS FirstName
	UNION SELECT 'Jill' AS FirstName
	UNION SELECT 'Jane' AS FirstName
	UNION SELECT 'Suzy' AS FirstName
	UNION SELECT 'Paige' AS FirstName
	UNION SELECT 'Brenda' AS FirstName
	UNION SELECT 'Jessi' AS FirstName
	UNION SELECT 'Emilee' AS FirstName
	UNION SELECT 'Olivia' AS FirstName
	UNION SELECT 'Tori' AS FirstName
	UNION SELECT 'Misty' AS FirstName
	UNION SELECT 'Beth' AS FirstName
	UNION SELECT 'Sarah' AS FirstName
	UNION SELECT 'Willow' AS FirstName
	UNION SELECT 'Hazel' AS FirstName
	UNION SELECT 'Cathy' AS FirstName
	UNION SELECT 'Rachel' AS FirstName
	UNION SELECT 'Madi' AS FirstName
	UNION SELECT 'Kenzi' AS FirstName
	UNION SELECT 'Leah' AS FirstName) AS FirstName ORDER BY NEWID())

Set @lname = (SELECT TOP 1 LastName
	From (SELECT 'Smith' AS LastName
	UNION SELECT 'Dredge' AS LastName
	UNION SELECT 'Johnson' AS LastName
	UNION SELECT 'Williams' AS LastName
	UNION SELECT 'Brown' AS LastName
	UNION SELECT 'Jones' AS LastName
	UNION SELECT 'Miller' AS LastName
	UNION SELECT 'Davis' AS LastName
	UNION SELECT 'Garcia' AS LastName
	UNION SELECT 'Rodriguez' AS LastName
	UNION SELECT 'Wilson' AS LastName
	UNION SELECT 'Martinez' AS LastName
	UNION SELECT 'Anderson' AS LastName
	UNION SELECT 'Taylor' AS LastName
	UNION SELECT 'Thomas' AS LastName
	UNION SELECT 'Hernandez' AS LastName
	UNION SELECT 'Moore' AS LastName
	UNION SELECT 'Martin' AS LastName
	UNION SELECT 'Jackson' AS LastName
	UNION SELECT 'Thompson' AS LastName
	UNION SELECT 'White' AS LastName
	UNION SELECT 'Lopez' AS LastName
	UNION SELECT 'Lee' AS LastName
	UNION SELECT 'Gonzalez' AS LastName
	UNION SELECT 'Gogolin' AS LastName) AS LastName ORDER BY NEWID())

Set @StateID = (SELECT TOP 1 StateID
	From (SELECT 'MI' AS StateID
	UNION SELECT 'TX' AS StateID
	UNION SELECT 'HI' AS StateID
	UNION SELECT 'CO' AS StateID
	UNION SELECT 'MO' AS StateID
	UNION SELECT 'FL' AS StateID
	UNION SELECT 'ND' AS StateID
	UNION SELECT 'SD' AS StateID
	UNION SELECT 'OH' AS StateID
	UNION SELECT 'IN' AS StateID
	UNION SELECT 'NY' AS StateID) as StateID ORDER BY NEWID())

Set @DonationAmount = (SELECT TOP 1 DonationAmount
	From (SELECT '100' AS DonationAmount
	UNION SELECT '200' AS DonationAmount
	UNION SELECT '300' AS DonationAmount
	UNION SELECT '400' AS DonationAmount
	UNION SELECT '500' AS DonationAmount
	UNION SELECT '600' AS DonationAmount
	UNION SELECT '700' AS DonationAmount
	UNION SELECT '800' AS DonationAmount
	UNION SELECT '900' AS DonationAmount
	UNION SELECT '1000' AS DonationAmount
	UNION SELECT '2000' AS DonationAmount
	UNION SELECT '3000' AS DonationAmount
	UNION SELECT '4000' AS DonationAmount
	UNION SELECT '5000' AS DonationAmount
	UNION SELECT '6000' AS DonationAmount
	UNION SELECT '7000' AS DonationAmount
	UNION SELECT '8000' AS DonationAmount
	UNION SELECT '9000' AS DonationAmount
	UNION SELECT '10000' AS DonationAmount
	UNION SELECT '20000' AS DonationAmount) as DonationAmount ORDER BY NEWID())

Set @DonationName = (SELECT TOP 1 DonationName
	From (SELECT 'Alumni' AS DonationName
	UNION SELECT 'Scholarship' AS DonationName
	UNION SELECT 'Tithe' AS DonationName
	UNION SELECT 'Support' AS DonationName
	UNION SELECT 'General' AS DonationName) as DonationName ORDER BY NEWID())

	INSERT INTO Donor (Fname, LName, StateID, DonationAmount, DonationName) 
	values	(@fname, @lname, @StateID, @DonationAmount, @DonationName)

	SET @counter2 = @counter2 + 1
End
go

--Delete Fund
USE StudentFunds
--Generate Fund Data
Declare @counter3 int = 1 
Declare @max3 int = 200 --set number of reprtitions here
Declare @fundname nvarchar(50)
Declare @fundamount money
Declare @catID int
Declare @awardID int
Declare @donorID int
Declare @awardname nvarchar(50) 
Declare @awarddate date
Declare @awardamount money

While @counter3 <= @max3
Begin
Set @fundname = (SELECT TOP 1 FundName
	From (SELECT 'Scholarship' AS FundName
	UNION SELECT 'RoomBoard' AS FundName
	UNION SELECT 'Grant' AS FundName
	UNION SELECT 'Research' AS FundName) as FundName ORDER BY NEWID())

Set @fundamount = (SELECT TOP 1 FundAmount
	From (SELECT '1000000000' AS FundAmount
	UNION SELECT '2000000000' AS FundAmount
	UNION SELECT '500000' AS FundAmount
	UNION SELECT '5000000000' AS FundAmount) as FundAmount ORDER BY NEWID())

Set @catID = (Select TOP 1 CatID
	From (Select CatID From Category) as CatID ORDER BY NEWID())

Set @awardID = (Select TOP 1 AwardID
	From (Select AwardID From Recipient) as AwardID ORDER BY NEWID())

Set @donorID = (Select TOP 1 DonorID
	From (Select DonorID From Donor) as DonorID ORDER BY NEWID())

Set @awardname = (SELECT TOP 1 AwardName
	From (SELECT 'Scholarship' AS AwardName
	UNION SELECT 'RoomBoard' AS AwardName
	UNION SELECT 'Grant' AS AwardName
	UNION SELECT 'Research' AS AwardName) as AwardName ORDER BY NEWID())

Set @awarddate = (SELECT TOP 1 AwardDate
	From (SELECT '2022-12-14' AS AwardDate
	UNION SELECT '2022-05-16' AS AwardDate
	UNION SELECT '2022-08-11' AS AwardDate
	UNION SELECT '2022-07-07' AS AwardDate
	UNION SELECT '2022-09-30' AS AwardDate
	UNION SELECT '2022-02-20' AS AwardDate
	UNION SELECT '2022-06-15' AS AwardDate
	UNION SELECT '2022-04-10' AS AwardDate
	UNION SELECT '2022-11-25' AS AwardDate
	UNION SELECT '2022-01-01' AS AwardDate) as AwardDate ORDER BY NEWID())

Set @awardamount = (SELECT TOP 1 AwardAmount
	From (SELECT '100' AS AwardAmount
	UNION SELECT '200' AS AwardAmount
	UNION SELECT '300' AS AwardAmount
	UNION SELECT '400' AS AwardAmount
	UNION SELECT '500' AS AwardAmount
	UNION SELECT '600' AS AwardAmount
	UNION SELECT '700' AS AwardAmount
	UNION SELECT '800' AS AwardAmount
	UNION SELECT '900' AS AwardAmount
	UNION SELECT '1000' AS AwardAmount
	UNION SELECT '2000' AS AwardAmount
	UNION SELECT '3000' AS AwardAmount
	UNION SELECT '4000' AS AwardAmount
	UNION SELECT '5000' AS AwardAmount
	UNION SELECT '6000' AS AwardAmount
	UNION SELECT '7000' AS AwardAmount
	UNION SELECT '8000' AS AwardAmount
	UNION SELECT '9000' AS AwardAmount
	UNION SELECT '10000' AS AwardAmount
	UNION SELECT '20000' AS AwardAmount) as AwardAmount ORDER BY NEWID())

	INSERT INTO Fund (FundName, FundAmount, CatID, AwardID, DonorID, AwardName, AwardDate, AwardAmount)
	values (@FundName, @FundAmount, @catID, @awardID, @donorID, @AwardName, @AwardDate, @AwardAmount)

	SET @counter3 = @counter3 + 1
End
go

USE StudentFunds
--Generate Data for Recipient 
Declare @counter4 int = 1 
Declare @max4 int = 500 --set number of reprtitions here
Declare @rfname nvarchar(50)
Declare @rlname nvarchar(50)
Declare @rStateID nvarchar(2) 
Declare @rawardID int = 1

While @counter4 <= @max4
Begin

Set @rfname = (SELECT TOP 1 FirstName
	FROM (SELECT 'John' AS FirstName
	UNION SELECT 'Seth' AS FirstName
	UNION SELECT 'Bill' AS FirstName
	UNION SELECT 'Tom' AS FirstName
	UNION SELECT 'Bruce' AS FirstName
	UNION SELECT 'Mike' AS FirstName
	UNION SELECT 'James' AS FirstName
	UNION SELECT 'Colby' AS FirstName
	UNION SELECT 'Luke' AS FirstName
	UNION SELECT 'Dan' AS FirstName
	UNION SELECT 'Willard' AS FirstName
	UNION SELECT 'Sam' AS FirstName
	UNION SELECT 'Jeff' AS FirstName
	UNION SELECT 'Curt' AS FirstName
	UNION SELECT 'Sean' AS FirstName
	UNION SELECT 'Tim' AS FirstName
	UNION SELECT 'Matt' AS FirstName
	UNION SELECT 'Mark' AS FirstName
	UNION SELECT 'David' AS FirstName
	UNION SELECT 'Kevin' AS FirstName
	UNION SELECT 'Dani' AS FirstName
	UNION SELECT 'Jill' AS FirstName
	UNION SELECT 'Jane' AS FirstName
	UNION SELECT 'Suzy' AS FirstName
	UNION SELECT 'Paige' AS FirstName
	UNION SELECT 'Brenda' AS FirstName
	UNION SELECT 'Jessi' AS FirstName
	UNION SELECT 'Emilee' AS FirstName
	UNION SELECT 'Olivia' AS FirstName
	UNION SELECT 'Tori' AS FirstName
	UNION SELECT 'Misty' AS FirstName
	UNION SELECT 'Beth' AS FirstName
	UNION SELECT 'Sarah' AS FirstName
	UNION SELECT 'Willow' AS FirstName
	UNION SELECT 'Hazel' AS FirstName
	UNION SELECT 'Cathy' AS FirstName
	UNION SELECT 'Rachel' AS FirstName
	UNION SELECT 'Madi' AS FirstName
	UNION SELECT 'Kenzi' AS FirstName
	UNION SELECT 'Leah' AS FirstName) AS FirstName ORDER BY NEWID())

Set @rlname = (SELECT TOP 1 LastName
	From (SELECT 'Brady' AS LastName
	UNION SELECT 'Bennett' AS LastName
	UNION SELECT 'Flynn' AS LastName
	UNION SELECT 'Shaw' AS LastName
	UNION SELECT 'Sparks' AS LastName
	UNION SELECT 'Mills' AS LastName
	UNION SELECT 'Whittle' AS LastName
	UNION SELECT 'Gibbs' AS LastName
	UNION SELECT 'Poole' AS LastName
	UNION SELECT 'Perez' AS LastName
	UNION SELECT 'White' AS LastName
	UNION SELECT 'Lucas' AS LastName
	UNION SELECT 'Kenny' AS LastName
	UNION SELECT 'Nguyen' AS LastName
	UNION SELECT 'Washington' AS LastName
	UNION SELECT 'Edwards' AS LastName
	UNION SELECT 'Tate' AS LastName
	UNION SELECT 'Mann' AS LastName
	UNION SELECT 'Kelly' AS LastName
	UNION SELECT 'Maxwell' AS LastName
	UNION SELECT 'Strickland' AS LastName
	UNION SELECT 'Ford' AS LastName
	UNION SELECT 'Graves' AS LastName
	UNION SELECT 'Gallagher' AS LastName
	UNION SELECT 'Longmire' AS LastName) AS LastName ORDER BY NEWID())

Set @rStateID = (SELECT TOP 1 StateID
	From (SELECT 'MI' AS StateID
	UNION SELECT 'TX' AS StateID
	UNION SELECT 'HI' AS StateID
	UNION SELECT 'CO' AS StateID
	UNION SELECT 'MO' AS StateID
	UNION SELECT 'FL' AS StateID
	UNION SELECT 'ND' AS StateID
	UNION SELECT 'SD' AS StateID
	UNION SELECT 'OH' AS StateID
	UNION SELECT 'IN' AS StateID
	UNION SELECT 'NY' AS StateID) as StateID ORDER BY NEWID())

Set @rawardID = @rawardID + 1

	INSERT INTO Recipient (FName, LName, StateID, AwardID)
	values (@rfname, @rlname, @rStateID, @rawardID)

	SET @counter4 = @counter4 + 1
End
go

Select * from Category
Select * from Donor 
Select * from Fund 
Select * from Recipient
