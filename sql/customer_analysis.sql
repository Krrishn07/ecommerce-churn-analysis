
Create Database customer_churn_analysis;

Use customer_churn_analysis;

SELECT TOP 5 *
FROM customer_summary;


--Query 1 : Overall business KPIs
SELECT
    COUNT(*) AS total_customers,
    SUM(total_orders) AS total_orders,
    SUM(total_payment) AS total_revenue,
    AVG(total_payment) AS average_revenue_per_customer
FROM customer_summary;


--Query 2: Customer type analysis.
SELECT
    CASE
        WHEN is_repeat_customer = 0 THEN 'One-time customer'
        ELSE 'Repeat customer'
    END AS customer_type,
    COUNT(*) AS total_customers,
    SUM(total_orders) AS total_orders,
    SUM(total_payment) AS total_revenue,
    AVG(total_payment) AS average_revenue_per_customer
FROM customer_summary
GROUP BY
    CASE
        WHEN is_repeat_customer = 0 THEN 'One-time customer'
        ELSE 'Repeat customer'
    END;


--Query 3: Repeat-customer rate
SELECT
    SUM(CASE WHEN is_repeat_customer = 1 THEN 1 ELSE 0 END) AS repeat_customers,
    COUNT(*) AS total_customers,
    CAST(
        SUM(CASE WHEN is_repeat_customer = 1 THEN 1 ELSE 0 END) * 100.0
        / COUNT(*)
        AS DECIMAL(5,2)
    ) AS repeat_customer_rate_percent
FROM customer_summary;


--Query 4 : Customer segments
SELECT
    customer_segment,
    COUNT(*) AS total_customers,
    SUM(total_payment) AS total_revenue,
    AVG(total_payment) AS average_revenue_per_customer
FROM customer_summary
GROUP BY customer_segment
ORDER BY total_revenue DESC;


--Query 5 : Inactive customer rate
SELECT
    SUM(CASE WHEN is_inactive = 1 THEN 1 ELSE 0 END) AS inactive_customers,
    COUNT(*) AS total_customers,
    CAST(
        SUM(CASE WHEN is_inactive = 1 THEN 1 ELSE 0 END) * 100.0
        / COUNT(*)
        AS DECIMAL(5,2)
    ) AS inactive_customer_rate_percent
FROM customer_summary;


--Query 6 : Revenue by activity status
SELECT
    CASE
        WHEN is_inactive = 1 THEN 'Inactive customer'
        ELSE 'Active customer'
    END AS activity_status,
    COUNT(*) AS total_customers,
    SUM(total_payment) AS total_revenue,
    AVG(total_payment) AS average_revenue_per_customer
FROM customer_summary
GROUP BY
    CASE
        WHEN is_inactive = 1 THEN 'Inactive customer'
        ELSE 'Active customer'
    END;


--Query 7 : Review score by customer type
SELECT
    CASE
        WHEN is_repeat_customer = 0 THEN 'One-time customer'
        ELSE 'Repeat customer'
    END AS customer_type,
    AVG(average_review_score) AS average_review_score,
    COUNT(*) AS total_customers
FROM customer_summary
GROUP BY
    CASE
        WHEN is_repeat_customer = 0 THEN 'One-time customer'
        ELSE 'Repeat customer'
    END;

--Query 8 : Top spending customers
SELECT TOP 10
    customer_unique_id,
    total_orders,
    total_payment,
    customer_segment
FROM customer_summary
ORDER BY total_payment DESC;

--Query 9 : Monthly revenue trend
SELECT
    FORMAT(first_order_date, 'yyyy-MM') AS order_month,
    COUNT(*) AS new_customers,
    SUM(total_payment) AS revenue
FROM customer_summary
GROUP BY FORMAT(first_order_date, 'yyyy-MM')
ORDER BY order_month;

--Query 10 : Average recency by segment
SELECT
    customer_segment,
    COUNT(*) AS total_customers,
    AVG(days_since_last_order) AS average_days_since_last_order
FROM customer_summary
GROUP BY customer_segment
ORDER BY average_days_since_last_order DESC;