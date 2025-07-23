{% macro get_current_date() %}
    current_date()
{% endmacro %}

{% macro add(a, b) %}
    {{ a }} + {{ b }}
{% endmacro %}

{% macro multiply(a, b) %}
    {{ a }} * {{ b }}
{% endmacro %}

{% macro not_casted_power(a, b) %}
    {{ a }} ** {{ b }}
{% endmacro %}

{% macro power(a, b) %}
    cast({{ a }} ** {{ b }} as integer)
{% endmacro %}

{% macro add_days_to_date(date_string, days) %}
  {%- set date_obj = modules.datetime.datetime.strptime(date_string, '%Y-%m-%d') -%}
  {%- set new_date = date_obj + modules.datetime.timedelta(days=days) -%}
  {{ return(new_date.strftime('%Y-%m-%d')) }}
{% endmacro %}

{% macro unit_test__assertEqual() %}
    {% do assertEqual(1,  add(1, 1), "2", is_query=True) %}
    {% do assertEqual(2,  add(1, -1), "0", is_query=True) %}
    {% do assertEqual(3,  add(1, -2), "-1", is_query=True) %}
    {% do assertEqual(4,  multiply(1, 1), "1", is_query=True) %}
    {% do assertEqual(5,  multiply(1, -1), "-1", is_query=True) %}
    {% do assertEqual(6,  multiply(2, -2), "-4", is_query=True) %}
    {% do assertEqual(7,  not_casted_power(1, 1), "1", is_query=True) %}
    {% do assertEqual(8,  not_casted_power(1, -1), "1", is_query=True) %}
    {% do assertEqual(9,  not_casted_power(-2, 2), "4", is_query=True) %}
    {% do assertEqual(10,  power(1, 1), "1", is_query=True) %}
    {% do assertEqual(11,  power(1, -1), "1", is_query=True) %}
    {% do assertEqual(12,  power(-2, 2), "4", is_query=True) %}
    {% do assertEqual(10, add_days_to_date("2025-07-21", 1), "2025-07-22") %}
    {% do assertEqual(11, add_days_to_date("2025-07-21", -1), "2025-07-20") %}
    {% do assertEqual(12, add_days_to_date("2025-07-21", 2), "2025-07-23") %}
{% endmacro %}