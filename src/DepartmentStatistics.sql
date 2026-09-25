USE company_db;

SELECT 
    department, 
    AVG(salary) AS average_salary
FROM employees
GROUP BY department;

SELECT 
    e.department,
    e.name AS employee_name,
    e.salary AS highest_salary
FROM employees e
JOIN (
    SELECT department, MAX(salary) AS max_salary
    FROM employees
    GROUP BY department
) m ON e.department = m.department AND e.salary = m.max_salary;