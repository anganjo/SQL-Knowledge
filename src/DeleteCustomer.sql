USE company_db;

DELETE FROM customers 
WHERE customer_id = 104;

START TRANSACTION;

-- 1. Delete related sales/order items linked to the customer's orders
DELETE s FROM sales s
JOIN orders o ON s.order_id = o.order_id
WHERE o.customer_id = 104;

-- 2. Delete related orders placed by the customer
DELETE FROM orders 
WHERE customer_id = 104;

-- 3. Finally, delete the customer record safely
DELETE FROM customers 
WHERE customer_id = 104;

COMMIT;