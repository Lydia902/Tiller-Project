with 

source as (

    select * from {{ source('raw', 'payment_information') }}

),

renamed as (

    select
        date_created AS payment_date,
        id_pay AS id_payment,
        id_order,
        LOWER(dim_status) AS payment_status,
        LOWER(dim_type) AS payment_type,

    CASE
        WHEN LOWER(dim_type) IN ('cb_sans_contact', 'sumup', 'cb_ticket_resto', 'card', 'pourboire_carte_bleue') THEN 'card_payment'
        WHEN LOWER(dim_type) = 'american_express' THEN 'card_credit'
        WHEN LOWER(dim_type) = 'bank_transfer' THEN 'bank_transfer'
        WHEN LOWER(dim_type) = 'bank_check' THEN 'bank_check'
        WHEN LOWER(dim_type) = 'voucher' THEN 'voucher'
        WHEN LOWER(dim_type) IN ('carte_ticket_restaurant', 'carte ticket restaurant', 'ticket_restaurant', 'ticket_restaurant_carte', 'resto_flash') THEN 'meal_card'
        WHEN LOWER(dim_type) IN ('uber eats', 'alloresto', 'deliveroo', 'clickeat') THEN 'delivery_app'
        WHEN LOWER(dim_type) = 'siouplait' THEN 'tip_app'
        WHEN LOWER(dim_type) = 'tab' THEN 'tabac_payment_point'
        WHEN LOWER(dim_type) = 'credit_note' THEN 'credit_note'
        WHEN LOWER(dim_type) = 'cash' THEN 'cash'
        WHEN LOWER(dim_type) = 'apple pay' THEN 'mobile_wallet'
        WHEN LOWER(dim_type) = 'alipay' THEN 'mobile_wallet'
        WHEN LOWER(dim_type) = 'fivory' THEN 'mobile_wallet'
        WHEN LOWER(dim_type) = 'arrhes' THEN 'deposit'
        WHEN LOWER(dim_type) = 'livraison' THEN 'delivery_fee'
        WHEN LOWER(dim_type) = 'avoir_encaissé' THEN 'reimbursed_credit'
        WHEN LOWER(dim_type) = 'carte cadeau' THEN 'gift_card'
        WHEN LOWER(dim_type) = 'autres' THEN 'other'
        ELSE 'unknown'
    END AS standardized_payment_type,

        m_amount AS payment_total,
       COALESCE(m_cashback, 0.0) AS cashback,
       COALESCE(m_credit, 0.0) AS credit

    from source

)

select * from renamed
