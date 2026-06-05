{{ config(
    materialized='incremental',
    unique_key='sales_id',
    incremental_strategy='merge'
) }}

select
*,
current_date - 1 as last_load_date
from
{{ ref('bronze_returns') }}