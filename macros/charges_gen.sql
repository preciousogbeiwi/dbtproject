{% macro charges_gen(col1, col2, dp = 2) %}
    case
        when {{ col1 }} in ('Card', 'Gift Card') then round({{ col2 }} * 0.02, {{ dp }})
        when {{ col1 }} = 'Digital Wallet' then round({{ col2 }} * 0.01, {{ dp }})
        else 0
    end

{% endmacro %}