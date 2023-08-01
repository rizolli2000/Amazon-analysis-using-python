SELECT
    product_name,
    COUNT(order_id) AS number_of_orders,
    SUM(order_total) AS total_sales
FROM
    orders
GROUP BY
    product_name;



SELECT
    product_name,
    COUNT(order_id) AS number_of_orders,
    SUM(order_total) AS total_sales
FROM
    orders
WHERE
    order_date BETWEEN '2023-01-01' AND '2023-07-31'
    AND order_status = 'completed'
    AND product_name LIKE '%iPhone%'
GROUP BY
    product_name;



WITH TopProducts AS (
    SELECT
        product_name,
        SUM(order_total) AS total_sales
    FROM
        orders
    WHERE
        order_date BETWEEN '2023-01-01' AND '2023-07-31'
        AND order_status = 'completed'
    GROUP BY
        product_name
)
SELECT
    product_name,
    total_sales
FROM
    TopProducts
ORDER BY
    total_sales DESC
LIMIT 5;
