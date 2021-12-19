# SQL Templates

## Context
SQL is one of the most common languages, used for interacting with RDBMS (Relational Database Management Systems). SQL is a declarative language which means that you specify what you want and the SQL compiler (background program which tries to understand your command) will break down your request and return you a result.

All SQL commands begin with a verb (CREATE, SELECT, INSERT, DELETE, etc.).

## Select
This will be used to pull data from tables. Most common operation used.

[Refer to example](select.sql)

## Create
This will be used to create resources such as Databases, Tables, Users, etc.

[Refer to example](create.sql)

## Drop
This will be used to delete resources such as Databases, Tables, Users, etc.

[Refer to example](drop.sql)

## Delete
This will be used to remove records from a table.

[Refer to example](delete.sql)

## Truncate Table
This will drop all records in a table.

[Refer to example](truncate.sql)

## Insert
This will be used to add records to a table.

[Refer to example](insert.sql)

## Merge
This will be used to upsert (inserts if it does not exist, otherwise if it does, update / delete) records to a table.

[Refer to example](merge.sql)

## Note
Depending on which version of SQL you are using, the options may differ slightly.
