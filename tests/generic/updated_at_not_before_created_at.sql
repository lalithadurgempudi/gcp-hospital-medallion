{% test updated_at_not_before_created_at(model, column_name, created_column) %}

SELECT *
FROM {{ model }}
WHERE {{ column_name }} < {{ created_column }}

{% endtest %}