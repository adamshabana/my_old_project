WITH category_detail AS (
SELECT c.category_name,
COUNT(p.product_id) AS product_count,
ROUND(CAST(AVG(p.unit_price) AS NUMERIC), 2) AS average_price
FROM categories c
JOIN products p ON p.category_id = c.category_id
GROUP BY c.category_name
)
SELECT *
FROM category_detail;

WITH category_detail AS (
SELECT c.category_name,
COUNT(p.product_id) AS product_count,
ROUND(CAST(AVG(p.unit_price) AS NUMERIC), 2) AS average_price
FROM categories c
JOIN products p ON p.category_id = c.category_id
GROUP BY c.category_name
)

SELECT category_name, product_count, average_price
FROM category_detail
WHERE average_price = (SELECT MAX(average_price) FROM category_detail);