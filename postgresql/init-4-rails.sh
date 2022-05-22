#!/bin/bash

psql -v -U "${POSTGRES_USER}" -d postgres <<-EOSQL
  CREATE ROLE "rails";
  CREATE DATABASE "rails";
  ALTER DATABASE "rails" OWNER TO "rails";
  GRANT ALL PRIVILEGES ON DATABASE "rails" TO "rails";
  ALTER ROLE "rails" LOGIN;
  ALTER ROLE "rails" PASSWORD 'rails';
EOSQL

psql -v -U "${POSTGRES_USER}" -d "rails" <<-EOSQL
  ALTER SCHEMA "public" OWNER TO "rails";
  GRANT ALL PRIVILEGES ON SCHEMA "public" TO "rails";
EOSQL