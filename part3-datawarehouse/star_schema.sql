-- Part 3.1: Star Schema Design
DROP DATABASE IF EXISTS retail_dw;
CREATE DATABASE retail_dw;
USE retail_dw;

-- CREATING DIMENSION TABLES

CREATE TABLE dim_dates (
    date_key INT PRIMARY KEY,
    full_date DATE,
    month INT,
    year INT,
    quarter INT
);

CREATE TABLE dim_stores (
    store_id INT PRIMARY KEY AUTO_INCREMENT,
    store_name VARCHAR(100),
    store_city VARCHAR(100)
);

CREATE TABLE dim_products (
    product_id INT PRIMARY KEY AUTO_INCREMENT,
    product_name VARCHAR(100),
    category VARCHAR(50)
);

CREATE TABLE dim_customers (
    customer_id INT PRIMARY KEY AUTO_INCREMENT,
    customer_code VARCHAR(20) UNIQUE
);

CREATE TABLE fact_sales (
    sales_id INT PRIMARY KEY AUTO_INCREMENT,
    date_key INT,
    store_id INT,
    product_id INT,
    customer_id INT,
    units_sold INT,
    unit_price DECIMAL(10,2),
    total_revenue DECIMAL(15,2),
    FOREIGN KEY (date_key) REFERENCES dim_dates(date_key),
    FOREIGN KEY (store_id) REFERENCES dim_stores(store_id),
    FOREIGN KEY (product_id) REFERENCES dim_products(product_id),
    FOREIGN KEY (customer_id) REFERENCES dim_customers(customer_id)
);

-- INSERTING CLEANED DATA

INSERT INTO dim_dates (date_key, full_date, month, year, quarter) VALUES 
(20231127, '2023-11-27', 11, 2023, 4),
(20230120, '2023-01-20', 1, 2023, 1),
(20230406, '2023-04-06', 4, 2023, 2),
(20231018, '2023-10-18', 10, 2023, 4),
(20230926, '2023-09-26', 9, 2023, 3),
(20230409, '2023-04-09', 4, 2023, 2),
(20230108, '2023-01-08', 1, 2023, 1),
(20231109, '2023-11-09', 11, 2023, 4),
(20230725, '2023-07-25', 7, 2023, 3),
(20230104, '2023-01-04', 1, 2023, 1),
(20231026, '2023-10-26', 10, 2023, 4),
(20231208, '2023-12-08', 12, 2023, 4),
(20231124, '2023-11-24', 11, 2023, 4),
(20230320, '2023-03-20', 3, 2023, 1),
(20230830, '2023-08-30', 8, 2023, 3),
(20230817, '2023-08-17', 8, 2023, 3),
(20231008, '2023-10-08', 10, 2023, 4),
(20230924, '2023-09-24', 9, 2023, 3),
(20230919, '2023-09-19', 9, 2023, 3),
(20231016, '2023-10-16', 10, 2023, 4),
(20230511, '2023-05-11', 5, 2023, 2),
(20230626, '2023-06-26', 6, 2023, 2),
(20230527, '2023-05-27', 5, 2023, 2),
(20230818, '2023-08-18', 8, 2023, 3),
(20230302, '2023-03-02', 3, 2023, 1),
(20230102, '2023-01-02', 1, 2023, 1),
(20230714, '2023-07-14', 7, 2023, 3),
(20230227, '2023-02-27', 2, 2023, 1),
(20230416, '2023-04-16', 4, 2023, 2),
(20230123, '2023-01-23', 1, 2023, 1),
(20230915, '2023-09-15', 9, 2023, 3),
(20231103, '2023-11-03', 11, 2023, 4),
(20230424, '2023-04-24', 4, 2023, 2),
(20231012, '2023-10-12', 10, 2023, 4),
(20230729, '2023-07-29', 7, 2023, 3),
(20230426, '2023-04-26', 4, 2023, 2),
(20230731, '2023-07-31', 7, 2023, 3),
(20230415, '2023-04-15', 4, 2023, 2),
(20230408, '2023-04-08', 4, 2023, 2),
(20230407, '2023-04-07', 4, 2023, 2),
(20230620, '2023-06-20', 6, 2023, 2),
(20230903, '2023-09-03', 9, 2023, 3),
(20231010, '2023-10-10', 10, 2023, 4),
(20230514, '2023-05-14', 5, 2023, 2),
(20230613, '2023-06-13', 6, 2023, 2),
(20230109, '2023-01-09', 1, 2023, 1),
(20231009, '2023-10-09', 10, 2023, 4),
(20230824, '2023-08-24', 8, 2023, 3),
(20230908, '2023-09-08', 9, 2023, 3),
(20231209, '2023-12-09', 12, 2023, 4);

INSERT INTO dim_stores (store_name, store_city) VALUES
('Chennai Anna', 'Chennai'), ('Delhi South', 'Delhi'), ('Bangalore MG', 'Bangalore'),
('Pune FC Road', 'Pune'), ('Mumbai Central', 'Mumbai');

INSERT INTO dim_products (product_name, category) VALUES 
('Speaker', 'Electronics'),
('Tablet', 'Electronics'),
('Phone', 'Electronics'),
('Smartwatch', 'Electronics'),
('Atta 10kg', 'Groceries'),
('Jeans', 'Clothing'),
('Biscuits', 'Groceries'),
('Jacket', 'Clothing'),
('Laptop', 'Electronics'),
('Milk 1L', 'Groceries'),
('Saree', 'Clothing'),
('Headphones', 'Electronics'),
('Pulses 1kg', 'Groceries'),
('T-Shirt', 'Clothing'),
('Rice 5kg', 'Groceries'),
('Oil 1L', 'Groceries');

INSERT INTO dim_customers (customer_code) VALUES 
('CUST001'), ('CUST003'), ('CUST004'), ('CUST005'), ('CUST006'), 
('CUST009'), ('CUST010'), ('CUST011'), ('CUST012'), ('CUST014'), 
('CUST015'), ('CUST016'), ('CUST017'), ('CUST019'), ('CUST022'), 
('CUST023'), ('CUST025'), ('CUST026'), ('CUST027'), ('CUST028'), 
('CUST029'), ('CUST030'), ('CUST032'), ('CUST035'), ('CUST036'), 
('CUST038'), ('CUST039'), ('CUST044'), ('CUST046'), ('CUST047');

-- Transaction 1
INSERT INTO fact_sales (date_key, store_id, product_id, customer_id, units_sold, unit_price, total_revenue)
SELECT 20231127, 3, p.product_id, c.customer_id, 10, 52195.05, 521950.50
FROM dim_products p, dim_customers c
WHERE p.product_name = 'Rice 5kg' AND c.customer_code = 'CUST006';

-- Transaction 2
INSERT INTO fact_sales (date_key, store_id, product_id, customer_id, units_sold, unit_price, total_revenue)
SELECT 20230120, 4, p.product_id, c.customer_id, 18, 2317.47, 41714.46
FROM dim_products p, dim_customers c
WHERE p.product_name = 'Jeans' AND c.customer_code = 'CUST012';

-- Transaction 3
INSERT INTO fact_sales (date_key, store_id, product_id, customer_id, units_sold, unit_price, total_revenue)
SELECT 20230406, 5, p.product_id, c.customer_id, 16, 26474.34, 423589.44
FROM dim_products p, dim_customers c
WHERE p.product_name = 'Oil 1L' AND c.customer_code = 'CUST019';

-- Transaction 4
INSERT INTO fact_sales (date_key, store_id, product_id, customer_id, units_sold, unit_price, total_revenue)
SELECT 20231018, 5, p.product_id, c.customer_id, 10, 42343.15, 423431.50
FROM dim_products p, dim_customers c
WHERE p.product_name = 'Laptop' AND c.customer_code = 'CUST022';

-- Transaction 5
INSERT INTO fact_sales (date_key, store_id, product_id, customer_id, units_sold, unit_price, total_revenue)
SELECT 20230926, 3, p.product_id, c.customer_id, 18, 27469.99, 494459.82
FROM dim_products p, dim_customers c
WHERE p.product_name = 'Biscuits' AND c.customer_code = 'CUST009';

-- Transaction 6
INSERT INTO fact_sales (date_key, store_id, product_id, customer_id, units_sold, unit_price, total_revenue)
SELECT 20230409, 4, p.product_id, c.customer_id, 9, 27469.99, 247229.91
FROM dim_products p, dim_customers c
WHERE p.product_name = 'Biscuits' AND c.customer_code = 'CUST047';

-- Transaction 7
INSERT INTO fact_sales (date_key, store_id, product_id, customer_id, units_sold, unit_price, total_revenue)
SELECT 20230108, 1, p.product_id, c.customer_id, 6, 30187.24, 181123.44
FROM dim_products p, dim_customers c
WHERE p.product_name = 'Jacket' AND c.customer_code = 'CUST019';

-- Transaction 8
INSERT INTO fact_sales (date_key, store_id, product_id, customer_id, units_sold, unit_price, total_revenue)
SELECT 20231109, 4, p.product_id, c.customer_id, 6, 29770.19, 178621.14
FROM dim_products p, dim_customers c
WHERE p.product_name = 'T-Shirt' AND c.customer_code = 'CUST028';

-- Transaction 9
INSERT INTO fact_sales (date_key, store_id, product_id, customer_id, units_sold, unit_price, total_revenue)
SELECT 20230725, 4, p.product_id, c.customer_id, 3, 52195.05, 156585.15
FROM dim_products p, dim_customers c
WHERE p.product_name = 'Rice 5kg' AND c.customer_code = 'CUST009';

-- Transaction 10
INSERT INTO fact_sales (date_key, store_id, product_id, customer_id, units_sold, unit_price, total_revenue)
SELECT 20230104, 1, p.product_id, c.customer_id, 8, 52195.05, 417560.40
FROM dim_products p, dim_customers c
WHERE p.product_name = 'Rice 5kg' AND c.customer_code = 'CUST029';

-- Transaction 11
INSERT INTO fact_sales (date_key, store_id, product_id, customer_id, units_sold, unit_price, total_revenue)
SELECT 20231026, 3, p.product_id, c.customer_id, 10, 52195.05, 521950.50
FROM dim_products p, dim_customers c
WHERE p.product_name = 'Rice 5kg' AND c.customer_code = 'CUST017';

-- Transaction 12
INSERT INTO fact_sales (date_key, store_id, product_id, customer_id, units_sold, unit_price, total_revenue)
SELECT 20231208, 3, p.product_id, c.customer_id, 2, 2317.47, 4634.94
FROM dim_products p, dim_customers c
WHERE p.product_name = 'Jeans' AND c.customer_code = 'CUST011';

-- Transaction 13
INSERT INTO fact_sales (date_key, store_id, product_id, customer_id, units_sold, unit_price, total_revenue)
SELECT 20231124, 1, p.product_id, c.customer_id, 4, 35451.81, 141807.24
FROM dim_products p, dim_customers c
WHERE p.product_name = 'Saree' AND c.customer_code = 'CUST015';

-- Transaction 14
INSERT INTO fact_sales (date_key, store_id, product_id, customer_id, units_sold, unit_price, total_revenue)
SELECT 20230320, 2, p.product_id, c.customer_id, 16, 49262.78, 788204.48
FROM dim_products p, dim_customers c
WHERE p.product_name = 'Speaker' AND c.customer_code = 'CUST039';

-- Transaction 15
INSERT INTO fact_sales (date_key, store_id, product_id, customer_id, units_sold, unit_price, total_revenue)
SELECT 20230830, 3, p.product_id, c.customer_id, 18, 31604.47, 568880.46
FROM dim_products p, dim_customers c
WHERE p.product_name = 'Pulses 1kg' AND c.customer_code = 'CUST014';

-- Transaction 16
INSERT INTO fact_sales (date_key, store_id, product_id, customer_id, units_sold, unit_price, total_revenue)
SELECT 20230817, 2, p.product_id, c.customer_id, 17, 23226.12, 394844.04
FROM dim_products p, dim_customers c
WHERE p.product_name = 'Tablet' AND c.customer_code = 'CUST005';

-- Transaction 17
INSERT INTO fact_sales (date_key, store_id, product_id, customer_id, units_sold, unit_price, total_revenue)
SELECT 20231008, 4, p.product_id, c.customer_id, 2, 39854.96, 79709.92
FROM dim_products p, dim_customers c
WHERE p.product_name = 'Headphones' AND c.customer_code = 'CUST035';

-- Transaction 18
INSERT INTO fact_sales (date_key, store_id, product_id, customer_id, units_sold, unit_price, total_revenue)
SELECT 20230924, 2, p.product_id, c.customer_id, 11, 58851.01, 647361.11
FROM dim_products p, dim_customers c
WHERE p.product_name = 'Smartwatch' AND c.customer_code = 'CUST014';

-- Transaction 19
INSERT INTO fact_sales (date_key, store_id, product_id, customer_id, units_sold, unit_price, total_revenue)
SELECT 20230919, 4, p.product_id, c.customer_id, 3, 43374.39, 130123.17
FROM dim_products p, dim_customers c
WHERE p.product_name = 'Milk 1L' AND c.customer_code = 'CUST030';

-- Transaction 20
INSERT INTO fact_sales (date_key, store_id, product_id, customer_id, units_sold, unit_price, total_revenue)
SELECT 20231016, 2, p.product_id, c.customer_id, 15, 31604.47, 474067.05
FROM dim_products p, dim_customers c
WHERE p.product_name = 'Pulses 1kg' AND c.customer_code = 'CUST044';

-- Transaction 21
INSERT INTO fact_sales (date_key, store_id, product_id, customer_id, units_sold, unit_price, total_revenue)
SELECT 20230511, 3, p.product_id, c.customer_id, 13, 42343.15, 550460.95
FROM dim_products p, dim_customers c
WHERE p.product_name = 'Laptop' AND c.customer_code = 'CUST038';

-- Transaction 22
INSERT INTO fact_sales (date_key, store_id, product_id, customer_id, units_sold, unit_price, total_revenue)
SELECT 20230626, 5, p.product_id, c.customer_id, 14, 48703.39, 681847.46
FROM dim_products p, dim_customers c
WHERE p.product_name = 'Phone' AND c.customer_code = 'CUST004';

-- Transaction 23
INSERT INTO fact_sales (date_key, store_id, product_id, customer_id, units_sold, unit_price, total_revenue)
SELECT 20230527, 5, p.product_id, c.customer_id, 2, 43374.39, 86748.78
FROM dim_products p, dim_customers c
WHERE p.product_name = 'Milk 1L' AND c.customer_code = 'CUST009';

-- Transaction 24
INSERT INTO fact_sales (date_key, store_id, product_id, customer_id, units_sold, unit_price, total_revenue)
SELECT 20230818, 1, p.product_id, c.customer_id, 13, 52464.00, 682032.00
FROM dim_products p, dim_customers c
WHERE p.product_name = 'Atta 10kg' AND c.customer_code = 'CUST044';

-- Transaction 25
INSERT INTO fact_sales (date_key, store_id, product_id, customer_id, units_sold, unit_price, total_revenue)
SELECT 20230302, 4, p.product_id, c.customer_id, 12, 49262.78, 591153.36
FROM dim_products p, dim_customers c
WHERE p.product_name = 'Speaker' AND c.customer_code = 'CUST026';

-- Transaction 26
INSERT INTO fact_sales (date_key, store_id, product_id, customer_id, units_sold, unit_price, total_revenue)
SELECT 20230102, 4, p.product_id, c.customer_id, 8, 49262.78, 394102.24
FROM dim_products p, dim_customers c
WHERE p.product_name = 'Speaker' AND c.customer_code = 'CUST030';