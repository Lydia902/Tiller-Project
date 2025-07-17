{{config(materialized='table')}}
SELECT *
FROM {{ref("Bottom_5_software_use")}}