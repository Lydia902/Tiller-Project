{{config(materialized='table')}}
SELECT *
FROM {{ref("Top_5_software_use")}}