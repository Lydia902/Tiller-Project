SELECT
  id_order,
  COALESCE(id_waiter, 99999) AS id_waiter,
  id_device,
  date_closed,
  dim_status,
  m_nb_customer,
  m_cached_payed,
  m_cached_price
FROM {{ ref("stg_raw__orders") }}
