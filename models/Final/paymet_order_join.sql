{{ config(materialized='table') }}
SELECT *
FROM {{ref("order_store_join")}}