{% macro unit_test__assertNone() %}
    {% do assertNone(1,  cast_date(), is_query=True) %}
{% endmacro %}

{% macro unit_test__assertNotNone() %}
{% endmacro %}