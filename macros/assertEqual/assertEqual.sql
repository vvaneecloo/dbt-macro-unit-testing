{% macro assertEqual(test_number, macro_to_test_with_args, expected, is_query=False) %}
    {% set comparison_operator = 'equal' %}
    {% do return( assert(test_number, macro_to_test_with_args, expected, comparison_operator, is_query) ) %}
{% endmacro %}

{% macro assertNotEqual(test_number, macro_to_test_with_args, expected, is_query=False) %}
    {% set comparison_operator = 'different' %}
    {% do return( assert(test_number, macro_to_test_with_args, expected, comparison_operator, is_query) ) %}
{% endmacro %}