with orders as (
    select *
    from {{ ref('clean_order_cleaned') }}
),

stores as (
    select *
    from {{ ref('clean_store_data') }}
),

joined as (
    select
        -- Choose fields from orders
        orders.id_order,
        orders.id_waiter,
        orders.id_store,  -- Include this once
        orders.id_device,
        orders.date_opened,
        orders.date_closed,
        orders.order_status,
        orders.nb_customer,
        orders.price_payed,
        orders.price_to_pay,
        orders.device_name,
        orders.duration_min_sec,


        -- Choose fields from stores, EXCLUDING id_store
        stores.date_created AS store_open_date,
        stores.zipcode,
        stores.full_location
        

    from orders
    left join stores
    on orders.id_store = stores.id_store
)
    select * from joined