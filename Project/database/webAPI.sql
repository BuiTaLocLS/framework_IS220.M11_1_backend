CREATE TABLE ProductType
(
	ProductTypeID INT NOT NULL PRIMARY KEY,
    ProductTypeName NVARCHAR(50) NOT NULL
);
CREATE TABLE Supplier
(
	SupplierID INT NOT NULL PRIMARY KEY,
    SupplierName NVARCHAR(50) NOT NULL,
    SupplierAddress NVARCHAR(50) NOT NULL
);

CREATE TABLE Product
(
	ProductID INT NOT NULL PRIMARY KEY,
	SupplierID INT NOT NULL,
    ProductTypeID INT NOT NULL,
    ProductName NVARCHAR(50) NOT NULL,
    Price DOUBLE  NOT NULL,
    FOREIGN KEY (SupplierID) REFERENCES Supplier(SupplierID),
    FOREIGN KEY (ProductTypeID) REFERENCES ProductType(ProductTypeID)
);
ALTER TABLE product ADD Img_URL VARCHAR(100);
CREATE TABLE User
(
	UserID INT NOT NULL PRIMARY KEY,
	UserName  NVARCHAR(50) NOT NULL,
    UserMail VARCHAR(40) NOT NULL,
    UserBirthdate DATE,
    UserGender INT,
    UserAddress VARCHAR(60) NOT NULL
);

CREATE TABLE Account
(
	AccountID VARCHAR(40) NOT NULL PRIMARY KEY,
	AccountPassword  VARCHAR(20) NOT NULL,
    UserID INT NOT NULL,
    IsAdmin BOOLEAN,
    CreatedDate DATE,
    IsActive BOOLEAN,
	FOREIGN KEY (UserID) REFERENCES User(UserID)
); 

CREATE TABLE SearchHistory
(
	SearchHistoryID INT NOT NULL PRIMARY KEY,
    AccountID VARCHAR(40) NOT NULL,
    SearchContent NVARCHAR(50) NOT NULL,
    SearchDate DATETIME,
    FOREIGN KEY (AccountID) REFERENCES Account(AccountID)
);
CREATE TABLE Review
(
	ProductID INT NOT NULL,
    AccountID VARCHAR(40) NOT NULL ,
    Ranking INT NOT NULL,
    Comment NVARCHAR(80),
    CreatedDate DATETIME,
    PRIMARY KEY (ProductID,AccountID),
    FOREIGN KEY (ProductID) REFERENCES Product(ProductID),
    FOREIGN KEY (AccountID) REFERENCES Account(AccountID)
);

CREATE TABLE Cart 
(
	CartID INT NOT NULL PRIMARY KEY,
	AccountID VARCHAR(40) NOT NULL ,
    CartCapacity INT NOT NULL,
    CartTotal DOUBLE NOT NULL,
    FOREIGN KEY (AccountID) REFERENCES Account(AccountID)
);

CREATE TABLE CartDetail 
(
	CartID INT NOT NULL,
    ProductID INT NOT NULL,
    Capacity INT NOT NULL,
    Money DOUBLE NOT NULL,
    AddDate DATETIME NOT NULL,
    PRIMARY KEY (CartID, ProductID),
    FOREIGN KEY (CartID) REFERENCES Cart(CartID),
    FOREIGN KEY (ProductID) REFERENCES Product(ProductID)
);

CREATE TABLE  Address
(
	AddressID INT NOT NULL PRIMARY KEY,
    AccountID VARCHAR(40) NOT NULL,
    Diachi  NVARCHAR(60) NOT NULL,
	FOREIGN KEY (AccountID) REFERENCES Account(AccountID)
);

CREATE TABLE  Order_
(
	OrderID INT NOT NULL PRIMARY KEY,
    AddressID INT NOT NULL,
    AccountID VARCHAR(40) NOT NULL,
    CreatedDate DATETIME,
    Status_ INT NOT NULL,
    Total DOUBLE NOT NULL,
	FOREIGN KEY (AccountID) REFERENCES Account(AccountID),
    FOREIGN KEY (AddressID) REFERENCES Address(AddressID)
);

CREATE TABLE OrderDetail 
(
	OrderID INT NOT NULL,
    ProductID INT NOT NULL,
	Capacity INT NOT NULL,
    Money DOUBLE NOT NULL,
    PRIMARY KEY (OrderID, ProductID),
    FOREIGN KEY (OrderID) REFERENCES Order_(OrderID),
    FOREIGN KEY (ProductID) REFERENCES Product(ProductID)
);
INSERT INTO supplier VALUES(1,'Adidas','USA');
INSERT INTO supplier VALUES(2,'Nike','USA');

INSERT INTO producttype VALUES(1,'Shoe');
INSERT INTO producttype VALUES(2,'Shirt');

INSERT INTO product VALUES(1,1,2,"Own the run tee",750000,"https://drive.google.com/file/d/1SyFDHvXwM7qw12I30cfucIJdUGdi_Ljp/view?usp=sharing");
INSERT INTO product VALUES(2,2,1,"Air Jordan XXXVI",5535000,"https://drive.google.com/file/d/1EVmu5ETMZX3-PF5muxrWX7WQJkeb-PN6/view?usp=sharing");

