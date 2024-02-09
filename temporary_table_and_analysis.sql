CREATE TEMPORARY TABLE analyzing_the_titanic_table (
    columns_name text,
    type_of_data text,    
    null_count integer,
    distinct_count integer,
    notnull_count integer,
    mean numeric,
    max numeric,
    min numeric,
    avg_character integer
);


DO $$ 
DECLARE 
    col_name text;
    col_type text;
BEGIN 
    FOR col_name IN (SELECT column_name FROM information_schema.columns WHERE table_name = 'titanic') 
    LOOP
        SELECT data_type INTO col_type
        FROM information_schema.columns 
        WHERE table_name = 'titanic' AND column_name = col_name;
		
        EXECUTE format('
            INSERT INTO analyzing_the_titanic_table (columns_name, null_count) 
            SELECT %L, COUNT(*) FROM titanic WHERE %I IS NULL',
            col_name, col_name);
            
        EXECUTE format('
            UPDATE analyzing_the_titanic_table
            SET distinct_count = (SELECT COUNT(DISTINCT %I) FROM titanic),
			notnull_count = (SELECT COUNT(*) FROM titanic WHERE %I IS NOT NULL)		   
            WHERE columns_name = %L',
            col_name, col_name,col_name);
			
		IF col_type IN ('text') THEN
			EXECUTE format('
				UPDATE analyzing_the_titanic_table
				SET avg_character = (SELECT AVG(CHAR_LENGTH(%I)) FROM 				(SELECT DISTINCT %I FROM titanic) AS subquery)
				WHERE columns_name = %L',
				col_name, col_name, col_name);
        END IF;
        IF col_type IN ('integer', 'numeric', 'double precision','bigint') THEN
            EXECUTE format('
                UPDATE analyzing_the_titanic_table
                SET mean = (SELECT AVG(%I::numeric) FROM titanic),
                    max = (SELECT MAX(%I::numeric) FROM titanic),
                    min = (SELECT MIN(%I::numeric) FROM titanic)
                WHERE columns_name = %L',
                col_name, col_name, col_name, col_name);
        END IF;
    END LOOP;
    EXECUTE format('
        UPDATE analyzing_the_titanic_table
        SET type_of_data = DATA_TYPE
        FROM INFORMATION_SCHEMA.COLUMNS 
        WHERE TABLE_NAME = %L AND analyzing_the_titanic_table.columns_name = INFORMATION_SCHEMA.COLUMNS.column_name',
        'titanic'); 
END $$;

SELECT * FROM analyzing_the_titanic_table;
