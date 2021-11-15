SELECT
    p."user",
    u.id
FROM {{ ref('fruit_purchases_a' )}} p
INNER JOIN users u
ON p."user" = u.id
WHERE u.id IS NULL