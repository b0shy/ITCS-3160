DROP DATABASE prints;
CREATE DATABASE prints;

USE prints;

CREATE TABLE customers(
	customer_id CHAR(255) PRIMARY KEY,
    customer_name CHAR(255),
    customer_add CHAR(255),
    customer_city CHAR(255),
    customer_state CHAR(255),
    customer_zip CHAR(255),
    customer_phone CHAR(255)
);

CREATE TABLE items(
	item_id CHAR(255) PRIMARY KEY,
    Title CHAR(255),
	artist CHAR(255),
    unit_price CHAR(255),
    on_hand CHAR(255)
);

CREATE TABLE orders(
	order_id CHAR(255) PRIMARY KEY,
    customer_id CHAR(255),
    order_date CHAR(255),
    ship_date CHAR(255)
);

CREATE TABLE orderline(
	order_id CHAR(255),
    item_id CHAR(255),
    order_qty CHAR(255)
);

INSERT INTO customers
VALUES
('1000', 'Cora Blanca', '1555 Seminole Ct.', 'Charlotte', 'NC', '28210', '704/552.1810'),
('1100', 'Yash Reed', '878 Madison Ave.', 'Greensboro', 'NC', '27407', '336/316-5434'),
('1200', 'John Mills', '4200 Olive Ave.', 'Columbia', 'SC', '29206', '803/432.6225'),
('1300', 'David Cox', '608 Old Post Rd.', 'Decatur', 'GA', '30030', '404/243.7379'),
('1400', 'Tina Evans', '235 Easton Ave.', 'Jacksonville', 'FL', '32221', '904/992-7234'),
('1500', 'Will Allen', '2508 W. Shaw Rd.', 'Raleigh', 'NC', '27542', '919/809.2545'),
('1600', 'James Boyd', '200 Pembury Ln.', 'Columbia', 'SC', '29206', '803/432-7600'),
('1700', 'Will Parsons', '4990 S. Pine St.', 'Raleigh', 'NC', '27545', '919/355/0034'),
('1800', 'Walter Kelly', '1200 Little St.', 'Columbia', 'SC', '29206', '803/432-1987'),
('1900', 'Ann Damian', '7822 N. Ridge Rd.', 'Jacksonville', 'FL', '32216', '904/725-4672'),
('2000', 'Grace Hull', '4090 Caldweld St.', 'Charlotte', 'NC', '28205', '704/365.7655'),
('2100', 'Jane Brown', '3320 W. Main St.', 'Charlotte', 'NC', '28210', '704/372/9000'),
('2200', 'Betty Draper', '1600 Sardis Rd.', 'Sarasota', 'FL', '32441', '918/941-9121');

INSERT INTO items
VALUES
('100', 'Under the Sun', 'Donald Arley', '46.80', '340'),
('200', 'Dark Lady', 'Keith Morris', '120.99', '250'),
('300', 'Happy Days', 'Andrea Reid', '78.00', '210'),
('350', 'Top of the Mountain', 'Janice Jones', '110.00', '290'),
('400', 'Streets from Old', 'Sharon Brune', '123.00', '320'),
('450', 'The Hunt', 'Walter Alford', '39.99', '390'),
('600', 'Rainbow Row', 'Judy Ford', '46.00', '350'),
('700', 'Skies Above', 'Alexander Wilson', '98.00', '275'),
('800', 'The Seas and Moon', 'Susan Beeler', '67.81', '235'),
('850', 'Greek Isles', 'Benjamin Caudle', '76.00', '300');

INSERT INTO orders
VALUES
('1', '1200', '2013-10-23', '2013-10-28'),
('2', '1500', '2013-10-30', '2013-11-03'),
('3', '1500', '2013-11-09', '2013-11-14'),
('4', '2100', '2013-11-15', '2013-11-20'),
('5', '1600', '2013-11-15', '2013-11-20'),
('6', '1900', '2013-12-15', '2013-12-19'),
('7', '2200', '2013-12-18', '2013-12-22'),
('8', '1600', '2013-12-20', '2013-12-22'),
('9', '1000', '2014-01-18', '2014-01-23'),
('10', '2200', '2014-01-31', '2014-02-04'),
('11', '1500', '2014-02-01', '2014-02-06'),
('12', '1400', ',2014-02-27', '2014-03-02'),
('13', '1100', '2014-03-10', '2014-03-15'),
('14', '1400', '2014-03-14', '2014-03-19');

INSERT INTO orderline
VALUES
('1', '800', '2'),
('1', '600', '1'),
('2', '700', '3'),
('2', '300', '2'),
('3', '850', '1'),
('4', '200', '4'),
('4', '100', '1'),
('4', '850', '1'),
('5', '450', '1'),
('6', '800', '2'),
('7', '300', '2'),
('7', '600', '2'),
('8', '100', '1'),
('9', '100', '3'),
('10', '450', '6'),
('10', '600', '8'),
('10', '200', '4'),
('11', '700', '2'),
('12', '300', '3'),
('12', '700', '4'),
('13', '200', '2'),
('13', '600', '10'),
('13', '450', '4'),
('14', '700', '8'),
('14', '200', '6'),
('14', '800', '4'),
('14', '450', '2');

SELECT customer_name, customer_add, customer_city, customer_state, customer_zip FROM customers;

SELECT customer_name, customer_phone FROM customers WHERE customer_state = 'GA';

SELECT customer_name, customer_zip FROM customers WHERE customer_state = 'NC' OR customer_state = 'SC';

SELECT title, artist, order_date, ship_date FROM items,orders,orderline WHERE orders.order_id = orderline.order_id AND items.item_id = orderline.item_id;

SELECT * FROM items ORDER BY unit_price DESC;

SELECT * FROM items WHERE unit_price > 100.00;

SELECT * FROM items WHERE on_hand > 300;

SELECT title, unit_price, unit_price * 2 AS retail_price FROM items;

SELECT c.customer_name, c.customer_phone FROM customers c LEFT OUTER JOIN orders o ON c.customer_id = o.order_id WHERE YEAR(o.ORDER_DATE) = '2014';

SELECT title, order_qty FROM items,orderline WHERE items.item_id = orderline.item_id;

SELECT title FROM items WHERE unit_price BETWEEN 40 AND 100;

Select customer_name, Title, artist, sum(order_qty) from customers left outer join orders on customers.customer_id = orders.customer_id join orderline on orders.order_id = orderline.order_id join items on orderline.item_id = items.item_id group by items.artist order by items.artist;

SELECT customer_name, sum(unit_price * 2) AS total_revenue FROM customers join orders on customers.customer_id = orders.customer_id join orderline on orders.order_id = orderline.order_id join items on orderline.item_id = items.item_id group by customer_name;

SELECT customer_state, COUNT(DISTINCT customer_name) AS number_of_customers FROM customers GROUP BY customer_state;

CREATE VIEW Under_100 AS
SELECT items.item_id, title, artist, unit_price, order_qty FROM items, orderline WHERE items.item_id = orderline.item_id AND unit_price < 100.00;

CREATE VIEW Allen AS
SELECT customers.customer_id, customer_name, customer_phone, title, artist FROM customers, items, orderline, orders WHERE customers.customer_id = orders.customer_id AND orders.order_id = orderline.order_id AND orderline.item_id = items.item_id;

CREATE VIEW orders AS
SELECT items.item_id, title, artist, unit_price, order_qty FROM items JOIN orderline ON items.item_id = orderline.item_id JOIN orders ON orders.order_id = orderline.order_id WHERE orders.order_date between '2014-01-01' and '2014-02-28';

CREATE VIEW zip_27 AS
SELECT customers.customer_name, customer_phone, title, artist, ship_date FROM customers, items, orders, orderline WHERE customers.customer_id = orders.customer_id AND orders.order_id = orderline.order_id AND orderline.item_id = items.item_id AND customer_zip LIKE '27%';

CREATE INDEX customer_id ON customers (customer_id);

CREATE INDEX name ON customers (customer_name);

CREATE INDEX shipped ON orders (customer_id , ship_date);

DROP INDEX name ON customers;

ALTER TABLE items ADD CHECK (unit_price > 35.00);

ALTER TABLE orders ADD FOREIGN KEY (customer_id) REFERENCES customers(customer_id);

ALTER TABLE orderline ADD FOREIGN KEY (item_id) REFERENCES items(item_id);

ALTER TABLE items ADD type CHAR(1);

UPDATE items SET type = 'M' WHERE Title = 'Skies Above';

ALTER TABLE items MODIFY COLUMN artist CHARACTER(30);

/*DROP TABLE orders*/