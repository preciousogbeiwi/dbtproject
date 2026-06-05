{{ config(
    materialized='incremental',
    unique_key='date_sk',
    incremental_strategy='merge'
) }}

select
date_sk,
date,
day_name,
current_date - 1 as last_load_date
from
{{ ref('bronze_date') }}