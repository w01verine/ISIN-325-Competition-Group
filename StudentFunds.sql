/*
Create Database StudentFunds
GO
USE StudentFunds
GO
*/
Drop Table if exists Recipient
CREATE TABLE Recipient(
	RecipientID int IDENTITY(1,1) NOT NULL,
	RFName nvarchar(50) NULL,
	RLName nvarchar(50) NULL,
	StateID nvarchar(2) NULL,
	AwardID nvarchar(50) NULL,
		CONSTRAINT [pk_RecipientID] PRIMARY KEY CLUSTERED
			(RecipientID ASC)
) ON [PRIMARY]
declare @counter int = 1
declare @max int = 25 --set number of repetitions here
declare @a varchar(50)
declare @b varchar(50)

while @counter <= @max
begin

SET @a = (SELECT TOP 1 FirstName
    FROM (SELECT 'Allison' AS FirstName
    UNION SELECT 'Christina' AS FirstName
    UNION SELECT 'Matt' AS FirstName
	UNION SELECT 'Nathan' AS FirstName
	UNION SELECT 'Steve' AS FirstName
    UNION SELECT 'Carol' AS FirstName
	UNION SELECT 'Cynthia' AS FirstName
	UNION SELECT 'Terry' AS FirstName
    UNION SELECT 'Gerrit' AS FirstName
	UNION SELECT 'Lisa' AS FirstName
    UNION SELECT 'Maggie' AS FirstName) AS First_Names ORDER BY NEWID())

SET @b =
    (SELECT TOP 1 LastName
    FROM (SELECT 'Johnson' AS LastName
    UNION SELECT 'Hudson' AS LastName
    UNION SELECT 'Jackson' AS LastName
    UNION SELECT 'Gonzalez' AS LastName
	UNION SELECT 'Alexander' AS LastName
    UNION SELECT 'Barrs' AS LastName
    UNION SELECT 'Franklin' AS LastName
	UNION SELECT 'Gallagher' AS LastName
    UNION SELECT 'Peterson' AS LastName
    UNION SELECT 'Cortez' AS LastName
	UNION SELECT 'McGee' AS LastName) AS Last_Names ORDER BY NEWID())

	insert into Recipient values (@a, @b)
	set @counter = @counter + 1
end
select * from Recipient


Drop Table if exists Category
CREATE TABLE Category(
	CatID int IDENTITY(1,1) NOT NULL,
	CatName nvarchar(50) NULL,
	StateID nvarchar(2) NULL,
		CONSTRAINT [pk_CatID] PRIMARY KEY CLUSTERED
			(CatID ASC)
) ON [PRIMARY]

Drop Table if exists Donor
CREATE TABLE Donor(
	DonorID int IDENTITY(1,1) NOT NULL,
	DFName nvarchar(50) NULL,
	DLName nvarchar(50) NULL,
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
