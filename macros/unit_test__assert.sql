{% macro get_current_date() %}
    current_date()
{% endmacro %}

{% macro add(first, second) %}
    {{ first }} + {{ second }}
{% endmacro %}

        
{% macro unit_test__assert() %}
    {% do assert(1,  get_current_date(), "2025-07-10", is_query=True) %}
    {% do assert(3,  add(1, 1), "2", is_query=True) %}
{% endmacro %}      
