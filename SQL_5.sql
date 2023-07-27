CREATE DATABASE IF NOT EXISTS homework_05;
USE homework_05;

CREATE TABLE IF NOT EXISTS cars
(
  id INT NOT NULL PRIMARY KEY,
    name VARCHAR(45),
    cost INT
);

INSERT cars
VALUES
  (1, "Audi", 52642),
    (2, "Mercedes", 57127 ),
    (3, "Skoda", 9000 ),
    (4, "Volvo", 29000),
  (5, "Bentley", 350000),
    (6, "Citroen ", 21000 ), 
    (7, "Hummer", 41400), 
    (8, "Volkswagen ", 21600);
    
SELECT *
FROM cars;
DROP VIEW CheapCars;
-- Создайте представление, в которое попадут автомобили стоимостью до 25 000 долларов 
CREATE VIEW CheapCars AS 
SELECT name,cost 
FROM cars 
WHERE cost<25000;
SELECT*
FROM CheapCars;
-- Изменить в существующем представлении порог для стоимости: пусть цена будет до 30 000 долларов (используя оператор ALTER VIEW)
ALTER VIEW CheapCars AS 
SELECT name,cost 
FROM cars
WHERE cost<30000;
SELECT*
FROM CheapCars;

DROP TABLE IF EXISTS Analysis;

CREATE TABLE Analysis
(
  an_id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
  an_name varchar(50),
  an_cost INT,
  an_price INT,
  an_group INT
);

INSERT INTO analysis (an_name, an_cost, an_price, an_group)
VALUES 
  ('Общий анализ крови', 30, 50, 1),
  ('Биохимия крови', 150, 210, 1),
  ('Анализ крови на глюкозу', 110, 130, 1),
  ('Общий анализ мочи', 25, 40, 2),
  ('Общий анализ кала', 35, 50, 2),
  ('Общий анализ мочи', 25, 40, 2),
  ('Тест на COVID-19', 160, 210, 3);

DROP TABLE IF EXISTS GroupsAn;

CREATE TABLE GroupsAn
(
  gr_id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
  gr_name varchar(50),
  gr_temp FLOAT(5,1),
  FOREIGN KEY (gr_id) REFERENCES Analysis (an_id)
  ON DELETE CASCADE ON UPDATE CASCADE
);

INSERT INTO groupsan (gr_name, gr_temp)
VALUES 
  ('Анализы крови', -12.2),
  ('Общие анализы', -20.0),
  ('ПЦР-диагностика', -20.5);

SELECT * FROM groupsan;

DROP TABLE IF EXISTS Orders;
CREATE TABLE Orders
(
  ord_id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
  ord_datetime DATETIME,  -- 'YYYY-MM-DD hh:mm:ss'
  ord_an INT,
  FOREIGN KEY (ord_an) REFERENCES Analysis (an_id)
  ON DELETE CASCADE ON UPDATE CASCADE
);

INSERT INTO Orders (ord_datetime, ord_an)
VALUES 
  ('2020-02-04 07:15:25', 1),
  ('2020-02-04 07:20:50', 2),
  ('2020-02-04 07:30:04', 1),
  ('2020-02-04 07:40:57', 1),
  ('2020-02-05 07:05:14', 1),
  ('2020-02-05 07:15:15', 3),
  ('2020-02-05 07:30:49', 3),
  ('2020-02-06 07:10:10', 2),
  ('2020-02-06 07:20:38', 2),
  ('2020-02-07 07:05:09', 1),
  ('2020-02-07 07:10:54', 1),
  ('2020-02-07 07:15:25', 1),
  ('2020-02-08 07:05:44', 1),
  ('2020-02-08 07:10:39', 2),
  ('2020-02-08 07:20:36', 1),
  ('2020-02-08 07:25:26', 3),
  ('2020-02-09 07:05:06', 1),
  ('2020-02-09 07:10:34', 1),
  ('2020-02-09 07:20:19', 2),
  ('2020-02-10 07:05:55', 3),
  ('2020-02-10 07:15:08', 3),
  ('2020-02-10 07:25:07', 1),
  ('2020-02-11 07:05:33', 1),
  ('2020-02-11 07:10:32', 2),
  ('2020-02-11 07:20:17', 3),
  ('2020-02-12 07:05:36', 1),
  ('2020-02-12 07:10:54', 2),
  ('2020-02-12 07:20:19', 3),
  ('2020-02-12 07:35:38', 1);

-- Создайте представление, в котором будут только автомобили марки “Шкода” и “Ауди” (аналогично)
SELECT*
FROM cars;
DROP VIEW CheapCars;
CREATE VIEW CheapCars AS 
SELECT * 
FROM cars 
WHERE name in ("Skoda",'Audi');
SELECT*
FROM CheapCars;
/*Вывести название и цену для всех анализов, которые продавались 5 февраля 2020 и всю следующую неделю. 
Есть таблица анализов Analysis: an_id — ID анализа; an_name — название анализа; 
an_cost — себестоимость анализа; an_price — розничная цена анализа; an_group — группа анализов. 
Есть таблица групп анализов Groups: gr_id — ID группы; gr_name — название группы; 
gr_temp — температурный режим хранения. Есть таблица заказов Orders: ord_id — ID заказа; 
ord_datetime — дата и время заказа; ord_an — ID анализа*/
SELECT*
FROM Analysis;
DROP VIEW new_table;
CREATE VIEW new_table AS
SELECT an_name,an_price,orders.ord_datetime
FROM analysis
JOIN orders
ON analysis.an_id=orders.ord_an
WHERE orders.ord_datetime > '2020-02-05 00:00:00' and orders.ord_datetime < '2020-02-12 00:00:00';
SELECT*
FROM new_table;