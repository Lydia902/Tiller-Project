select 
*
from {{ref("clean_order_cleaned")}}
WHERE id_store = 360
