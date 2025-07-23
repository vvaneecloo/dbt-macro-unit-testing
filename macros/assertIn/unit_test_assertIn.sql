{% macro unit_test__assertIn() %}
    {% do assertIn(1, add(1, 1), [2, 3, 4], is_query=True) %}
    {% do assertIn(2, multiply(2, 3), [6, 12, 18], is_query=True) %}
    {% do assertIn(3, not_casted_power(2, 2), ['4', '4.0', 4], is_query=True) %}
    {% do assertIn(4, power(3, 2), [9, 9.0], is_query=True) %}
    {% do assertIn(5, add_days_to_date("2025-07-21", 1), "2025", is_query=False) %}
{% endmacro %}

{% macro unit_test__assertNotIn() %}
    {% do assertNotIn(1, add(1, 1), [0, 1, 3, 4], is_query=True) %}
    {% do assertNotIn(2, multiply(2, 3), [0, 1, 5, 7], is_query=True) %}}
    {% do assertNotIn(3, not_casted_power(2, 2), ['0', '1', '2', '3'], is_query=True) %}
    {% do assertNotIn(4, power(3, 2), [-1, 0, 1], is_query=True) %}
    {% do assertNotIn(5, add_days_to_date("2025-07-21", 1), "2024", is_query=False) %}
{% endmacro %}