with 

source as (

    select * from {{ source('raw', 'order_items') }}

),

renamed as (

    select
        id_order_line AS id_item,
        id_order,
        date_opended AS date_opened,
        date_created,
        m_quantity AS quantity,
        m_unit_price AS unit_price_incl_vat,
        m_unit_price_exc_vat AS unit_price_exc_vat,
        m_total_price_inc_vat AS total_price_inc_vat,
        m_total_price_exc_vat AS total_price_exc_vat,
        m_tax_percent AS tax_percent,
        m_discount_amount AS discount_amount,
        
        CASE
         WHEN LOWER(dim_status) = 'waiting_sent' THEN 'sent'
         ELSE LOWER(dim_status)
        END AS order_status

        -- the following columns don't make sense, the meaning must have been lost in translation
        -- dim_type,
        -- dim_category,
        -- dim_name,
        -- dim_feature_type,
        -- dim_category_translated,
        -- dim_name_translated,

        -- the following are mostly null 
        -- dim_unit_measure,
        -- dim_unit_measure_display

    from source
)

SELECT * FROM renamed