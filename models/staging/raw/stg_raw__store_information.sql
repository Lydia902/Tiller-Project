with 

source as (

    select * from {{ source('raw', 'store_information') }}

),

renamed as (

    select
        id_store,
        date_created,
        dim_zipcode,
        dim_country,
        dim_currency

    from source

)

select * from renamed
