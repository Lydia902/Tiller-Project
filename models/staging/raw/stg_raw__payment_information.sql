with 

source as (

    select * from {{ source('raw', 'payment_information') }}

),

renamed as (

    select
        id_pay,
        id_order,
        dim_status,
        dim_type,
        m_amount,
        m_cashback,
        m_credit,
        date_created

    from source

)

select * from renamed
