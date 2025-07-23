{% macro assert(test_number, macro_to_test_with_args, expected, comparison_operator, is_query=False) -%}
    {% set green = {"begin": "\033[32m", "end": "\033[0m"} %}
    {% set red = {"begin": "\033[31m", "end": "\033[0m"} %}
    {% set bold = {"begin": "\033[1m", "end": "\033[0m"} %}
 
    {% if is_query %}
        {# Evaluate the macro as SQL and run it #}
        {% set raw_sql = macro_to_test_with_args.strip() %}
        {% set sql_query = (
            raw_sql.lower().startswith("select")
            and raw_sql
            or "select " ~ raw_sql
        ) %}
        {% set table = run_query(sql_query) %}
        {% set actual = table.columns[0].values()[0] | string %}
    {% else %}
        {% set actual = macro_to_test_with_args %}
    {% endif %}

    {%- if actual is none -%} 
        {{ print(bold['begin'] ~ "[" ~ red['begin'] ~ "ERROR" ~ red['end'] ~ "]" ~ bold['end'] ~ ": You forgot to specify your macro_to_test_with_args cases !") }}

    {%- elif expected is none -%} 
        {{ print(bold['begin'] ~ "[" ~ red['begin'] ~ "ERROR" ~ red['end'] ~ "]" ~ bold['end'] ~ ": You forgot to specify your macro_to_test_with_args cases !") }}
    {%- endif -%}

    {%- set operators = {
        'equal': actual == expected,
        'different': actual != expected,
        'greater': actual > expected,
        'lesser': actual < expected,
        'greater_or_equal': actual >= expected,
        'lesser_or_equal': actual <= expected,
        'in': actual in expected,
        'not_in': actual not in expected,
        'is_none': actual is none,
        'is_not_none': actual is not none
    } -%}

    {%- set test_passed = operators.get(comparison_operator, false) -%}

    {%- set raw_label = "[PASS #" ~ test_number ~ "]" if test_passed else "[FAIL #" ~ test_number ~ "]" -%}
    {%- set padded_label = raw_label.ljust(10) -%}

    {%- if not test_passed -%}
        {%- set label = bold['begin'] ~ red['begin'] ~ padded_label ~ red['end'] ~ bold['end'] -%}
    {%- else -%}
        {%- set label = bold['begin'] ~ green['begin'] ~ padded_label ~ green['end'] ~ bold['end'] -%}
    {%- endif -%}

    {% set expected = " [expected]: " ~ expected %}
    {% set expected_padded = expected.ljust(30) %}

    {% set actual  = " || [actual]: " ~ actual %}
    {% set actual_padded = actual.ljust(expected_padded | length) %}

    {%- set line = label
        ~ expected_padded
        ~ actual_padded
    -%}

    {{ log(line, info=True) }}
{% endmacro %}