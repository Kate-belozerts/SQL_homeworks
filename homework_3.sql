CREATE SCHEMA homework_3;
USE homework_3;

-- table #1
DROP TABLE IF EXISTS sales_people;
CREATE TABLE sales_people(
	snum INT NOT NULL,
    sname VARCHARACTER(10),
    city VARCHAR(20),
    comm VARCHAR(3)
);

INSERT INTO sales_people VALUES
	(1001, "Peel", "London", ".12"),
    (1002, "Serres", "San Jose", ".13"),
    (1004, "Motika", "London", ".11"),
    (1007, "Rifkin", "Barcelona", ".15"),
	(1007, "Rifkin", "Barcelona", ".15"),
    (1003, "Axelrod", "New York", ".10");

-- table #2
DROP TABLE IF EXISTS customers;

CREATE TABLE customers(
	cnum INT PRIMARY KEY NOT NULL,
    cname VARCHARACTER(10),
    city VARCHAR(20),
    rating INT,
    snum INT
);

INSERT INTO customers VALUES
	(2001, "Hoffman", "London", 100, 1001),
    (2002, "Giovanni", "Rome", 200, 1003),
    (2003, "Liu", "SanJose", 200, 1002),
    (2004, "Grass", "Berlin", 300, 1002),
    (2006, "Clemens", "London", 100, 1001),
    (2008, "Cisneros", "SanJose", 300, 1007),
    (2007, "Pereira", "Rome", 100, 1004);

-- table #3
DROP TABLE IF EXISTS orders;
CREATE TABLE orders(
	onum INT PRIMARY KEY NOT NULL,
    amt FLOAT,
    odate VARCHAR(20),
    cnum INT,
    snum INT
);

INSERT INTO orders VALUES
	(3001, 18.69, "10/03/1990", 2008, 1007),
    (3003, 767.19, "10/03/1990", 2001, 1001),
    (3002, 1900.10, "10/03/1990", 2007, 1004),
    (3005, 5160.45, "10/03/1990", 2003, 1002),
    (3006, 1098.16, "10/03/1990", 2008, 1007),
    (3009, 1713.23, "10/04/1990", 2002, 1003),
    (3007, 75.75, "10/04/1990", 2004, 1002),
    (3008, 4723.00, "10/05/1990", 2006, 1001),
    (3010, 1309.95, "10/06/1990", 2004, 1002),
    (3011, 9891.88, "10/06/1990", 2006, 1001);

-- table #4
DROP TABLE IF EXISTS stuff;
CREATE TABLE stuff (
id INT AUTO_INCREMENT PRIMARY KEY,
firstname VARCHAR(45),
lastname VARCHAR(45),
post VARCHAR(100),
seniority INT,
salary INT,
age INT
);

INSERT INTO stuff (firstname, lastname, post, seniority, salary, age)
VALUES
('Вася', 'Петров', 'Начальник', '40', 100000, 60),
('Петр', 'Власов', 'Начальник', '8', 70000, 30),
('Катя', 'Катина', 'Инженер', '2', 70000, 25),
('Саша', 'Сасин', 'Инженер', '12', 50000, 35),
('Иван', 'Иванов', 'Рабочий', '40', 30000, 59),
('Петр', 'Петров', 'Рабочий', '20', 25000, 40),
('Сидр', 'Сидоров', 'Рабочий', '10', 20000, 35),
('Антон', 'Антонов', 'Рабочий', '8', 19000, 28),
('Юрий', 'Юрков', 'Рабочий', '5', 15000, 25),
('Максим', 'Максимов', 'Рабочий', '2', 11000, 22),
('Юрий', 'Галкин', 'Рабочий', '3', 12000, 24),
('Людмила', 'Маркина', 'Уборщик', '10', 10000, 49);


SELECT * FROM sales_people;
SELECT * FROM customers;
SELECT * FROM orders;
SELECT * FROM staff;

-- 1
SELECT city, sname, snum, comm FROM sales_people;

-- 2
SELECT cname, rating FROM customers WHERE city = "SanJose";

-- 3 Сделала дубликат snum=1007
SELECT DISTINCT snum, sname FROM sales_people;

-- 4
SELECT * FROM customers
WHERE cname LIKE 'G%';

-- 5
SELECT * FROM orders
WHERE amt >=1000;

-- 6
SELECT MIN(amt) FROM orders;

-- 7
SELECT cname FROM customers
WHERE rating > 100 AND city != "Rome";

-- 8 (1) ЗП по убыванию
SELECT * FROM stuff
ORDER BY salary DESC;

-- 8 (2) ЗП по возрастанию
SELECT * FROM stuff
ORDER BY salary ASC;

-- 9 **
SELECT * FROM stuff
ORDER BY salary ASC LIMIT 9, 3;

-- 10
SELECT post, SUM(salary) AS res FROM stuff
GROUP BY post
HAVING res > 100000;
