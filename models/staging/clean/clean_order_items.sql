SELECT *
FROM {{ref('stg_raw__order_items')}}


-- MODEL: REVENUE AND DISCOUNTS PER MONTH 

--SELECT
--  DATE_TRUNC(DATE(date_created), MONTH) AS month,
--  SUM(total_price_exc_vat)            AS gross_revenue_exc_vat,
--  SUM(total_price_inc_vat)            AS gross_revenue_inc_vat,
--  SUM(discount_amount)                AS total_discounts,
--  SUM(quantity)                       AS items_sold
--FROM {{ ref('stg_raw__order_items') }}
--WHERE order_status NOT IN ('waiting')
--GROUP BY month
--ORDER BY month