# warehouse_demo
dbt demo using a local postgres instance.

## Getting Started
1. Create project
2. Configure profile
3. Create dbt model
4. Writing tests
5. Run dbt

### Create project
Creates structure for a dbt project (models, profiles, tests, etc).

```
dbt init warehouse_demo
```

### Configure profile
Profiles define access credentials to your storage layer. By default, profiles are stored under ~/.dbt/profiles.yml


1. Edit ~/.dbt/profiles.yml to reflect storage layer
2. Update profile setting under dbt_project.yml
3. Run dbt debug to verify settings

```

$ cat ~/.dbt/profiles.yml

<profile>:
  target: <database>
  outputs:

    <database>:
      type: postgres
      host: localhost
      user: dwh
      password: password
      port: 5433
      dbname: dwh
      schema: public


$ cat dbt_project.yml

name: 'warehouse_demo'
version: '1.0.0'
config-version: 2
profile: <profile>
...


$ dbt debug

All checks passed!

```

### Create dbt model
dbt models can be expressed as views, tables, incremental, ephemeral.

1. Create dbt model under models/
2. Optionally add dbt model under dbt_project.yml (used for default materialization)

```

$ cat models/table.sql

{{ config(
    materialized = 'table',
    indexes=[
      {'columns': ['"user"'], 'type': 'hash'},
      {'columns': ['"user"', '"product"'], 'unique': True},
    ]
)}}
SELECT 
    "user",
    product,    
    COUNT(*) AS total_purchases,
    SUM(price) AS total_spend
FROM {{ ref('fruit_purchases_v') }}
GROUP BY
    "user",
    product


$ cat dbt_project.yml

models:
  warehouse_demo:
    customers:
      +enabled: true
      +materialized: table

```

### Writing tests
Tests can be defined as .sql files (under test/ directory) or under schema.yml. Note that you can define multiple files.

```

$ cat tests/customer/fruit_purchases_a_user__exists.sql

SELECT
    p."user",
    u.id
FROM {{ ref('fruit_purchases_a' )}} p
INNER JOIN users u
ON p."user" = u.id
WHERE u.id IS NULL


$ cat schema.yml

models:
  - name: fruit_purchases_a
    description: "Fruit purchases"
    columns:
      - name: product
        description: "The type of purchase"
        tests:
          - accepted_values:
              values: ['apple', 'banana', 'orange']
```

### Run dbt
These are the useful commands.

```
dbt debug   // checks syntax, connection, etc.
dbt run  // creates models
dbt test  // runs sql tests, schema validation
```

## Questions
* How to manage multiple model directories? https://discourse.getdbt.com/t/how-we-structure-our-dbt-projects/355
* How to reference models across directories? dbt is designed to work for a single database, table names should be globally unique. https://docs.getdbt.com/reference/resource-configs/database
* Schema migration for incremental tables? https://docs.getdbt.com/docs/building-a-dbt-project/building-models/configuring-incremental-models#what-if-the-columns-of-my-incremental-model-change
* Cleaning up deprecated models? dbt does not handle dropping tables https://discourse.getdbt.com/t/clean-your-warehouse-of-old-and-deprecated-models-snowflake/1547