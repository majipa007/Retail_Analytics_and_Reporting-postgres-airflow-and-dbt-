{{
    config(
        materialized = 'incremental',
        schema = 'production_schema',
        unique_key = 'customer_id'
    )
}}

with
staging_data as(
    select
        *
    from {{ source('sales_data_mart_staging_schema', 'staging_customers')}}
)

select
    *
from staging_data