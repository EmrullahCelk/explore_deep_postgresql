# EXPLORE DEEP İN POSTGRESQL:
## information_schema, Procedural Programming, Temporary Tables, and More

This repository contains SQL queries to analyze a database table. The analyses were performed on a table named Titanic.

## Contents of the Files

- `information_schema`:
  - `columns`:
    - `data_types_of_columns.sql`: Lists the data types of columns in the Titanic table.
    - `details_of_a_specific_column.sql`: Lists details of a specific column.
    - `the_number_of_rows_and_columns.sql`: Lists the number of columns and rows in the Titanic table.
  - `schemata`:
    - `details_of_a_schema.sql`: Lists details of a specific schema.
    - `listing_all_schemas.sql`: Lists all schemas.
  - `table`:
    - `details_of_a_specific_table.sql`: Lists details of a specific table.
    - `the_name_and_schema_of_a_specific_table.sql`: Lists the name and schema of a specific table.
  - `triggers`:
    - `listing_all_triggers_for_a_specific_table.sql`: Lists all triggers for a specific table.
- `other_queries`:
  - `calculating_avg.sql`: Calculates the average age in the Titanic table.
  - `null_values.sql`: Lists rows containing null values.
  - `using_whenCase.sql`: Selects data from a table and adds a new categorical column.
  - `whenCase_using.sql`: Classifies by age categories.
- `temporary_table_and_analysis.sql`: Creates a temporary table and analyzes the Titanic table.

## How to Use?

1. Clone this repository to your local machine.
2. Ensure you have a PostgreSQL database set up.
3. Run each SQL file using a PostgreSQL client or command line interface connected to your database.
4. Review the analysis results obtained from the temporary table created by `temporary_table_and_analysis.sql`.

## License

This project is licensed under the MIT License


