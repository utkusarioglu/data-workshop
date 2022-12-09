SELECT 
  *
FROM
  inflation
WHERE
  country_code in (
    'USA', 
    'TUR',
    'CHE',
    'DEU',
    'JPN'
  )
;
