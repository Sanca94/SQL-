create database Your_guitar;
USE Your_guitar;

create table Address (
	Address_ID int not null auto_increment,
	Address_1 VARCHAR(20) NOT NULL,
	Address_2 VARCHAR(10),
	City VARCHAR(20) NOT NULL,
	St CHAR(2) NOT NULL,
	Zip INT(5) NOT NULL,
	primary key (Address_ID));

create table customer (
	Customer_ID int not null auto_increment,
	Email VARCHAR(20) NOT NULL,
	Phone INT(10) NOT NULL,
	First_Name VARCHAR(20) NOT NULL,
	Last_Name VARCHAR(20) NOT NULL,
	Address_ID INT,  
	primary key(customer_ID),
	foreign key (Address_ID) references Address (Address_ID) ON DELETE NO ACTION on update cascade);
    
create table Suppliers (
	Sup_ID int not null auto_increment,
	Sup_Name VARCHAR(20) NOT NULL,
	Website VARCHAR(20),
	Email VARCHAR(20) NOT NULL,
	Address_ID INT Not Null,
	primary key(Sup_ID),
	foreign key (Address_ID) references Address (Address_ID) ON DELETE NO ACTION on update cascade);
    
create table Guitar_Body (
	Body_ID int not null auto_increment,
	Body_Shape SET('S-Type', 'T-Type', 'LP-Type'),
	Body_Wood SET('Ash','Mahogany'),
	Sup_ID INT Not Null,
	primary key(Body_ID),
	foreign key (Sup_ID) references Suppliers(Sup_ID) ON DELETE NO ACTION on update cascade);
    
create table Neck (
	Neck_ID int not null auto_increment,
	Neck_Wood SET('Mahogany','Maple','Roasted Maple'),
	Headstock_Format SET('3+3', '6 Inline'),
	Sup_ID INT Not Null,
	primary key(Neck_ID),
	foreign key (Sup_ID) references Suppliers(Sup_ID) ON DELETE NO ACTION on update cascade);



Insert INTO Address (Address_1, Address_2, City, St,Zip)
Values ('3474 Coco Lake Dr.', '--', 'Coconut Creek', 'FL', '33037');

Insert INTO Address (Address_1, Address_2, City, St, Zip)
Values ('3474 Coco Lake Dr.', '--', 'Coconut Creek', 'FL', '33037');

Insert INTO customer (Email, Phone, First_Name, Last_Name)
Values ('sanca94@gmail.com', 954518331 , 'Angel', 'Sanchez');
    

    
    
show tables;

describe Address;

SELECT * FROM Address;

#Drop database Your_guitar;


    

