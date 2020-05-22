# entrypoint.sh

#!/bin/bash
# Docker entrypoint script.

# # Wait until Postgres is ready
# while ! pg_isready -q -h db -U main_db
# do
#   echo "$(date) - waiting for database to start"
#   sleep 2
# done

# # # Create, migrate, and seed database if it doesn't exist.
# # if [[ -z `psql -Atqc "\\list $PGDATABASE"` ]]; then
# #   echo "Database $PGDATABASE does not exist. Creating..."
# #   createdb -E UTF8 $PGDATABASE -l en_US.UTF-8 -T template0
# #   mix ecto.migrate
# # #   mix run priv/repo/seeds.exs
# #   echo "Database $PGDATABASE created."
# # fi


# Create, migrate, and seed database if it doesn't exist.
# Create, migrate, and seed database if it doesn't exist.
# if [[ -z `psql -Atqc "\\list $POSTGRES_DB"` ]]; then
#   echo "Database $POSTGRES_DB does not exist. Creating..."
#   createdb -E UTF8 $POSTGRES_DB -l en_US.UTF-8 -T template0
# #   mix ecto.migrate
# #   mix run priv/repo/seeds.exs
#   echo "Database $POSTGRES_DB created."
# fi

# while ! pg_isready -q -h $POSTGRES_HOST -p $POSTGRES_PORT -U postgres
# do
#   echo "$(date) - waiting for database to start"
#   sleep 2
# done

# # Create, migrate, and seed database if it doesn't exist.
# if [[ -z `psql -Atqc "\\list $POSTGRES_DB"` ]]; then
#   echo "Database $POSTGRES_DB does not exist. Creating..."
#   createdb -E UTF8 $POSTGRES_DB -l en_US.UTF-8 -T template0
#   mix ecto.migrate
#   mix run priv/repo/seeds.exs
#   echo "Database $POSTGRES_DB created."
# fi

exec mix phx.server