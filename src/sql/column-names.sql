-- RETRIEVES THE COLUMN NAMES FOR THE INFLATION TABLE
SELECT
  column_name
FROM
  information_schema.columns
WHERE
  table_name = 'inflation'
;
