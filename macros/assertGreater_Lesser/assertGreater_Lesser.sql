{% macro assertGreater(test_number, macro_to_test_with_args, expected, is_query=False) %}
    {% set comparison_operator = 'greater' %}
    {% do return(assert(test_number, macro_to_test_with_args, expected, comparison_operator, is_query)) %}
{% endmacro %}

{% macro assertLesser(test_number, macro_to_test_with_args, expected, is_query=False) %}
    {% set comparison_operator = 'lesser' %}
    {% do return(assert(test_number, macro_to_test_with_args, expected, comparison_operator, is_query)) %}
{% endmacro %}

{% macro assertLessEqual(test_number, macro_to_test_with_args, expected, is_query=False) %}
    {% set comparison_operator = 'lesser_or_equal' %}
    {% do return(assert(test_number, macro_to_test_with_args, expected, comparison_operator, is_query)) %}
{% endmacro %}

{% macro assertGreatEqual(test_number, macro_to_test_with_args, expected, is_query=False) %}
    {% set comparison_operator = 'greater_or_equal' %}
    {% do return(assert(test_number, macro_to_test_with_args, expected, comparison_operator, is_query)) %}
{% endmacro %}
