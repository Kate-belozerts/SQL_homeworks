# task 1 
USE homework_1;

SELECT name, manufacturer, price FROM phones
WHERE count >= 2;

# task 2
SELECT * FROM phones
WHERE manufacturer = 'Samsung';

# task 3 *!
SELECT * FROM phones
WHERE manufacturer LIKE '%iPhone%';

SELECT * FROM phones
WHERE manufacturer LIKE '%Samsung%';

SELECT * FROM phones
WHERE name LIKE '%13%';

SELECT * FROM phones
where name RLIKE '[0-9]';