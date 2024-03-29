CALL raw.create_audit_insert_function_for_year(2019);

CREATE TRIGGER audit_insert_year_2019 
  AFTER INSERT 
  ON raw.year_2019
  FOR EACH ROW
  EXECUTE PROCEDURE raw.tr_audit_insert_year_2019();

CREATE OR REPLACE PROCEDURE migrate_year_2019()
  LANGUAGE plpgsql
  AS $$
BEGIN
  COPY raw.year_2019 (
    "happiness_rank",
    "country_or_region",
    "happiness_score",
    "gdp_per_capita",
    "social_support",
    "life_expectancy",
    "freedom",
    "generosity",
    "corruption"
  )
  FROM '/user-data/happiness/2019.csv'
  WITH (
    NULL 'N/A',
    FORMAT CSV,
    HEADER
  );
END;
$$;
