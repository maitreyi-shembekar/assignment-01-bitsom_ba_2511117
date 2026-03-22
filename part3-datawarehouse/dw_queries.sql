-- Part 3.2: Analytical Queries
USE retail_dw;

-- Q1: Total sales revenue by product category for each month
-- Note: We join fact_sales to dim_products for the category and dim_dates for the month/year names
SELECT d.year, d.month, p.category, SUM(f.total_revenue) AS total_category_revenue
FROM fact_sales f
JOIN dim_products p ON f.product_id = p.product_id
JOIN dim_dates d ON f.date_key = d.date_key
GROUP BY d.year, d.month, p.category
ORDER BY d.year, d.month;

-- Q2: Top 2 performing stores by total revenue
-- Note: We join with dim_stores to get the store names and order by revenue descending
SELECT s.store_name, SUM(f.total_revenue) AS store_revenue
FROM fact_sales f
JOIN dim_stores s ON f.store_id = s.store_id
GROUP BY s.store_name
ORDER BY store_revenue DESC
LIMIT 2;

-- Q3: Month-over-month sales trend across all stores
-- Note: This shows the total revenue flow across the calendar year
SELECT d.year, d.month, SUM(f.total_revenue) AS monthly_revenue
FROM fact_sales f
JOIN dim_dates d ON f.date_key = d.date_key
GROUP BY d.year, d.month
ORDER BY d.year, d.month;