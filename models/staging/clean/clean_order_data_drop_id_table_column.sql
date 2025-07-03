SELECT * EXCEPT(id_table)
FROM {{ ref('stg_raw__orders') }}