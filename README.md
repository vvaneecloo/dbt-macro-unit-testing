# dbt_assert

A lightweight macro for asserting expected outcomes in your dbt projects.

## Overview

The `dbt_assert` macro enables you to define tests for other macros or SQL expressions, logging structured success/failure messages directly in the dbt output. It supports both pure Jinja expressions and SQL queries, making it ideal for validating macro logic and data transformations.

## Installation

Add the package to your `packages.yml` file:

```yaml
packages:
  - git: "https://github.com/your-org/dbt_assert.git"
    revision: main  # or specify a tag/commit
```

Run `dbt deps` to install the package.

## Usage

### Macro Signature

```sql
{% macro assert(test_number, macro_to_test_with_args, success, is_query=False) %}
```

### Parameters

| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| `test_number` | int | Yes | Unique identifier for the test (e.g., 1, 2, 3) |
| `macro_to_test_with_args` | any | Yes | The value or SQL string to evaluate |
| `success` | any | Yes | The expected value to compare against |
| `is_query` | bool | No | Set to `True` if `macro_to_test_with_args` should be executed as SQL (default: `False`) |

### Basic Examples

#### Testing Jinja Macro Output

```sql
-- Test a custom macro that formats currency
{{ assert(1, format_currency(1000), '$1,000.00') }}

-- Test string manipulation macro
{{ assert(2, clean_phone_number('(555) 123-4567'), '5551234567') }}
```

#### Testing SQL Queries

```sql
-- Test row count
{{ assert(3, "select count(*) from " ~ ref('users'), 150, is_query=True) }}

-- Test aggregate calculation
{{ assert(4, "select sum(amount) from " ~ ref('orders'), 25000.50, is_query=True) }}

-- Test data quality
{{ assert(5, "select count(*) from " ~ ref('customers') ~ " where email is null", 0, is_query=True) }}
```

#### Advanced Usage in Models

```sql
-- In a model file (models/my_model.sql)
{% set test_results = [] %}

-- Run your assertions
{{ assert(1, calculate_discount(100, 0.1), 10) }}
{{ assert(2, "select max(created_at) from " ~ source('raw', 'events'), '2024-01-15', is_query=True) }}

-- Your actual model SQL
select * from {{ ref('base_table') }}
```

## Output Format

The macro provides colored console output for easy identification of test results:

### Success Output
```
✅ [PASS #1] [expected]: $1,000.00 || [actual]: $1,000.00
```

### Failure Output
```
❌ [FAIL #2] [expected]: 150 || [actual]: 142
```

### Error Output
```
⚠️  [ERROR #3] Missing required parameter: success
```

## Best Practices

1. **Use sequential test numbers** - This helps track which assertions pass or fail
2. **Group related tests** - Keep assertions for similar functionality together
3. **Test edge cases** - Include tests for null values, empty strings, and boundary conditions
4. **Document your tests** - Add comments explaining what each assertion validates

### Example Test Suite

```sql
{% macro test_currency_formatting() %}
  -- Test basic formatting
  {{ assert(1, format_currency(1000), '$1,000.00') }}
  
  -- Test negative values
  {{ assert(2, format_currency(-500), '-$500.00') }}
  
  -- Test zero
  {{ assert(3, format_currency(0), '$0.00') }}
  
  -- Test decimal handling
  {{ assert(4, format_currency(1234.56), '$1,234.56') }}
{% endmacro %}
```

## Contributing

Contributions are welcome! Please:

1. Fork the repository
2. Create a feature branch
3. Add tests for new functionality
4. Submit a pull request

## License

MIT License - feel free to use and modify as needed.

## Support

For issues, questions, or feature requests, please open an issue on the GitHub repository.