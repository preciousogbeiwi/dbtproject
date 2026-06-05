{% set cols_list = ["sales_id", "date_sk", "store_sk", "product_sk", "customer_sk", "quantity", "unit_price", "gross_amount", "net_amount", "payment_method"] %}
{% set last_load_date = modules.datetime.date.today() - modules.datetime.timedelta(days=1) %}

select 

{% for col in cols_list %}
    {{ col }}
    {% if not loop.last %},{% endif %}
{% endfor %},

'{{ last_load_date }}' as last_load_date

from {{ ref('bronze_sales') }}
where
date_sk = (select max(date_sk) from {{ ref('bronze_date') }})