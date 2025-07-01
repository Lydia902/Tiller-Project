SELECT
  id_order,
  date_opened,
  date_closed,
  CONCAT(
    CAST(TIMESTAMP_DIFF(date_closed, date_opened, MINUTE) AS STRING),
    ':',
    LPAD(
      CAST(MOD(TIMESTAMP_DIFF(date_closed, date_opened, SECOND), 60) AS STRING),
      2,
      '0'
    )
  ) AS duration_min_sec,
  id_waiter,
  id_device,
  dim_status,
  m_nb_customer,
  m_cached_payed,
  m_cached_price


FROM {{ref("stg_raw__orders")}}

