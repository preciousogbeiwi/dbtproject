{{ config(
    materialized='incremental',
    unique_key='customer_sk',
    incremental_strategy='merge'
) }}

select
customer_sk,
customer_code,
concat(first_name, ' ', last_name) as customer_name,
gender,
email,
phone,
loyalty_tier,
signup_date,
current_date - 1 as last_load_date
from
{{ ref('bronze_customer') }}