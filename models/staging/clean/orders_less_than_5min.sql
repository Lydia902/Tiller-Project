SELECT 
    id_store, 
    id_waiter, 
    device_name,
    SUM(CASE WHEN TIMESTAMP_DIFF(date_closed, date_opened, MINUTE) <= 5 THEN 1 ELSE 0 END) AS orders_closed_within_5_minutes,
    SUM(CASE WHEN TIMESTAMP_DIFF(date_closed, date_opened, MINUTE) > 5 THEN 1 ELSE 0 END) AS orders_closed_longer_than_5_minutes
FROM 
    `sage-yeti-453214-v6.dbt_lvanwyk.clean_order_cleaned`
GROUP BY 
    id_store, 
    id_waiter, 
    device_name
