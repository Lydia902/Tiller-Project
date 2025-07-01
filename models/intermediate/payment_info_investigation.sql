-- ## TOTAL AMOUNTS PAID PER PAYMENT TYPE ##

--SELECT 
--   standardized_payment_type,
--   ROUND(SUM (payment_total), 2)  AS total_paid
--FROM {{ ref('clean_payment_data') }}
--GROUP BY standardized_payment_type 


-- ## TOTAL AMOUNTS PAID PER DAY ##

--SELECT
--   DATE(payment_date) AS payment_day,
--   ROUND(SUM(payment_total), 2) AS daily_total_paid 
--FROM {{ ref('clean_payment_data') }}
--GROUP BY payment_day
--ORDER BY payment_day ASC


-- ## TOTAL AMOUNTS PAID PER MONTH ##

--SELECT
--  FORMAT_DATE('%Y-%m', DATE(payment_date)) AS payment_month,
--  ROUND(SUM(payment_total), 2) AS monthly_total_paid 
--FROM {{ ref('clean_payment_data') }}
--GROUP BY payment_month
--ORDER BY payment_month ASC


-- ## AMOUNT PAID PER ORDER ##

--SELECT
--   id_order, 
--   ROUND(SUM(payment_total), 2) AS order_total
--FROM {{ ref('clean_payment_data') }}
--GROUP BY id_order


-- ## AVERAGE ORDER AMOUNT PER MONTH ##

--SELECT 
--   FORMAT_DATE('%Y-%m', DATE(payment_date)) AS payment_month,
--   ROUND(AVG(payment_total), 2) AS order_average 
--FROM {{ ref('clean_payment_data') }}
--GROUP BY payment_month