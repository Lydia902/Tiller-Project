{{ config(materialized = 'view') }}

with null_summary as (
    select
        count(*) as total_rows,
        countif(id_order is null) as null_id_order,
        countif(date_opened is null) as null_date_opened,
        countif(id_store is null) as null_id_store,
        countif(id_table is null) as null_id_table,
        countif(id_waiter is null) as null_id_waiter,
        countif(id_device is null) as null_id_device,
        countif(date_closed is null) as null_date_closed,
        countif(dim_status is null or trim(dim_status) = '') as null_dim_status,
        countif(m_nb_customer is null) as null_m_nb_customer,
        countif(m_cached_payed is null) as null_m_cached_payed,
        countif(m_cached_price is null) as null_m_cached_price
      
    from {{ ref('stg_raw__orders') }}
)

select * from null_summary
