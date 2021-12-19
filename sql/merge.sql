-- NOTE: NOT ALL DATABASES SUPPORT MERGE

-- MERGE INTO TABLE (INSERT IF NOT FOUND, UPDATE IF FOUND)
MERGE INTO mydatabase.mytable t1
    USING anotherdatabase.anothertable t2
    ON (t1.id = t2.id)
  WHEN MATCHED THEN
    UPDATE SET 
        t1.col1 = t2.col1,
        t1.col2 = t2.col2,
        t1.col3 = t2.col3,
        ...
  WHEN NOT MATCHED THEN
    INSERT (id, col1, col2, col3, ...)
    VALUES (t2.id, t2.col1, t2.col2, t2.col3, ...);

-- MERGE INTO TABLE (INSERT IF NOT FOUND, DELETE IF FOUND)    
MERGE INTO mydatabase.mytable t1
    USING anotherdatabase.anothertable t2
    ON (t1.id = t2.id)
  WHEN MATCHED THEN
    DELETE
  WHEN NOT MATCHED THEN
    INSERT (id, col1, col2, col3, ...)
    VALUES (t2.id, t2.col1, t2.col2, t2.col3, ...);