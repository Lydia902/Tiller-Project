SELECT
  id_order,
  COALESCE(id_waiter, 99999) AS id_waiter,
  id_store,
  id_device,
  date_opened,
  date_closed,
  dim_status AS order_status,
  m_nb_customer,
  m_cached_payed AS price_payed,
  m_cached_price AS price_to_pay,
  dim_source_cleaned AS device_name,
  duration_min_sec,

FROM {{ ref("clean_order_data_replace_device_id_two") }}
