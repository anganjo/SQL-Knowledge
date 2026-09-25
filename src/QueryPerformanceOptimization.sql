USE company_db;

CREATE INDEX idx_department_salary ON employees (department, salary);