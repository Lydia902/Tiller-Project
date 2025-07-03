with 

source as (

    select * from {{ source('raw', 'store_information') }}

),

renamed as (

    select
        id_store,
        date_created,
        dim_zipcode AS zipcode,
        dim_country AS country,
        dim_currency AS currency

    from source

)

select * from renamed
