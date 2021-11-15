{{ config(materialized='view') }}

SELECT *
FROM public.purchases
WHERE product IN ('apple', 'banana', 'orange')