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
