SELECT
  CASE 
    WHEN LOWER(dim_source) IN ('tiller-order', 'tiller ipad', 'tiller ipod') THEN 'Tiller'
    ELSE 'Third-Party Platform'  -- catches NULL, 'lafourchette', 'zenchef', etc.
  END AS dim_source_cleaned,

  -- other fields
        id_order,
        id_store,
        id_waiter,
        id_device,
        date_opened,
        date_closed,
        dim_status,
        m_nb_customer,
        m_cached_payed,
        m_cached_price,
        duration_min_sec,

FROM {{ ref('clean_order_data_rename_cast') }}
