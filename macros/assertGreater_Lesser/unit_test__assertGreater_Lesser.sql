{% macro unit_test__assertGreater() %}
    {% do assertGreater(1,  add(1, 1), "1", is_query=True) %}
    {% do assertGreater(2,  multiply(1, 1), "0", is_query=True) %}
    {% do assertGreater(3,  not_casted_power(1, 1), "0", is_query=True) %}
    {% do assertGreater(4,  power(1, 1), "0", is_query=True) %}
    {% do assertGreater(5, add_days_to_date("2025-07-21", 1), "2025-07-21") %}
{% endmacro %}

{% macro unit_test__assertLesser() %}
    {% do assertLesser(1,  add(1, 1), "3", is_query=True) %}
    {% do assertLesser(2,  multiply(1, 1), "2", is_query=True) %}
    {% do assertLesser(3,  not_casted_power(1, 1), "2", is_query=True) %}
    {% do assertLesser(4,  power(1, 1), "2", is_query=True) %}
    {% do assertLesser(5, add_days_to_date("2025-07-21", 1), "2025-07-23") %}
{% endmacro %}

{% macro unit_test__assertGreatEqual() %}
    {% do assertGreatEqual(1,  add(1, 1), "0", is_query=True) %}
    {% do assertGreatEqual(2,  multiply(1, 1), "1", is_query=True) %}
    {% do assertGreatEqual(3,  not_casted_power(1, 1), "1", is_query=True) %}
    {% do assertGreatEqual(4,  power(1, 1), "1", is_query=True) %}
    {% do assertGreatEqual(5, add_days_to_date("2025-07-21", 1), "2025-07-22") %}
{% endmacro %}

{% macro unit_test__assertLessEqual() %}
    {% do assertLessEqual(1,  add(1, 1), "3", is_query=True) %}
    {% do assertLessEqual(2,  multiply(1, 1), "2", is_query=True) %}
    {% do assertLessEqual(3,  not_casted_power(1, 1), "2", is_query=True) %}
    {% do assertLessEqual(4,  power(1, 1), "2", is_query=True) %}
    {% do assertLessEqual(5, add_days_to_date("2025-07-21", 1), "2025-07-23") %}
{% endmacro %}