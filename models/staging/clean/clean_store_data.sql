select *, 
CONCAT(zipcode, ", ", country) AS full_location
from {{ref("stg_raw__store_information")}}