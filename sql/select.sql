-- LEFT JOIN: INCLUDES ALL RECORDS FROM LEFT SIDE AND RECORDS THAT MATCH ON THE RIGHT SIDE
SELECT 
    t1.id,
    t1.col1 AS t1_col1,
    t2.col2 AS t2_col2,
    ...
FROM mydatabase.mytable t1
LEFT JOIN anotherdatabase.anothertable t2
    ON t1.id = t2.id
WHERE  -- QUERY MUST MEET THE CRITERIA
    t1.col1 = 'Bob'

-- INNER JOIN: INCLUDES MATCHING RECORDS
SELECT 
    t1.id,
    t1.col1 AS t1_col1,
    t2.col2 AS t2_col2,
    ...
FROM mydatabase.mytable t1
INNER JOIN anotherdatabase.anothertable t2
    ON t1.id = t2.id
WHERE  -- QUERY MUST MEET THE CRITERIA
    (t1.col1 = 'Bob' OR t2.col1 = 'Bob') AND
    (t1.col2 > 100)
