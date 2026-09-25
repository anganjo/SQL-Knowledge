WITH OrderQuantities AS (
    SELECT order_id, SUM(quantity) AS total_qty
    FROM sales
    GROUP BY order_id
)
SELECT 
    (SELECT SUM(quantity) FROM sales) AS total_quantity_sold,
    AVG(total_qty) AS avg_quantity_per_order
FROM OrderQuantities;

WITH OrderStats AS (
    SELECT o.order_id, SUM(s.quantity) AS total_qty, o.total_amount
    FROM orders o
    JOIN sales s ON o.order_id = s.order_id
    GROUP BY o.order_id, o.total_amount
)
SELECT 
    SUM(total_qty) AS total_quantity_sold,
    AVG(total_qty) AS avg_quantity_per_order,
    SUM(total_amount) AS total_sales_amount,
    AVG(total_amount) AS avg_sales_amount_per_order
FROM OrderStats;