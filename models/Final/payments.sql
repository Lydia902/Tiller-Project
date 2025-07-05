{{config(materialized='table')}}
SELECT *
FROM {{ref("clean_payment_data")}}
