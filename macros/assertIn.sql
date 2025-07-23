{% macro assertIn(test_number, macro_to_test_with_args, expected, is_query=False) %}
    {% set comparison_operator = 'in' %}
    {% do return(assert(test_number, macro_to_test_with_args, expected, comparison_operator, is_query)) %}
{% endmacro %}

{% macro assertNotIn(test_number, macro_to_test_with_args, expected, is_query=False) %}
    {% set comparison_operator = 'not_in' %}
    {% do return(assert(test_number, macro_to_test_with_args, expected, comparison_operator, is_query)) %}
{% endmacro %}