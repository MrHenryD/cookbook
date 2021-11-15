{{
    config(
        materialized='incremental',
        unique_key='user',
        on_schema_change='fail',
        incremental_strategy='merge'
    )
}}
SELECT DISTINCT
    "user"
FROM {{ ref('fruit_purchases_a') }}

{% if is_incremental() %}

WHERE "user" >= (SELECT MAX("user") FROM {{ this }})

{% endif %}
