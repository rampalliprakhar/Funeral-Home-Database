# SQL Script for Funeral Home
# Prakhar Rampalli, Bhakti Patel

#Creating Database

CREATE DATABASE FuneralHome;  

#Using FuneralHome database for querying

USE FuneralHome; 

#Creating Tables

CREATE TABLE Family(  
  Informant varchar(30),
  Headquarter varchar(30),
  HQ_telephone varchar(30),
  Father varchar(30),
  Mother varchar(30),
  Husband varchar(30),
  Wife varchar(30),
  CallNO varchar(5),
  PRIMARY KEY (CallNO)
 );

CREATE TABLE Family_Brother(  
CallNo varchar(5),
BrotherName varchar(30),
FOREIGN KEY (CallNo) REFERENCES Family(CallNo)
);

CREATE TABLE Family_Sister( 
CallNo varchar(5),
SisterName varchar(30),
FOREIGN KEY (CallNo) REFERENCES Family(CallNo)
);

CREATE TABLE Family_Son( 
CallNo varchar(5),
SonName varchar(30),
FOREIGN KEY (CallNo) REFERENCES Family(CallNo)
);

CREATE TABLE Family_Daughter( 
CallNo varchar(5),
DaughterName varchar(30),
FOREIGN KEY (CallNo) REFERENCES Family(CallNo)
);

CREATE TABLE Family_GrandChild( 
CallNo varchar(5),
GrandChildName varchar(30),
FOREIGN KEY (CallNo) REFERENCES Family(CallNo)
);


CREATE Table Service( 
 CallNo varchar(40),
 Name varchar(40),
 open_close varchar(10),
 assistant varchar(40),
 florist_charge double(10,2),
 place_church varchar(40),
 priest varchar(40),
 no_certi_ordered integer(10),
 no_certi integer(10),
 memorial varchar(40),
 place varchar(40),
 Date DATE,
 Time TIME,
 Interment varchar(40),
 PRIMARY KEY(CallNo) 
);

CREATE Table AllPrices( 
 CategoryID Integer(100),
 Category varchar(50),
 Price double(10,2),
 Category_Type varchar(50),
PRIMARY KEY (CategoryID) 
);

CREATE Table Service_Price(
CallNo varchar(40),
CategoryID Integer(100),
FOREIGN KEY (CallNo) REFERENCES Service(CallNo),
FOREIGN KEY(CategoryID) REFERENCES AllPrices(CategoryID)
);



CREATE Table Musician( 
CallNo  Varchar (30),
Piano varchar(30),
Solo varchar(30),
Organ varchar(30),
FOREIGN KEY (CallNo) REFERENCES Service(CallNo)
);


CREATE Table Newspaper( 
 Newspaper varchar(40),
 CallNo varchar(40),
 FOREIGN KEY(CallNo) REFERENCES Service(CallNo)
);

CREATE Table PallBearers(
 PallBearer varchar(40),
 CallNo varchar(40),
 FOREIGN KEY(CallNo) REFERENCES Service(CallNo)
);


CREATE TABLE deceased( 
CallNo varchar (30),
Date_Death Date,
Date_Service Date,
inCityLimit boolean,
place_death varchar(30),
SSN varchar(9),
PRIMARY KEY (CallNo)
);

CREATE TABLE info_deceased(
SSN varchar (9),
DOB DATE,
sex varchar (6),
residence varchar (30),
zip integer (5),
county varchar (20),
birthplace varchar(25),
club varchar (30),
occupation varchar(20),
church_member boolean,
education varchar(30),
business varchar(30),
isVeteran boolean,
School varchar(30),
CallNo varchar(30),
PRIMARY KEY (SSN),
FOREIGN KEY (CallNo) REFERENCES Deceased(CallNo)
);

#Inserting values

#FOR CHARGES A:

INSERT INTO AllPrices (Category, Category_Type, Price)
VALUES ('Basic_services', 'A', 1895.00),
('Embalming', 'A', 825.00),
('other_prep', 'A', 240.00),
 ('view_FH', 'A', 390.00),
 ('ceremony_FH', 'A', 795.00),
('ceremony_other', 'A', 795.00),
('memorial_FH', 'A', 715.00),
('memorial_other', 'A', 715.00),
 ('equipment_service', 'A', 685.00),
('equipment_memorial', 'A', 625.00),
('tents', 'A', 180.00),
('tranfer_remains', 'A', 355.00),
('hearse', 'A', 360.00),
('limousine', 'A', 295.00),
 ('family_car', 'A', 220.00),
 ('utility_van', 'A', 190.00),
('equipments_carried_home', 'A', 45.00),
 ('open/close', 'A', 775.00),
('cemetery_equipment', 'A', 680.00),
 ('acknowledgement_cards', 'A', 10.00),
 ('register_book', 'A', 40.00),
('food_register', 'A', 5.00),
('graveMarker', 'A', 45.00),
 ('clothing', 'A', 140.00),
('forwardRemains_FH', 'A', 2290.00),
('receiveRemain_FH', 'A', 1780.00),
('directCremation_containerByPurchaser', 'A', 2535.00),
('directCremation_container', 'A', 2595.00),
('burial_casketByPurchaser', 'A', 2710.00),
 ('burial_casketCloth', 'A', 3705.00);

#FOR CHARGES B:

INSERT INTO AllPrices (Category, Category_Type, Price)
VALUES ('bronze_container', 'B', 3780.00),
('copper_container', 'B', 3395.00),
('SS_container', 'B', 2510.00),
('decorative_container', 'B', 1905.00),
('midgrade_container', 'B', 1740.00),
('basic_container', 'B', 1630.00),
 ('unlinedSeal_container', 'B', 1525.00),
('concrete_container', 'B', 1195.00),
('weatherwood_casket', 'B', 4685.00),
 ('langleyPine_casket', 'B', 3980.00),
 ('taupe_casket', 'B', 3790.00),
 ('floral_casket', 'B', 3475.00),
('veteran_casket', 'B', 3375.00),
('pacficBeige_casket', 'B', 3290.00),
('indigoBlue_casket', 'B', 3230.00),
 ('ebony_casket', 'B', 3190.00),
('kristen_casket', 'B', 2970.00),
('silverEdge_casket', 'B', 2850.00),
('morningMist_casket', 'B', 2790.00),
('silverland_casket', 'B', 2850.00),
('neoBlue_casket', 'B', 2680.00),
('newSilver_casket', 'B', 2585.00),
('variety_casket', 'B', 2515.00),
 ('benjamin_casket', 'B', 2190.00),
('ashley_casket', 'B', 1975.00),
 ('buckley_casket', 'B', 1330.00),
('rental_casket', 'B', 895.00),
('alternative_casket', 'B', 75.00);


#Dummy values for table service

INSERT INTO Service (CallNo, Name, open_close, assistant, florist_charge, place_church, priest, no_certi_ordered, no_certi, memorial, place, Date, Time, Interment)
VALUES 
('1234', 'John Smith', 'open', 'Mary Jones', 250.00, 'St. Mary\'s Church', 'Father Michael', 3, 3, 'In loving memory', 'Greenwood Cemetery', '2023-04-30', '10:00:00', 'Greenwood Cemetery'),
('5678', 'Jane Doe', 'closed', 'Bob Johnson', 150.00, 'Sacred Heart Church', 'Father John', 2, 2, 'Forever in our hearts', 'Oak Hill Cemetery', '2023-05-01', '14:00:00', 'Oak Hill Cemetery'),
('9101', 'David Lee', 'open', 'Susan Kim', 175.00, 'Grace Lutheran Church', 'Pastor James', 1, 1, 'Rest in peace', 'Forest Lawn Cemetery', '2023-05-02', '11:00:00', 'Forest Lawn Cemetery'),
('1111', 'Alice Brown', 'open', 'John Smith', 200.00, 'St. Mark\'s Church', 'Father Andrew', 2, 2, 'In loving memory', 'Greenwood Cemetery', '2023-05-10', '11:00:00', 'Greenwood Cemetery'),
('2222', 'Bob Green', 'closed', 'Mary Johnson', 150.00, 'Sacred Heart Church', 'Father John', 3, 3, 'Forever in our hearts', 'Oak Hill Cemetery', '2023-05-11', '14:00:00', 'Oak Hill Cemetery'),
('3333', 'Chris Lee', 'open', 'Susan Kim', 175.00, 'Grace Lutheran Church', 'Pastor James', 1, 1, 'Rest in peace', 'Forest Lawn Cemetery', '2023-05-12', '11:00:00', 'Forest Lawn Cemetery'),
('4444', 'David Davis', 'open', 'Emily White', 250.00, 'St. Paul\'s Church', 'Father Michael', 2, 2, 'In loving memory', 'Greenwood Cemetery', '2023-05-13', '10:00:00', 'Greenwood Cemetery'),
('5555', 'Emily Taylor', 'closed', 'Alex Brown', 150.00, 'Sacred Heart Church', 'Father John', 1, 1, 'Forever in our hearts', 'Oak Hill Cemetery', '2023-05-14', '14:00:00', 'Oak Hill Cemetery'),
('6666', 'Frank Brown', 'open', 'Maria Garcia', 175.00, 'Grace Lutheran Church', 'Pastor James', 2, 2, 'Rest in peace', 'Forest Lawn Cemetery', '2023-05-15', '11:00:00', 'Forest Lawn Cemetery'),
('7777', 'Grace Green', 'open', 'John Kim', 200.00, 'St. Mark\'s Church', 'Father Andrew', 3, 3, 'In loving memory', 'Greenwood Cemetery', '2023-05-16', '11:00:00', 'Greenwood Cemetery'),
('8888', 'Henry Lee', 'closed', 'Mary Davis', 150.00, 'Sacred Heart Church', 'Father John', 2, 2, 'Forever in our hearts', 'Oak Hill Cemetery', '2023-05-17', '14:00:00', 'Oak Hill Cemetery'),
('9999', 'Isabel Taylor', 'open', 'Alex Brown', 175.00, 'Grace Lutheran Church', 'Pastor James', 1, 1, 'Rest in peace', 'Forest Lawn Cemetery', '2023-05-18', '11:00:00', 'Forest Lawn Cemetery'),
('1010', 'Jack Brown', 'open', 'Emily White', 250.00, 'St. Paul\'s Church', 'Father Michael', 2, 2, 'In loving memory', 'Greenwood Cemetery', '2023-05-19', '10:00:00', 'Greenwood Cemetery');



#Dummy values for table deceased

INSERT INTO deceased (CallNo, Date_Death, Date_Service, inCityLimit, place_death, SSN) 
VALUES ('1234', '2023-04-01', '2023-04-10', 1, 'Hospital', '123456789'),
       ('5678', '2023-04-02', '2023-04-11', 0, 'Nursing Home', '234567890'),
       ('9101', '2023-04-03', '2023-04-12', 1, 'Home', '345678901'),
       ('1111', '2023-04-04', '2023-04-13', 1, 'Hospital', '456789012'),
       ('2222', '2023-04-05', '2023-04-14', 0, 'Nursing Home', '567890123'),
       ('3333', '2023-04-06', '2023-04-15', 1, 'Home', '678901234'),
       ('4444', '2023-04-07', '2023-04-16', 1, 'Hospital', '789012345'),
       ('5555', '2023-04-08', '2023-04-17', 0, 'Nursing Home', '890123456'),
       ('6666', '2023-04-09', '2023-04-18', 1, 'Home', '901234567'),
       ('7777', '2023-04-10', '2023-04-19', 1, 'Hospital', '012345678'),
       ('8888', '2023-04-11', '2023-04-20', 0, 'Nursing Home', '123456789'),
       ('9999', '2023-04-12', '2023-04-21', 1, 'Home', '234567890'),
       ('1010', '2023-04-13', '2023-04-22', 1, 'Hospital', '345678901');

#Dummy values for table info_deceased

INSERT INTO info_deceased (SSN, DOB, sex, residence, zip, county, birthplace, club, occupation, church_member, education, business, isVeteran, School, CallNo)
VALUES 
('123456789', '1960-01-01', 'M', '123 Main St', '12345', 'Anytown', 'USA', 'Rotary Club', 'Engineer', true, 'Bachelor Degree', 'Software Developer', true, 'University of Anytown', '1234'),
('234567890', '1955-05-05', 'F', '456 Elm St', '23456', 'Othertown', 'USA', 'Lions Club', 'Teacher', true, 'Bachelor Degree', 'High School Teacher', false, 'State University', '5678'),
('345678901', '1970-10-10', 'M', '789 Oak St', '34567', 'Anycity', 'USA', 'Kiwanis Club', 'Doctor', true, 'Medical Degree', 'Pediatrician', true, 'Medical School', '9101'),
('456789012', '1960-01-01', 'M', '123 Main St', '12345', 'Anytown', 'USA', 'Rotary Club', 'Engineer', true, 'Bachelor Degree', 'Software Developer', true, 'University of Anytown', '1111'),
('567890123', '1955-05-05', 'F', '456 Elm St', '23456', 'Othertown', 'USA', 'Lions Club', 'Teacher', true, 'Bachelor Degree', 'High School Teacher', false, 'State University', '2222'),
('678901234', '1970-10-10', 'M', '789 Oak St', '34567', 'Anycity', 'USA', 'Kiwanis Club', 'Doctor', true, 'Medical Degree', 'Pediatrician', true, 'Medical School', '3333'),
('789012345', '1960-01-01', 'M', '123 Main St', '12345', 'Anytown', 'USA', 'Rotary Club', 'Engineer', true, 'Bachelor Degree', 'Software Developer', true, 'University of Anytown', '4444'),
('890123456', '1955-05-05', 'F', '456 Elm St', '23456', 'Othertown', 'USA', 'Lions Club', 'Teacher', true, 'Bachelor Degree', 'High School Teacher', false, 'State University', '5555'),
('901234567', '1970-10-10', 'M', '789 Oak St', '34567', 'Anycity', 'USA', 'Kiwanis Club', 'Doctor', true, 'Medical Degree', 'Pediatrician', true, 'Medical School', '6666'),
('012345678', '1960-01-01', 'M', '123 Main St', '12345', 'Anytown', 'USA', 'Rotary Club', 'Engineer', true, 'Bachelor Degree', 'Software Developer', true, 'University of Anytown', '7777'),
('112233445', '1960-01-01', 'M', '123 Main St', '12345', 'Anytown', 'USA', 'Rotary Club', 'Engineer', true, 'Bachelor Degree', 'Software Developer', true, 'University of Anytown', '8888'),
('223344556', '1960-01-01', 'M', '123 Main St', '12345', 'Anytown', 'USA', 'Rotary Club', 'Engineer', true, 'Bachelor Degree', 'Software Developer', true, 'University of Anytown', '9999'),
('334455667', '1960-01-01', 'M', '123 Main St', '12345', 'Anytown', 'USA', 'Rotary Club', 'Engineer', true, 'Bachelor Degree', 'Software Developer', true, 'University of Anytown', '1010');

#Dummy values for table family

INSERT INTO Family (Informant, Headquarter, HQ_telephone, Father, Mother, Husband, Wife, CallNO)
VALUES
('John Smith', 'ABC Funeral Home', '555-1234', 'James Brown', 'Mary Brown', NULL, 'Jane Brown', '1234'),
('Sarah Lee', 'XYZ Funeral Home', '555-5678', 'David Lee', 'Helen Lee', 'Tom Lee', NULL, '5678'),
('Jessica Williams', '564 Funeral Home', '555-2345', 'Robert Williams', 'Karen Williams', 'Steve Williams', NULL, '9101'),
('Michael Chen', 'ABC Funeral Home', '555-1234', 'Frank Chen', 'Grace Chen', 'Bill Chen', NULL, '1111'),
('Emily Davis', 'ERT Funeral Home', '555-5678', 'John Davis', 'Nancy Davis', 'Alex Davis', NULL, '2222'),
('David Johnson', '123 Funeral Home', '555-2345', 'Peter Johnson', 'Cathy Johnson', NULL, 'Laura Johnson', '3333'),
('Jennifer Brown', 'QWE Funeral Home', '555-1234', 'Mark Brown', 'Linda Brown', NULL, 'Amy Brown', '4444'),
('Christopher Garcia', 'XYZ Funeral Home', '555-5678', 'Jose Garcia', 'Maria Garcia', 'Paul Garcia', NULL, '5555'),
('Ashley Wilson', '123 Funeral Home', '555-2345', 'Brian Wilson', 'Tina Wilson', NULL, 'Julia Wilson', '6666'),
('Daniel Davis', 'RZU Funeral Home', '555-1234', 'Adam Davis', 'Rachel Davis', 'Sean Davis', NULL, '7777'),
('Elizabeth Lee', 'XYZ Funeral Home', '555-5678', 'Richard Lee', 'Cindy Lee', NULL, 'Lucy Lee', '8888'),
('Joshua Martinez', '123 Funeral Home', '555-2345', 'Juan Martinez', 'Sofia Martinez', 'Chris Martinez', NULL, '9999'),
('Samantha Miller', 'ABC Funeral Home', '555-1234', 'Michael Miller', 'Michelle Miller', NULL, 'Nicole Miller', '1010');


#Dummy values for table family_brother

INSERT INTO family_brother (CallNo, BrotherName) VALUES
('1234', 'John Smith'),
('1234', 'Michael Smith'),
('1234', 'David Smith'),
('3333', 'Robert Johnson'),
('3333', 'Steven Johnson');

#Dummy values for table family_sister

INSERT INTO family_sister (CallNo, SisterName) VALUES
('7777', 'Emily Davis'),
('1111', 'Jessica Chen'),
('1234', 'Sarah Smith'),
('9999', 'Jennifer Martinez'),
('3333', 'Laura Johnson');

#Dummy values for table family_son

INSERT INTO family_son (CallNo, SonName) VALUES
('1234', 'William Smith'),
('8888', 'Joshua Lee'),
('9101', 'Daniel Williams'),
('5678', 'Matthew Lee'),
('4444', 'James Brown');


#Dummy values for table family_daughter

INSERT INTO family_daughter (CallNo, DaughterName) VALUES
('6666', 'Elizabeth Wilson'),
('1234', 'Hannah Smith'),
('5678', 'Olivia Lee'),
('1010', 'Emma Miller'),
('4444', 'Sophia Brown');


#Dummy values for table family_grandchildren

INSERT INTO family_grandchild (CallNo, GrandChildName) VALUES
('6666', 'Aiden Wilson'),
('4444', 'Grace Brown'),
('2222', 'Ethan Davis'),
('1234', 'Madison Smith'),
('5678', 'Chloe Lee');

#Dummy values for table PallBearers

INSERT INTO PallBearers (PallBearer, CallNo) VALUES 
('Peter Clark', '1234'),
('Mike Johnson', '5678'),
('Andrew Miller', '9101'),
('Sarah Wilson', '1111'),
('Amy Davis', '2222'),
('Emily Moore', '3333'),
('Robert Taylor', '4444'),
('James Brown', '5555'),
('Katie Wilson', '6666'),
('John Smith', '7777'),
('Karen Jones', '8888'),
('David Lee', '9999'),
('Rachel Green', '1010');

#Dummy values for table newspaper


INSERT INTO Newspaper (Newspaper, CallNo) VALUES
('The Times', '1234'),
('The Daily Telegraph', '5678'),
('The Guardian', '9101'),
('The Sun', '1111'),
('The Mirror', '2222'),
('The Independent', '3333'),
('The New York Times', '4444'),
('The Wall Street Journal', '5555'),
('USA Today', '6666'),
('The Washington Post', '7777'),
('The Boston Globe', '8888'),
('The Chicago Tribune', '9999'),
('The Los Angeles Times', '1010');


#Dummy values for table musician

INSERT INTO Musician (CallNo, Piano, Solo, Organ)
VALUES 
('1234', null, null, 'Mike Johnson'),
('5678', null, 'Lisa Hernandez', 'Maria Rodriguez'),
('9101', 'Adam Thompson', 'Jessica Kim', 'James Park'),
('1111', 'Rachel Kim', 'Daniel Lee', null),
('2222', null, 'Karen Davis', null),
('3333', 'Chris Wong', null, 'Ashley Johnson'),
('4444', null, 'Tom Rodriguez', 'Tony Kim'),
('5555', 'Jenny Kim', 'Timothy Chen', 'Samantha Lee'),
('6666', null, 'Erica Park', 'Kevin Smith'),
('7777', 'Christine Kim', 'Andrew Johnson', 'Steve Davis'),
('8888', 'Michael Kim', null, 'Brian Park'),
('9999', 'Julia Park', 'David Kim', null),
('1010', null, 'Emily Kim', 'Karen Wong');


#Dummy values for table servicePrice


INSERT INTO Service_Price (CallNo, CategoryID)
VALUES ('1234', 1),
       ('1234', 2),
       ('1234', 4),
       ('1234', 10),
       ('1234', 3),
       ('5678', 1),
       ('5678', 2),
       ('5678', 3),
       ('9101', 4),
       ('9101', 1),
       ('9101', 2),
       ('9101', 3),
       ('9101', 4),
       ('1111', 5),
       ('1111', 1),
       ('1111', 6),
       ('2222', 1),
       ('2222', 5),
       ('3333', 1),
       ('3333', 2),
       ('3333', 6),
       ('3333', 8),
       ('3333', 10),
       ('4444', 1),
       ('4444', 2),
       ('4444', 5),
       ('4444', 6),
       ('4444', 10),
       ('5555', 1),
       ('5555', 4),
       ('5555', 7),
       ('6666', 8),
       ('6666', 1),
       ('6666', 6),
       ('6666', 4),
       ('7777', 1),
       ('7777', 8),
       ('8888', 1),
       ('8888', 9),
       ('8888', 14),
       ('8888', 7),
       ('8888', 2),
       ('9999', 1),
       ('9999', 3),
       ('9999', 6),
       ('9999', 9),
       ('1010', 9),
       ('1010', 13),
       ('1010', 1),
       ('1010', 5);
