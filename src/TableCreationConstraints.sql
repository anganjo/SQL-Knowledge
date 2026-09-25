-- 1. Employees Table
USE company_db;
CREATE TABLE employees (
    id INT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    position VARCHAR(100) NOT NULL,
    department VARCHAR(100) NOT NULL,
    salary DECIMAL(10, 2) NOT NULL
);

-- 2. Customers Table
CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(100) NOT NULL,
    city VARCHAR(100) NOT NULL
);

-- 3. Products / Inventories Table
CREATE TABLE inventories (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(100) NOT NULL,
    quantity INT NOT NULL,
    price DECIMAL(10, 2) NOT NULL
);

-- 4. Orders Table
CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    order_date DATE NOT NULL,
    customer_id INT NOT NULL,
    total_amount DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

-- 5. Sales / Order Items Table (Relates orders to products)
CREATE TABLE sales (
    order_id INT,
    customer_id INT,
    product_id INT,
    quantity INT NOT NULL,
    sale_date DATE NOT NULL,
    PRIMARY KEY (order_id, product_id),
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id),
    FOREIGN KEY (product_id) REFERENCES inventories(product_id)
);

-- ====================
-- DUMMY DATA INSERT SCRIPTS
-- ====================
INSERT INTO customers (customer_id, customer_name, city) VALUES
(101, 'Acme Corp', 'Kuala Lumpur'),
(102, 'Beta Ltd', 'Penang'),
(103, 'Gamma Inc', 'Johor Bahru'),
(104, 'Global Tech NYC', 'New York');

INSERT INTO orders (order_id, order_date, customer_id, total_amount) VALUES
(501, '2026-09-01', 101, 3580.00),
(502, '2026-09-02', 102, 250.00),
(503, '2026-09-03', 103, 160.00),
(504, '2026-09-04', 104, 1250.00);

-- Insert into employees
INSERT INTO employees (id, name, position, department, salary) VALUES
(1, 'Alice Tan', 'Manager', 'Sales', 6500.00),
(2, 'Bob Lee', 'Counter Staff', 'Operations', 3500.00),
(3, 'Charlie Wong', 'Technician', 'Support', 4000.00);

-- Insert into inventories (Products)
INSERT INTO inventories (product_id, product_name, quantity, price) VALUES
(201, 'Laptop', 15, 3500.00),
(202, 'Wireless Mouse', 50, 80.00),
(203, 'Mechanical Keyboard', 30, 250.00);

-- Insert into sales (Order Items)
INSERT INTO sales (order_id, customer_id, product_id, quantity, sale_date) VALUES
(501, 101, 201, 1, '2026-09-01'),
(501, 101, 202, 1, '2026-09-01'),
(502, 102, 203, 1, '2026-09-02'),
(503, 103, 202, 2, '2026-09-03'),
(504, 104, 201, 1, '2026-09-04');