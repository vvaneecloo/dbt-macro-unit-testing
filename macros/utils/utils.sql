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

{% macro cast_date() %}
    null :: date
{% endmacro %}