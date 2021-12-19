-- INSERT INTO A TABLE USING SPECIFIC VALUES
INSERT INTO mydatabase.mytable (column1, column2, column3, ...)
VALUES (value1, value2, value3, ...);

-- INSERT INTO A TABLE FROM ANOTHER TABLE
INSERT INTO mydatabase.mytable (column1, column2, column3, ...)
SELECT 
    column1,
    column2,
    column3,
    ...
FROM anotherdatabase.anothertable
WHERE 
    column1 = 'Bob';