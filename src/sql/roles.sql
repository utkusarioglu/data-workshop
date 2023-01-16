CREATE ROLE g_all_reader 
  NOCREATEDB
  NOCREATEROLE
  IN GROUP g_inflation_readonly, g_happiness_readonly
;

CREATE ROLE grafana_reader
  LOGIN
  CONNECTION LIMIT 10
  ENCRYPTED PASSWORD 'grafana_reader'
  IN GROUP g_all_reader
;
