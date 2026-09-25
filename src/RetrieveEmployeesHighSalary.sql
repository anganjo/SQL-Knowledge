USE company_db;

SELECT 
    name, 
    position
FROM employees
WHERE salary > 50000.00;

SELECT 
    name, 
    position, 
    salary
FROM employees
ORDER BY salary DESC
LIMIT 3;