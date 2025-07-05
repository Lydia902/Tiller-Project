{{ config(
    materialized = 'table'
) }}

with payments as (
    select
        id_order,
        payment_total
    from {{ ref('clean_payment_data') }}
),

orders as (
    select
        id_order,
        id_store,
        date_opened,
        date_closed
    from {{ ref('order_store_join') }}
),

joined as (
    select
        o.id_store,
        o.date_opened,
        o.date_closed,
        p.payment_total
    from orders o
    left join payments p
        on o.id_order = p.id_order
),

enriched as (
    select
        id_store,
        EXTRACT(YEAR FROM date_opened) AS year,
        EXTRACT(MONTH FROM date_opened) AS month,
        FORMAT_DATE('%A', DATE(date_closed)) AS day_of_week,
        EXTRACT(HOUR FROM date_closed) AS hour_of_day,
        SUM(payment_total) AS total_turnover
    from joined
    group by id_store, year, month, day_of_week, hour_of_day
)

select * from enriched;

