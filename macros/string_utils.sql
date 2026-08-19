{% macro clean_string(column_name) %}
    NULLIF(TRIM(UPPER({{ column_name }})), '')
{% endmacro %}