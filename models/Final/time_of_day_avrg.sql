SELECT 
  DATE(date_closed) as order_date,
  EXTRACT(HOUR FROM date_closed) as order_hour,
  COUNT(*) as orders,
  SUM(price_payed) as total_revenue
FROM {{ ref("clean_order_cleaned") }}
GROUP BY order_date, order_hour