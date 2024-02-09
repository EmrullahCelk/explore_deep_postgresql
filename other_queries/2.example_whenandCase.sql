-- CLASSIFICATION BY AGE CATEGORIES;
SELECT "Passengerid", 
       CASE 
          WHEN "Age" < 18 THEN 'child'
          WHEN "Age" >= 18 AND "Age" <= 30 THEN 'Young'
          ELSE 'Adult'
       END AS age_category
FROM titanic;

