SELECT 
  turnover.id_store,
  turnover.total_turnover,
  turnover.year,
  turnover.month_name,
  turnover.day_of_week,
  store_order.device_name,
  RANK() OVER (ORDER BY turnover.total_turnover DESC) AS Revenue_Rank
FROM {{ ref("Avg_turnover_per_time_per_store") }} AS turnover
LEFT JOIN {{ ref("order_store_join") }} AS store_order
  ON turnover.id_store = store_order.id_store
WHERE turnover.total_turnover IS NOT NULL





