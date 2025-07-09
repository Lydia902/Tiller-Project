SELECT id_store , device_name, ROUND(SUM(price_to_pay),2) AS turnover,
 FROM {{ref("clean_order_cleaned")}}
 GROUP BY id_store ,device_name 
HAVING id_store IN (4151 , 5281 , 360 , 4364 , 2035)