CREATE SCHEMA homework_5;
USE homework_5;

DROP TABLE IF EXISTS Cars;
CREATE TABLE Cars
(
id INT PRIMARY KEY AUTO_INCREMENT,
name VARCHAR(20),
cost INT
);

INSERT Cars (name, cost) VALUES
("Audi", 52642),
("Mercedes", 57127),
("Skoda", 9000),
("Volvo", 29000),
("Bentley", 350000),
("Citroen", 210000),
("Hummer", 41400),
("Volkswagen", 21600);

SELECT * FROM Cars;

-- 1 (1)
CREATE OR REPLACE VIEW cheapCars AS
SELECT id, name, cost FROM Cars 
WHERE Cars.cost <= 25000;
SELECT * FROM cheapCars;

-- 2
ALTER VIEW cheapCars AS
SELECT id, name, cost FROM Cars
WHERE Cars.cost <= 30000;
SELECT * FROM cheapCars;

-- 3
CREATE OR REPLACE VIEW marks AS
SELECT id, name, cost FROM Cars
WHERE name = "Skoda" OR name = "Audi";
SELECT * FROM marks;

-- ---------------------------------------------------- --

DROP TABLE IF EXISTS Analysis;
CREATE TABLE Analysis
(
	an_id INT PRIMARY KEY AUTO_INCREMENT NOT NULL UNIQUE,
    an_name VARCHAR(20),
    an_cost VARCHAR(20),
    an_price INT,
    an_group VARCHAR(20)
);

INSERT Analysis (an_name, an_cost, an_price, an_group) VALUES
("first", 2000, 5000, "First group"),
("second", 1000, 3000, "Second group"),
("third", 500, 3000, "Third group"),
("fourth", 8000, 15000, "Fourth grouo");

DROP TABLE IF EXISTS GroupsA;
CREATE TABLE GroupsA
(
	gr_id INT,
    gr_name VARCHAR(30),
    gr_temp INT
);

INSERT GroupsA VALUES
(200, "First group", 20),
(300, "Second group", 22),
(400, "third group", 30),
(500, "fourth grouo", 40),
(600, "Fifth group", -100);

DROP TABLE IF EXISTS Orders;
CREATE TABLE Orders
(
	ord_id INT PRIMARY KEY AUTO_INCREMENT,
    ord_datetime DATE,
    ord_an INT,
    FOREIGN KEY (ord_an) REFERENCES Analysis (an_id)
);

INSERT Orders (ord_datetime, ord_an) VALUES
("2020-03-01", 1),
("2020-05-02", 2),
("2020-07-02", 3),
("2020-09-02", 4);

SELECT * FROM Analysis;
SELECT * FROM GroupsA;
SELECT * FROM Orders;

-- --------------------------------------------------- --

DROP VIEW IF EXISTS viewResult;
CREATE VIEW viewResult AS
SELECT an_name, an_price FROM Analysis, Orders 
WHERE ord_datetime BETWEEN "2020-05-02" AND "2020-12-02";
SELECT * FROM viewResult;

-- --------------------------------------------------- --

DROP TABLE IF EXISTS trains;
CREATE TABLE trains(
	id INT,
    station VARCHARACTER(20),
    station_time TIME);
    
INSERT trains VALUES
(110, "San Francisco", "10:00:00"),
(110, "Redwood City", "10:54:00"),
(110, "Palo Alto", "11:02:00"),
(110, "San Jose", "12:35:00"),
(120, "San Francisco", "11:00:00"),
(120, "Palo Alto", "12:49:00"),
(120, "San Jose", "13:30:00");

SELECT * FROM trains;

SELECT *,
LEAD(station_time, 1, 'следующего отправления нет') OVER (PARTITION BY id ORDER BY station_time) AS end_station,
TIMEDIFF(LEAD(station_time, 1, 'следующего отправления нет') OVER (PARTITION BY id ORDER BY station_time), station_time) AS 'time to the next tation'
FROM trains;

