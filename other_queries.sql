-- VIEWING NULL VALUES;
SELECT * FROM titanic WHERE "Parch" ISNULL;

--CALCULATING AVERAGES;
SELECT AVG("Age") FROM titanic;


-- SELECTING DATA FROM A TABLE AND ADDING A NEW CATEGORICAL COLUMN
SELECT *, 
       CASE 
          WHEN "Passengerid" = 1 THEN 'first_passenger'
          WHEN "Passengerid" = 2 THEN 'second_passenger'
          ELSE 'another_value'
       END AS new_categorical_column
FROM titanic;
 

-- CLASSIFICATION BY AGE CATEGORIES;
SELECT "Passengerid", 
       CASE 
          WHEN "Age" < 18 THEN 'child'
          WHEN "Age" >= 18 AND "Age" <= 30 THEN 'Young'
          ELSE 'Adult'
       END AS age_category
FROM titanic;
