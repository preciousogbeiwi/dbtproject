{{ config(
    materialized='incremental',
    unique_key='sales_id',
    incremental_strategy='merge'
) }}

select 
s.sales_id as sales_id,
s.net_amount,
s.payment_method,
c.customer_name,
c.email,
c.signup_date,
p.product_name,
p.department,
p.category,
st.store_name,
d.date
from {{ ref('silver_sales') }} s
inner join {{ ref('silver_customer') }} c on c.customer_sk = s.customer_sk 
inner join {{ ref('silver_product') }} p on p.product_sk = s.product_sk
left join {{ ref('silver_store') }} st on st.store_sk = s.store_sk
inner join {{ ref('silver_date') }} d on d.date_sk = s.date_sk