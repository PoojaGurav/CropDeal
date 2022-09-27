Create Database CropDeal;
Use CropDeal;

create table UserProfile
(
UserId int IDENTITY(1,1) primary key ,
UserFirstName nvarchar(100) not null,
UserLastName nvarchar(100) not null,
UserEmail nvarchar(100) not null unique,
UserMobileNumber varchar(50) not null unique,
UserType nvarchar(50) not null,
UserCreatedDate date default CURRENT_TIMESTAMP,
UserCreatedBy nvarchar(100) ,
UserModifiedBy nvarchar(100),
UserModifiedDate date default CURRENT_TIMESTAMP,
UserPassword nvarchar(250) not null
);

Select *from UserProfile;

create table CropList(
CropListId int IDENTITY(1,1) primary key,
AvailQuantity nvarchar(100) not null,
Price int not null,
CropName nvarchar(100) not null,
UserModifiedBy nvarchar(100),
UserModifiedDate date default CURRENT_TIMESTAMP,
UserId int foreign key references UserProfile(UserId)
);

Select *From CropList;

create table OrderTransaction(
OrderTrxnId int IDENTITY(1,1) primary key,
OrderQuantity nvarchar(100) not null,
OrderDate date default CURRENT_TIMESTAMP,
UserCreatedDate date default CURRENT_TIMESTAMP,
UserCreatedBy nvarchar(100),
UserModifiedBy nvarchar(100),
UserModifiedDate date default CURRENT_TIMESTAMP,
UserId int foreign key references UserProfile,
DeliveryDate date
);

create table Payment(
InvoiceId int IDENTITY(1,1) primary key,
UserId int foreign key references UserProfile(UserId),
PaymentMethods nvarchar(100) not null,
CardHolderName nvarchar(100) not null,
CardNumber nvarchar(100) not null,
[ExpiryDate] nvarchar(20),
PayAmountBill int not null,
Cvv int not null
);

create table Invoice(
InvoiceId int IDENTITY(1,1) primary key,
BillingTo nvarchar(100) not null,
DeliveryTo nvarchar(100) not null,
IsTransportationCostIncluded nvarchar not null,
UserCreatedDate date default CURRENT_TIMESTAMP,
OrderTrxnId int foreign key references OrderTransaction(OrderTrxnId ),
UserCreatedBy nvarchar(100),
UserModifiedBy nvarchar(100),
UserModifiedDate date default CURRENT_TIMESTAMP,
);


Create Table UserLogin(
UserId int Identity(1,1) primary key,
Email nvarchar(100),
Password nvarchar(100) not null);
