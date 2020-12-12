Create table Shipping (
Ship_ID int not null auto_increment,
Tracking_number int,
Shipping_date date,
Shipping_company varchar(18),
Address_ID int,
primary key (Ship_ID),
foreign key (Address_ID) references Address (Address_ID) on delete no action on update no action);


insert into Shipping (Tracking_number, Shipping_date, Shipping_company, Address_ID) values ('AA12345', 20190105, 'UPS', 1);
insert into Shipping (Tracking_number, Shipping_date, Shipping_company, Address_ID) values ('BB98765', 20190123, 'FedEx', 2);
insert into shipping (Tracking_number, Shipping_date, Shipping_company, Address_ID) values ('AA45678', 20190207, 'UPS', 3 );


Create table Orders (
Order_ID int not null auto_increment,
Customer_ID int not null,
Guitar_ID int not null, 
Payment_ID int not null,
primary key (Order_ID),
foreign key (Customer_ID) references Customer (Customer_ID) on delete no action on update cascade,
foreign key (Guitar_ID) references Guitars (Guitar_ID) on delete no action on update no action,
foreign key (Payment_ID) references Payments (Payment_ID) on delete no action on update cascade);


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

insert into Payments (Payment_Type, Payment_number, Verification_code, Expiration_ID) values ('Debit', 1234567890, 638, 20240819);
insert into Payments (Payment_Type, Payment_number, Verification_code, Expiration_ID) values ('Credit', 5679430342, 721, 20221104);
insert into Payments (Payment_Type, Payment_Number, Verification_code, Expiration_ID) values ('Debit', 3795429082, 590, 20210312);
