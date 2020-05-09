#!/bin/bash
# docker entrypoint script.

# assign a default for the database_user
DB_USER=${DATABASE_USER:-postgres}

# wait until Postgres is ready
while ! pg_isready -q -h db -p 5432 -U postgres
do
  echo "$(date) - waiting for database to start"
  echo DATABASE_USER
  sleep 2
done

bin="/app/bin/project_tides"
eval "$bin eval \"ProjectTides.Release.migrate\""
# start the elixir application
exec "$bin" "start"
