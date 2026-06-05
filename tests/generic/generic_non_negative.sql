{# {% test non_negative(model, column_name_1, column_name_2) %}

SELECT
    *
FROM 
    {{ model }}
WHERE 
    {{ column_name_1}} < 0 and {{ column_name_2}} < 0
    
{% endtest %} #}

{% test non_negative(model, columns) %}

SELECT *
FROM {{ model }}
WHERE 
    {% for col in columns %}
        {{ col }} < 0
        {% if not loop.last %} OR {% endif %}
    {% endfor %}

{% endtest %}