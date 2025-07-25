with source as (
    select * 
    from {{ ref('clean_order_data_add_column_time_spent') }}
),

renamed as (
    select
        id_order,
        id_store,
        duration_min_sec,
        id_waiter,
        id_device,
        cast(date_opened as timestamp) as date_opened,
        cast(date_closed as timestamp) as date_closed,
        lower(trim(dim_status)) as dim_status,
        lower(trim(dim_source)) as dim_source,
        cast(m_nb_customer as int64) as m_nb_customer,
        cast(m_cached_payed as float64) as m_cached_payed,
        cast(m_cached_price as float64) as m_cached_price
    from source
)

select *
from renamed

