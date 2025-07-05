<<<<<<<< HEAD:models/Final/time_of_day_avrg.sql
SELECT 
  DATE(date_closed) as order_date,
  EXTRACT(HOUR FROM date_closed) as order_hour,
  COUNT(*) as orders,
  SUM(price_payed) as total_revenue
FROM {{ ref("clean_order_cleaned") }}
GROUP BY order_date, order_hour
========
SELECT 
  DATE(date_closed) as order_date,
  EXTRACT(HOUR FROM date_closed) as order_hour,
  COUNT(*) as orders,
  SUM(price_payed) as total_revenue
FROM {{ ref("clean_order_cleaned") }}
GROUP BY order_date, order_hour
>>>>>>>> 6828b2bdd9d0f47beca1900004dd06568e21a8e1:models/Final/time_of_day_averages.sql
