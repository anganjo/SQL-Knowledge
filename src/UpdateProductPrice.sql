USE company_db;

UPDATE inventories
SET price = 3750.00
WHERE product_id = 201;

UPDATE inventories
SET price = price * 1.10;