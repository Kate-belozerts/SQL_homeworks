CREATE SCHEMA homework_2;
USE homework_2;
-- 1
CREATE TABLE sales
(
	id INT PRIMARY KEY AUTO_INCREMENT UNIQUE,
    order_date DATE,
    count_product INT
);

INSERT sales
VALUES
	(1, "2022-01-01", 156),
    (2, "2022-01-02", 180),
    (3, "2022-01-03", 21),
    (4, "2022-01-04", 124),
    (5, "2022-01-05", 341);

SELECT * FROM sales;

SELECT id,
	CASE 
		WHEN count_product < 100 THEN "Маленький заказ"
        WHEN count_product BETWEEN 100 AND 300 THEN "Средний заказ"
        WHEN count_product > 300 THEN "Большой заказ"
	END AS 'Тип заказа'
FROM sales;

CREATE TABLE orders
(
	id SERIAL,
    employee_id VARCHAR(3),
    amount DECIMAL,
    order_status VARCHAR(10)
);

INSERT orders
VALUES
(1, "e03", 15.00, "OPEN"),
(2, "e01", 25.50, "OPEN"),
(3, "e05", 100.70, "CLOSED"),
(4, "e02", 22.18, "OPEN"),
(5, "e04", 9.50, "CANCELLED");

SELECT * FROM orders;

SELECT *,
CASE
	WHEN order_status = 'OPEN' THEN "Oreder is in open state"
    WHEN order_status = 'CLOSED' THEN "Order is closed"
    WHEN order_status = 'CANCELLED' THEN "Order is cancelled"
END AS 'full_order status'
FROM orders;