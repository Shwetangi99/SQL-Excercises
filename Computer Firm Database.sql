--CREATING DATABASE FOR A COMPUTER FIRM BEFORE PROCEEDING TO FURTHER ANALYSIS
CREATE DATABASE computer_firm
USE computer_firm

--CREATING TABLE FOR THE LIST OF PRODUCTS AVAILABLE
CREATE TABLE product (
maker VARCHAR(10),
model VARCHAR (50) UNIQUE,
type VARCHAR (50)
)

INSERT INTO product (maker, model, type)
VALUES
('A','1232','PC'),
('A','1233','PC'),
('A','1276','Printer'),
('A','1298','Laptop'),
('A','1401','Printer'),
('A','1408','Printer'),
('A','1752','Laptop'),
('B','1121','PC'),
('B','1750','Laptop'),
('C','1321','Laptop'),
('D','1288','Printer'),
('D','1433','Printer'),
('E','1260','PC'),
('E','1434','Printer'),
('E','2112','PC'),
('E','2113','PC')

--CHECKING THE TABLE
SELECT * FROM product

--CREATING TABLE FOR LAPTOPS:
CREATE TABLE laptop(
code INT UNIQUE,
model VARCHAR(50) FOREIGN KEY REFERENCES product(model),
speed SMALLINT,
ram SMALLINT,
hd REAL,
price MONEY,
screen TINYINT)

INSERT INTO laptop (code, model, speed, ram, hd, price, screen)
VALUES
(1,'1298',350,	32	,4.0,	700.0000,	11),
(2,'1321',500,	64	,8.0,	970.0000,	12),
(3,'1750',750,	128	,12.0,1200.0000	,14),
(4,'1298',600,	64	,10.0,1050.0000	,15),
(5,'1752',750,	128	,10.0,1150.0000	,14),
(6,'1298',450,	64	,10.0,950.0000	,12)

SELECT * FROM laptop

--CREATING TABLE FOR PCs:
CREATE TABLE pc(
code INT UNIQUE,
model VARCHAR(50) FOREIGN KEY REFERENCES product(model),
speed SMALLINT,
ram SMALLINT,
hd REAL,
cd VARCHAR(10),
price MONEY NULL)
 
INSERT INTO pc(code, model, speed, ram, hd, cd, price)
VALUES
(1	,'1232',	500,	64	,5.0,'12x',600.0000),
(10	,'1260',	500,	32	,10.0,'12x',350.0000),
(11	,'1233',	900,	128	,40.0,'40x',980.0000),
(12	,'1233',	800,	128	,20.0,'50x',970.0000),
(2	,'1121',	750,	128	,14.0,'40x',850.0000),
(3	,'1233',	500,	64	,5.0,'12x',600.0000),
(4	,'1121',	600,	128	,14.0,'40x',850.0000),
(5	,'1121',	600,	128	,8.0,'40x',850.0000),
(6	,'1233',	750,	128	,20.0,'50x',950.0000),
(7	,'1232',	500,	32	,10.0,'12x',400.0000),
(8	,'1232',	450,	64	,8.0,'24x',350.0000),
(9	,'1232',	450,	32	,10.0,'24x',350.0000)

SELECT * FROM pc

--CREATING TABLE FOR PRINTERS:
CREATE TABLE printer(
code INT UNIQUE,
model VARCHAR(50) FOREIGN KEY REFERENCES product(model),
color CHAR(1),
type VARCHAR(10),
price MONEY)

INSERT INTO printer(code, model, color, type, price)
VALUES
(1,	'1276',	'n',	'Laser'	,400.0000),
(2,	'1433',	'y',	'Jet'	,270.0000),
(3,	'1434',	'y',	'Jet'	,290.0000),
(4,	'1401',	'n',	'Matrix'	,150.0000),
(5,	'1408',	'n',	'Matrix'	,270.0000),
(6,	'1288',	'n',	'Laser'	,400.0000)

SELECT * FROM printer