{{ config(
    materialized='incremental',
    unique_key='store_sk',
    incremental_strategy='merge'
) }}

select
*,
current_date - 1 as last_load_date
from
{{ ref('bronze_store') }}