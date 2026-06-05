{{ config(
    materialized='incremental',
    unique_key='sales_id',
    incremental_strategy='merge'
) }}

select

a.sales_id as sales_id,
a.net_amount,
a.payment_method,
c.customer_name,
c.email,
p.product_name,
p.department,
p.category,
st.store_name as sales_store_name,
rt.store_name as return_store_name,
sd.date as sales_date,
rd.date as return_date,
a.quantity as sales_qty,
r.returned_qty,
r.return_reason,
r.refund_amount

from {{ ref('silver_sales') }}  a
left join {{ ref("silver_store") }} st on st.store_sk = a.store_sk
left join {{ ref('silver_date') }} sd on sd.date_sk = a.date_sk
inner join {{ ref('silver_returns') }} r on r.sales_id = a.sales_id
left join {{ ref("silver_store") }} rt on rt.store_sk = r.store_sk
left join {{ ref('silver_date') }} rd on rd.date_sk = r.date_sk
inner join {{ ref("silver_customer") }} c on c.customer_sk = a.customer_sk
inner join {{ ref("silver_product") }} p on p.product_sk = a.product_sk