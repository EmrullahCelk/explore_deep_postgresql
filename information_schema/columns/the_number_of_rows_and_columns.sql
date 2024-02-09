SELECT
 (SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS WHERE table_name = 'titanic') AS number_of_columns,
 (SELECT COUNT(*) FROM titanic) AS number_of_rows