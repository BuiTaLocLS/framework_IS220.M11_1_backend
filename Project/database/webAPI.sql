CREATE TABLE ProductType
(
	ProductTypeID INT NOT NULL PRIMARY KEY AUTO_INCREMENT ,
    ProductTypeName NVARCHAR(50) NOT NULL
);

CREATE TABLE Supplier
(
	SupplierID INT NOT NULL PRIMARY KEY AUTO_INCREMENT ,
    SupplierName NVARCHAR(50) NOT NULL,
    SupplierAddress NVARCHAR(50) NOT NULL
);

CREATE TABLE Product
(
	ProductID INT NOT NULL PRIMARY KEY AUTO_INCREMENT ,
	SupplierID INT NOT NULL,
    ProductTypeID INT NOT NULL,
    ProductName NVARCHAR(50) NOT NULL,
    Price DOUBLE  NOT NULL,
    IMG_URL varchar(150),
    FOREIGN KEY (SupplierID) REFERENCES Supplier(SupplierID),
    FOREIGN KEY (ProductTypeID) REFERENCES ProductType(ProductTypeID)
);

CREATE TABLE User
(
	UserID INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
	UserName  NVARCHAR(50) NOT NULL,
    UserMail VARCHAR(40) NOT NULL,
    UserBirthdate DATE,
    UserGender INT,
    UserAddress NVARCHAR(60) NOT NULL
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
	SearchHistoryID INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    AccountID VARCHAR(40) NOT NULL,
    SearchContent NVARCHAR(50) NOT NULL,
    SearchDate DATETIME,
    FOREIGN KEY (AccountID) REFERENCES Account(AccountID)
);

CREATE TABLE Review
(
	ProductID INT NOT NULL AUTO_INCREMENT,
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
	CartID INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
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
	AddressID INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    AccountID VARCHAR(40) NOT NULL,
    Diachi  NVARCHAR(60) NOT NULL,
	FOREIGN KEY (AccountID) REFERENCES Account(AccountID)
);

CREATE TABLE  Order_
(
	OrderID INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
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
	OrderID INT NOT NULL AUTO_INCREMENT,
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
INSERT INTO user VALUES(1,'Nhâm hồng Phúc','nhamphuc414@gm.com','2001-1-14',1,"Bình Dương");
INSERT INTO account VALUES('hongphuc414','12345',1,0,'2021-11-14',0);
/*Insert product type*/
select * from producttype;
INSERT INTO producttype(ProductTypeName) VALUES('Giày bóng đá');
INSERT INTO producttype(ProductTypeName) VALUES('Giày thể thao');
INSERT INTO producttype(ProductTypeName) VALUES('Quần áo bóng đá');
INSERT INTO producttype(ProductTypeName) VALUES('Bó gối bóng đá');
INSERT INTO producttype(ProductTypeName) VALUES('Túi thể thao');
/*Insert supplier*/
select * FROM supplier;
INSERT INTO SUPPLIER(supplierName, SupplierAddress) VALUES('Aolikes','Quan 1 tp HCM');
INSERT INTO SUPPLIER(supplierName, SupplierAddress) VALUES('Super Sonic','Thuận An, Bình Dương');
INSERT INTO SUPPLIER(supplierName, SupplierAddress) VALUES('Mira Sky','Dĩ An, Bình Dương');
INSERT INTO SUPPLIER(supplierName, SupplierAddress) VALUES('Jogarbola','Quận 2 tp HCM');
INSERT INTO SUPPLIER(supplierName, SupplierAddress) VALUES('Fasten','Dĩ An, Bình Dương');
INSERT INTO SUPPLIER(supplierName, SupplierAddress) VALUES('Clash','Thuận An, Bình Dương');

/*Insert product*/
select * from product;
INSERT INTO product(SupplierID, ProductTypeID, ProductName, Price, IMG_URL) VALUES(5,4,'Giày Pan Sonic S 2021 IC',540000,'https://drive.google.com/file/d/1ZOfFSKXYxwLYY-3R3YobFDs9ZEAEh5Ia/view?usp=sharing');
INSERT INTO product(SupplierID, ProductTypeID, ProductName, Price, IMG_URL) VALUES(5,4,'Giày Pan Sonic S 2021 IC',540000,'https://drive.google.com/file/d/14NWj7UQqWZHGgi4ZpGmmGOlvJ1n_phvL/view?usp=sharing');
INSERT INTO product(SupplierID, ProductTypeID, ProductName, Price, IMG_URL) VALUES(5,4,'Giày Pan Sonic S 2021 IC',540000,'https://drive.google.com/file/d/1iQrBi5xvA__fIgsJLMHzWyt7r7sMBG2w/view?usp=sharing');
INSERT INTO product(SupplierID, ProductTypeID, ProductName, Price, IMG_URL) VALUES(5,4,'Giày Pan Sonic L 2021 IC',540000,'https://drive.google.com/file/d/1Rs1kPbNWVGKjr4NxfzwhVF9Em3d6i0XM/view?usp=sharing');
INSERT INTO product(SupplierID, ProductTypeID, ProductName, Price, IMG_URL) VALUES(5,4,'Giày Pan Sonic L 2021 IC',540000,'https://drive.google.com/file/d/1BrYrRbnTuteII-0QLTONEt4uP6ysFzzT/view?usp=sharing');
INSERT INTO product(SupplierID, ProductTypeID, ProductName, Price, IMG_URL) VALUES(5,4,'Giày Pan Sonic L 2021 IC',540000,'https://drive.google.com/file/d/1OXKt9pRk9Z0ujzMGEkgZL-5KdxFx7o01/view?usp=sharing');
INSERT INTO product(SupplierID, ProductTypeID, ProductName, Price, IMG_URL) VALUES(6,5,'Giày thể thao Mira Sky S1',699000,'https://drive.google.com/file/d/17WCHnpRWTuA_AAKclh4hZhDjAy5U2YrL/view?usp=sharing');
INSERT INTO product(SupplierID, ProductTypeID, ProductName, Price, IMG_URL) VALUES(6,5,'Giày thể thao Mira Sky S2',699000,'https://drive.google.com/file/d/1rWs2Tpqnve88Voew5s_f7hYKRQEQQJfg/view?usp=sharing');
INSERT INTO product(SupplierID, ProductTypeID, ProductName, Price, IMG_URL) VALUES(6,5,'Giày thể thao Mira Sky S3',699000,'https://drive.google.com/file/d/1tatbg0hYlyMY3OK22lHZf0Foy1wPkaoD/view?usp=sharing');
INSERT INTO product(SupplierID, ProductTypeID, ProductName, Price, IMG_URL) VALUES(6,5,'Giày thể thao Mira Sky S4',699000,'https://drive.google.com/file/d/1856Uqg6U368BZE8bGvb6o_8kf72mMss8/view?usp=sharing');
INSERT INTO product(SupplierID, ProductTypeID, ProductName, Price, IMG_URL) VALUES(7,5,'Giày thể thao Jogarbola Boost M1',790000,'https://drive.google.com/file/d/1k3EMHq2KqBv1dKtOALghtGGN--XHl32m/view?usp=sharing');
INSERT INTO product(SupplierID, ProductTypeID, ProductName, Price, IMG_URL) VALUES(7,5,'Giày thể thao Jogarbola Boost M2',790000,'https://drive.google.com/file/d/197i8V9ozl1f-1M-4ySrj1q-rFgFXwSG8/view?usp=sharing');
INSERT INTO product(SupplierID, ProductTypeID, ProductName, Price, IMG_URL) VALUES(7,4,'Giày Jogarbola 001 TF',490000,'https://drive.google.com/file/d/1Z51aMyFkgilZf59Vw_e1fvOGWm9EJ0Fn/view?usp=sharing');
INSERT INTO product(SupplierID, ProductTypeID, ProductName, Price, IMG_URL) VALUES(7,4,'Giày Jogarbola 002 TF',490000,'https://drive.google.com/file/d/18aNPsDhIsYpTA1N3Zy4HKxwtyvvVaDBt/view?usp=sharing');
INSERT INTO product(SupplierID, ProductTypeID, ProductName, Price, IMG_URL) VALUES(7,4,'Giày Jogarbola 003 TF',490000,'https://drive.google.com/file/d/1lt6x_oau9sPltALMRqUZdG003yQxVaxc/view?usp=sharing');
INSERT INTO product(SupplierID, ProductTypeID, ProductName, Price, IMG_URL) VALUES(7,4,'Giày Jogarbola 004 TF',490000,'https://drive.google.com/file/d/1CnPXIabERaj2B_loYOQpX4VNYM4rQygO/view?usp=sharing');
INSERT INTO product(SupplierID, ProductTypeID, ProductName, Price, IMG_URL) VALUES(7,4,'Giày Jogarbola 005 TF',490000,'https://drive.google.com/file/d/1t8-Hl88BNc8_jeNn_WUQwy9B_EaETsZD/view?usp=sharing');
INSERT INTO product(SupplierID, ProductTypeID, ProductName, Price, IMG_URL) VALUES(7,4,'Giày Jogarbola 006 TF',490000,'https://drive.google.com/file/d/19zY78L4147wGSBm9gR7XBxCgGtZ8EL8-/view?usp=sharing');
INSERT INTO product(SupplierID, ProductTypeID, ProductName, Price, IMG_URL) VALUES(8,6,'Quần áo bóng đá CP Fasten',170000,'https://drive.google.com/file/d/1i0sK0sgOAQLeTbTvna-4j9agznGEzifX/view?usp=sharing');
INSERT INTO product(SupplierID, ProductTypeID, ProductName, Price, IMG_URL) VALUES(8,6,'Quần áo bóng đá CP Fasten',490000,'https://drive.google.com/file/d/17E6WMTRQNKg3A1x6Opin0AXcqZpKnYaK/view?usp=sharing');
INSERT INTO product(SupplierID, ProductTypeID, ProductName, Price, IMG_URL) VALUES(8,6,'Quần áo bóng đá CP Fasten',490000,'https://drive.google.com/file/d/1KqAgXWT-hrtBR7GT2iedLOSw2fTHFbQz/view?usp=sharing');
INSERT INTO product(SupplierID, ProductTypeID, ProductName, Price, IMG_URL) VALUES(8,6,'Quần áo bóng đá CP Fasten',490000,'https://drive.google.com/file/d/178NU-qW_ulyjHqFgj70lwuXWSku9NdE4/view?usp=sharing');
INSERT INTO product(SupplierID, ProductTypeID, ProductName, Price, IMG_URL) VALUES(8,6,'Quần áo bóng đá CP Fasten',490000,'https://drive.google.com/file/d/13dUMP5Xe4chQa_TzLONPx-9Z468hm0rs/view?usp=sharing');
INSERT INTO product(SupplierID, ProductTypeID, ProductName, Price, IMG_URL) VALUES(8,6,'Quần áo bóng đá CP Fasten',490000,'https://drive.google.com/file/d/1brMP2EC4yGbHj5sQvu12aSSuGU9IJDsX/view?usp=sharing');
INSERT INTO product(SupplierID, ProductTypeID, ProductName, Price, IMG_URL) VALUES(9,8,'Túi đựng giày 2 ngăn X',99000,'https://drive.google.com/file/d/1nUzAukjJTQh_hQmpYoeFJLMuPrUTf1Fz/view?usp=sharing');
INSERT INTO product(SupplierID, ProductTypeID, ProductName, Price, IMG_URL) VALUES(9,8,'Túi đựng giày 2 ngăn X',99000,'https://drive.google.com/file/d/1DbQRG6ySY851s_p_xx-ZBWjwYQJZgnZr/view?usp=sharing');
INSERT INTO product(SupplierID, ProductTypeID, ProductName, Price, IMG_URL) VALUES(9,8,'Túi rút thể thao FLASH',119000,'https://drive.google.com/file/d/13MCwol7Sa1V3VVWFVJBJ9x5SmKatJ1Mx/view?usp=sharing');
INSERT INTO product(SupplierID, ProductTypeID, ProductName, Price, IMG_URL) VALUES(9,8,'Túi rút thể thao FLASH',119000,'https://drive.google.com/file/d/11qnZd8Lwzp58mrci9tFYiXtMVmsmKSgz/view?usp=sharing');
INSERT INTO product(SupplierID, ProductTypeID, ProductName, Price, IMG_URL) VALUES(9,8,'Túi rút thể thao FLASH',119000,'https://drive.google.com/file/d/1ElJR_wvSjybdmPbPVyUUuO5-hKfG11Rs/view?usp=sharing');

/*Procedure tạo user, account, address, cart*/
DELIMITER $$
CREATE PROCEDURE CreateUser(IN name_ nvarchar(50), IN mail varchar(40), IN birth date, IN gender int, IN address nvarchar(60), IN pass varchar(20))
BEGIN
	DECLARE userid_tmp INT DEFAULT 0;
	INSERT INTO User(UserName, UserMail, UserBirthdate, UserGender, UserAddress)  VALUES(name_, mail, birth, gender, address);
    
    SELECT UserID INTO userid_tmp 
    FROM User
    WHERE UserName = name_ AND UserMail = mail;
    INSERT INTO account VALUES(mail, pass, userid_tmp, 0, CURDATE(), 0);
    
    INSERT INTO address(AccountID, DiaChi) VALUES(mail, address);
    
    INSERT INTO cart(AccountID, CartCapacity, CartTotal) VALUES(mail, 0, 0);
END; $$
DELIMITER ;
call CreateUser('Le Ngo Quoc Tuan', 'tuanle@gmail.com', '1999-5-12', 1, 'Biên Hòa, Đồng Nai', '12345');