SELECT * FROM customer WHERE country LIKE ('Canada'); --1
SELECT DISTINCT country FROM customer; --2
SELECT count(*) AS orders_quantity FROM orders; --3
SELECT MAX(total_amount) FROM orders; --4
SELECT SUM(total_amount) FROM orders; --5
SELECT SUM(total_amount) FROM orders WHERE order_date BETWEEN '20140101' AND '20141231'; --6
SELECT AVG(total_amount) FROM orders; --7
SELECT AVG(total_amount) AS avg_of_total_amount, first_name FROM orders
                                                                     LEFT JOIN customer ON orders.customer_id = customer.id GROUP BY customer.first_name; --8
SELECT * FROM customer WHERE country IN ('Brazil', 'Spain'); --9
SELECT * FROM orders WHERE order_date BETWEEN '20130101' AND '20141231' AND total_amount < 100; --10
SELECT * FROM customer WHERE country IN ('Spain', 'Italy', 'Germany', 'France') ORDER BY country; --11
SELECT DISTINCT customer.first_name, customer.last_name, customer.country, supplier.country FROM customer,
                                                                                                 supplier WHERE  customer.country= supplier.country ORDER BY customer.first_name; --12
SELECT *FROM customer WHERE first_name LIKE 'Jo%'; --13
SELECT *FROM customer WHERE first_name LIKE '%a' GROUP BY customer.id HAVING LENGTH(first_name) = 4; --14
SELECT country, COUNT(*) AS quantity_of_customers FROM customer GROUP BY country ORDER BY COUNT(*); --15
SELECT country, COUNT(*) AS quantity_of_customers FROM customer GROUP BY country ORDER BY COUNT(*) DESC; --16
SELECT SUM(total_amount) AS sum_of_total_amount, customer_id, COUNT(*)
                         AS all_customer_id FROM orders GROUP BY orders.customer_id
ORDER BY sum_of_total_amount; --17
SELECT SUM(total_amount) AS sum_of_total_amount, customer_id, COUNT(*)
                         AS all_customer_id FROM orders GROUP BY orders.customer_id
HAVING COUNT(customer_id) >= 20; --18