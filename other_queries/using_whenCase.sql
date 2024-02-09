-- SELECTING DATA FROM A TABLE AND ADDING A NEW CATEGORICAL COLUMN
SELECT *, 
       CASE 
          WHEN "Passengerid" = 1 THEN 'first_passenger'
          WHEN "Passengerid" = 2 THEN 'second_passenger'
          ELSE 'another_value'
       END AS new_categorical_column
FROM titanic;