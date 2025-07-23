{% macro assertNone(test_number, macro_to_test_with_args, expected=None, is_query=False) %}
    {% set comparison_operator = 'is_none' %}
    {% do return( assert(test_number, macro_to_test_with_args, expected, comparison_operator, is_query) ) %}
{% endmacro %}

{% macro assertNotNone(test_number, macro_to_test_with_args, expected=None, is_query=False) %}
    {% set comparison_operator = 'is_not_none' %}
    {% do return( assert(test_number, macro_to_test_with_args, expected, comparison_operator, is_query) ) %}
{% endmacro %}