-- models/staging/stg_id_device.sql
SELECT 
  COALESCE(id_device, 88888) AS id_device,
        id_order,
        id_store,
        id_waiter,
        date_opened,
        date_closed,
        dim_status,
        m_nb_customer,
        m_cached_payed,
        m_cached_price,
        dim_source_cleaned,
        duration_min_sec,


FROM {{ ref("clean_order_data_rename_tiller_to_one_the_rest_to_third_party") }}
