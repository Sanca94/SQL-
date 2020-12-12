create database Your_guitar
use your_guitar
create table Finishes (
finish_id int not null auto_increment, 
finish_color varchar(20)not null,
finish_type set('Gloss','Satin'),
sup_id int not null,
primary key (finish_id),
foreign key (sup_id) references Suppliers (sup_id) ON DELETE NO ACTION ON UPDATE CASCADE);


create table Bridge (
bridge_id int not null auto_increment,
bridge_type set('Fixed Bridge','Gotoh Tremolo'),
bridge_color set('Chrome','Black','Gold'),
sup_id int not null,
primary key (bridge_id),
foreign key (sup_id) references Suppliers (sup_id) ON DELETE NO ACTION ON UPDATE CASCADE);


create table Tuner (
tuner_id int not null auto_increment,
tuner_type set ('Standard','Locking'),
tuner_color set ('Chrome','Black','Gold'),
sup_id int not null,
primary key (tuner_id), 
foreign key (sup_id) references Suppliers (sup_id) ON DELETE NO ACTION ON UPDATE CASCADE);


create table Fingerboard (
finger_id int not null auto_increment,
finger_wood set('Rosewood','Maple','Ebony'),
inlay_type set('Black Dots', 'Pearl Dots', 'Pearl Trapezoid'),
sup_id int not null,
primary key (finger_id),
foreign key(sup_id) references Suppliers (sup_id) ON DELETE NO ACTION ON UPDATE CASCADE);


create table Pickup ( 
pickup_id int not null auto_increment,
pickup_name set('DiMarzio','Seymour Duncan','EMG'), 
pickup_color set('Black','White','Cream'),
pickup_style set('Single','Humbucker'),
sup_id int not null,
primary key (finger_id),
foreign key (sup_id) references Suppliers (sup_id) ON DELETE NO ACTION ON UPDATE CASCADE);

