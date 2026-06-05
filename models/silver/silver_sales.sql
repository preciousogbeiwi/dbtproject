{{ config(
    materialized='incremental',
    unique_key='sales_id',
    incremental_strategy='merge'
) }}

select

*,
{{ charges_gen('payment_method', 'net_amount') }} as charges,

current_date - 1 as last_load_date

from {{ ref('bronze_sales') }}