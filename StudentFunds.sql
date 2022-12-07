

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
