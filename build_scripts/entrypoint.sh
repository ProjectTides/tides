#!/bin/bash
# docker entrypoint script.

# assign a default for the database_user / role
# DB_ROLE=${DATABASE_ROLE:-postgres}
# DB_HOST=${DATABASE_HOST:-db}

# # wait until Postgres is ready
# while ! pg_isready -q -h $DB_HOST -p 5432 -U $DB_ROLE
# do
#   echo "$(date) - waiting for database to start"
#   sleep 2
# done

bin="/app/bin/project_tides"
eval "$bin eval \"ProjectTides.Release.migrate\""
# start the elixir application
exec "$bin" "start"
