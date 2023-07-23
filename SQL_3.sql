CREATE DATABASE IF NOT EXISTS home_work_03;
USE home_work_03;
CREATE DATABASE homework_database_003;
USE homework_database_003;

CREATE TABLE orders(
    onum INT UNSIGNED NOT NULL,
    amt FLOAT,
    odate DATE,
    cnum INT UNSIGNED,
    snum INT UNSIGNED
);
CREATE TABLE customers(
	cnum INT UNSIGNED,
    cname VARCHAR(20),
    city VARCHAR(20),
    rating INT UNSIGNED,
    snum INT UNSIGNED
);
CREATE TABLE salespeople(
	snum INT UNSIGNED,
    sname VARCHAR(20),
    city VARCHAR(20),
    comm FLOAT
);
INSERT INTO salespeople (snum, sname, city, comm) 
VALUES 
(1001, 'Peel', 'London', 0.12),
(1002, 'Serres', 'San Jose', 0.13),
(1004, 'Motika', 'London',0.11),
(1007, 'Rifkin', 'Barcelona', 0.15),
(1003, 'Axelrod', 'New York', 0.10);

INSERT INTO orders (onum, amt, odate, cnum, snum) 
VALUES 
(3001, 20.00, '2016-01-01', 2001, 1007),
(3002, 767.00, '2016-01-25', 2001, 1001),
(3003, 1900.00, '2016-01-01', 2007, 1004),
(3004, 5160.00, '2016-01-16', 2004, 1002),
(3005, 75.00, '2016-01-23', 2004, 1001),
(3006, 1098.16, '2016-02-17', 2008, 1007),
(3010, 2012.16, '2016-02-11', 2004, 1002);

INSERT INTO customers (cnum, cname, city, rating, snum) 
VALUES 
(2001, 'Hoffman', 'London', 100, 1001),
(2002, 'Giovanni', 'Roma', 200, 1003),
(2003, 'Lin', 'San Jose', 200, 1002),
(2004, 'Grass', 'Berlin', 300, 1002),
(2006, 'Clemens', 'London', 100, 1001),
(2008, 'Cisneros', 'San Jose', 300, 1007),
(2007, 'Pereira', 'Roma', 100, 1004);


-- Напишите запрос, который сосчитал бы все суммы заказов, выполненных 1 января 2016 года.
SELECT SUM(amt)
FROM orders
WHERE odate = '2016-01-01'; 

CREATE TABLE emploies(
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NULL,
    surname VARCHAR(100) NULL,
    speciality VARCHAR(100) NULL,
    seniority INT NULL,
    salary INT NULL,
    age INT NULL
);

INSERT emploies(name, surname, speciality, seniority, salary, age)
VALUES
    ('Вася', 'Васькин', 'начальник', 40, 100000, 60),
    ('Петя', 'Петькин', 'начальник', 8, 70000, 30),
    ('Катя', 'Катькина', 'инженер', 2, 73000, 25),
    ('Иван', 'Ванькин', 'инженер', 12, 50000, 35),
    ('Егор', 'Егоркин', 'рабочий', 40, 40000, 59),
    ('Сергей', 'Серенькин', 'инженер', 12, 50000, 35),
    ('Маша', 'Машкина', 'рабочий', 40, 15000, 59);

-- Напишите запрос, который сосчитал бы число различных, отличных от NULL значений поля city в таблице заказчиков.
SELECT COUNT(DISTINCT city) as count 
FROM customers
WHERE city IS NOT NULL;

-- Напишите запрос, который выбрал бы наименьшую сумму для каждого заказчика.
SELECT cnum, MIN(amt) as min
FROM  orders 
GROUP BY cnum;

-- Напишите запрос, который бы выбирал заказчиков чьи имена начинаются с буквы Г. Используется оператор "LIKE"
SELECT *
FROM customers
WHERE cname LIKE "G%";

--  Напишите запрос, который выбрал бы высший рейтинг в каждом городе.
SELECT city, MAX(rating)
FROM customers 
GROUP BY city;

-- Отсортируйте поле “seniority” в порядке убывания и возрастания
SELECT *
FROM emploies
ORDER BY seniority;

-- Отсортируйте по возрастанию поле “Зарплата” и выведите 5 строк с наибольшей заработной платой
SELECT *
FROM emploies
ORDER BY salary
LIMIT 2,5;

-- Выполните группировку всех сотрудников по специальности “рабочий”, зарплата которых превышает 20000
SELECT *
FROM emploies
WHERE speciality='рабочий' AND salary>20000
ORDER BY id;