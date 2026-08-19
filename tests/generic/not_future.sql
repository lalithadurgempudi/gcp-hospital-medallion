{% test not_future(model, column_name) %}

SELECT *
FROM {{ model }}
WHERE {{ column_name }} > CURRENT_TIMESTAMP()

{% endtest %}