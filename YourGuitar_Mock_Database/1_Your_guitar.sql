create database Your_guitar;
use Your_guitar;

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
    
Create table Shipping (
	Ship_ID int not null auto_increment,
	Tracking_number int,
	Shipping_date date,
	Shipping_company varchar(18),
	Address_ID int,
	primary key (Ship_ID),
	foreign key (Address_ID) references Address (Address_ID) on delete no action on update no action);
    
Create table Payments (
Payment_ID int not null auto_increment,
Payment_Type SET ('Debit','Credit'),
Payment_Number int(10),
Verification_code int(3),
Expiration_ID date,
Address_ID int not null,
Customer_id int not null,
primary key (Payment_ID),
foreign key (Address_ID) references Address (Address_ID) on delete no action on update cascade,
foreign key (Customer_ID) references Customer (Customer_ID) on delete no action on update cascade);    


create table Guitar_Body (
	Body_ID int not null auto_increment,
	Body_Shape SET('S-Type', 'T-Type', 'LP-Type'),
	Body_Wood SET('Ash','Mahogany'),
	Sup_ID INT Not Null,
	primary key(Body_ID),
	foreign key (Sup_ID) references Suppliers (Sup_ID) ON DELETE NO ACTION on update cascade);
    
create table Neck (
	Neck_ID int not null auto_increment,
	Neck_Wood SET('Mahogany','Maple','Roasted Maple'),
	Headstock_Format SET('3+3', '6 Inline'),
	Sup_ID INT Not Null,
	primary key(Neck_ID),
	foreign key (Sup_ID) references Suppliers(Sup_ID) ON DELETE NO ACTION on update cascade);
    

create table Finishes (
	finish_id int not null auto_increment, 
	finish_color varchar(20)not null,
	finish_type set('Gloss','Satin'),
	sup_id int not null,
	primary key (finish_id), 
	foreign key (Sup_ID) references Suppliers(Sup_ID) ON DELETE NO ACTION on update cascade);
    
create table Bridge (
	bridge_id int not null auto_increment,
	bridge_type set('Fixed Bridge','Gotoh Tremolo'),
	bridge_color set('Chrome','Black','Gold'),
	sup_id int not null,
	primary key (bridge_id),
	foreign key (Sup_ID) references Suppliers(Sup_ID) ON DELETE NO ACTION on update cascade);

    
create table Tuner (
	tuner_id int not null auto_increment,
	tuner_type set ('Standard','Locking'),
	tuner_color set ('Chrome','Black','Gold'),
	sup_id int not null,
	primary key (tuner_id),
	foreign key (Sup_ID) references Suppliers(Sup_ID) ON DELETE NO ACTION on update cascade);


create table Fingerboard (
	finger_id int not null auto_increment,
	finger_wood set('Rosewood','Maple','Ebony'),
	inlay_type set('Black Dots', 'Pearl Dots', 'Pearl Trapezoid'),
	sup_id int not null,
	primary key (finger_id),
	foreign key (Sup_ID) references Suppliers(Sup_ID) ON DELETE NO ACTION on update cascade);


create table Pickup ( 
	pickup_id int not null auto_increment,
	pickup_name set('DiMarzio','Seymour Duncan','EMG'), 
	pickup_color set('Black','White','Cream'),
	pickup_style set('Single','Humbucker'),
	sup_id int not null,
	primary key (pickup_id),
	foreign key (Sup_ID) references Suppliers(Sup_ID) ON DELETE NO ACTION on update cascade);
    
Create table Guitars (
Guitar_ID int not null auto_increment,
Finish_ID int not null,
Body_ID int not null, 
Neck_ID int not null, 
Finger_ID int not null, 
Pickup_ID int not null, 
Tuner_ID int not null, 
Bridge_ID int not null,
primary key (Guitar_ID),
foreign key (Finish_ID) references Finishes (Finish_ID) on delete no action on update cascade,
foreign key (Body_ID) references Guitar_Body (Body_ID) on delete no action on update cascade,
foreign key (Neck_ID) references Neck (Neck_ID) on delete no action on update cascade,
foreign key (Finger_ID) references Fingerboard (Finger_ID) on delete no action on update cascade,
foreign key (Pickup_ID) references Pickup (Pickup_ID) on delete no action on update cascade,
foreign key (Tuner_ID) references Tuner (Tuner_ID) on delete no action on update cascade,
foreign key (Bridge_ID) references Bridge (Bridge_ID) on delete no action on update cascade);

Create table Orders (
Order_ID int not null auto_increment,
Customer_ID int not null,
Guitar_ID int not null, 
Payment_ID int not null,
primary key (Order_ID),
foreign key (Customer_ID) references Customer (Customer_ID) on delete no action on update cascade,
foreign key (Guitar_ID) references Guitars (Guitar_ID) on delete no action on update no action,
foreign key (Payment_ID) references Payments (Payment_ID) on delete no action on update cascade);

insert into Customer (First_Name, Last_Name, Email, Phone) values ('Christian' , 'Klaszky', 'CJK0729@mail.com', '1234567890');
insert into Customer (First_Name, Last_Name, Email, Phone) values ('Sebastien' , 'Desir', 'SebMan@mail.com', '234567890');
insert into Customer (First_Name, Last_Name, Email, Phone) values ('Angel' , 'Sanchez', 'AngelSan@mail.com', '125487');
