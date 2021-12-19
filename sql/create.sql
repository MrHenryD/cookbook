-- CREATE A DATABASE (GROUPING OF TABLES)
CREATE DATABASE mydatabase;

-- CREATE A TABLE INSIDE A DATABASE
CREATE TABLE mydatabase.mytable (
    id int NOT NULL AUTO_INCREMENT,  -- COLUMN is a number type; cannot have a missing value; value automatically increases by one
    column1 varchar(255) NOT NULL,  -- COLUMN is a text type; cannot have a missing value
    column2 varchar(255),  -- COLUMN is a text type; can have missing value
    column3 int,  -- COLUMN is a number type; can have a missing value
    PRIMARY KEY (id)  -- COLUMN (id) uniquely identifies each row in the table
);