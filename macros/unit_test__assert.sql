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

{% macro unit_test__assert() %}
    {% do assert(1,  add(1, 1), "2", is_query=True) %}
    {% do assert(2,  add(1, -1), "0", is_query=True) %}
    {% do assert(3,  add(1, -2), "-1", is_query=True) %}

    {% do assert(4,  multiply(1, 1), "1", is_query=True) %}
    {% do assert(5,  multiply(1, -1), "-1", is_query=True) %}
    {% do assert(6,  multiply(2, -2), "-4", is_query=True) %}

    {% do assert(7,  not_casted_power(1, 1), "1", is_query=True) %}
    {% do assert(8,  not_casted_power(1, -1), "1", is_query=True) %}
    {% do assert(9,  not_casted_power(-2, 2), "4", is_query=True) %}

    {% do assert(10,  power(1, 1), "1", is_query=True) %}
    {% do assert(11,  power(1, -1), "1", is_query=True) %}
    {% do assert(12,  power(-2, 2), "4", is_query=True) %}
{% endmacro %}