DECLARE target_year := year_1971;
SELECT
  country_name,
  country_code,
  VAR(target_year)
FROM
  inflation
WHERE
  target_year IS NOT NULL
ORDER BY
  target_year DESC
LIMIT 
  3
;
