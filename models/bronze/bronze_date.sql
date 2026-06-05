{{ config(
    materialized='table',
    schema='bronze'
) }}

SELECT 
*
FROM
{{ source('source', 'dim_date') }}