-- models/staging/stg_id_device.sql
SELECT 
  COALESCE(id_device, 88888) AS id_device
FROM {{ ref("stg_raw__orders") }}
