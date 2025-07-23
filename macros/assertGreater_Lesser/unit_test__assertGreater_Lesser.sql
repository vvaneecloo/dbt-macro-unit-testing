{% macro unit_test__assertGreater() %}
    {% do assertGreater(1,  add(1, 1), "1", is_query=True) %}
    {% do assertGreater(2,  multiply(1, 1), "0", is_query=True) %}
    {% do assertGreater(3,  not_casted_power(1, 1), "0", is_query=True) %}
    {% do assertGreater(4,  power(1, 1), "0", is_query=True) %}
    {% do assertGreater(5, add_days_to_date("2025-07-21", 1), "2025-07-21") %}
{% endmacro %}

{% macro unit_test__assertLesser() %}
    {% do assertNotEqual(1,  add(1, 1), "1", is_query=True) %}
    {% do assertNotEqual(2,  add(1, -1), "1", is_query=True) %}
    {% do assertNotEqual(3,  add(1, -2), "1", is_query=True) %}
    {% do assertNotEqual(4,  multiply(1, 1), "2", is_query=True) %}
    {% do assertNotEqual(5,  multiply(1, -1), "3", is_query=True) %}
    {% do assertNotEqual(6,  multiply(2, -2), "4", is_query=True) %}
    {% do assertNotEqual(7,  not_casted_power(1, 1), "3", is_query=True) %}
    {% do assertNotEqual(8,  not_casted_power(1, -1), "45", is_query=True) %}
    {% do assertNotEqual(9,  not_casted_power(-2, 2), "6", is_query=True) %}
    {% do assertNotEqual(10,  power(1, 1), "2", is_query=True) %}
    {% do assertNotEqual(11,  power(1, -1), "3", is_query=True) %}
    {% do assertNotEqual(12,  power(-2, 2), "5", is_query=True) %}
    {% do assertNotEqual(10, add_days_to_date("2025-07-21", 1), "2025-07-23") %}
    {% do assertNotEqual(11, add_days_to_date("2025-07-21", -1), "2025-07-21") %}
    {% do assertNotEqual(12, add_days_to_date("2025-07-21", 2), "2025-07-22") %}
{% endmacro %}