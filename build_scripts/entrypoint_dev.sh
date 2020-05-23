# entrypoint.sh

#!/bin/bash
# Docker entrypoint script.

# # Wait until Postgres is ready
while ! pg_isready -q -h $DATABASE_HOST -p $DATABASE_PORT -U $DATABASE_USER
do
  echo "$(date) - waiting for database to start"
  sleep 2
done

exec mix phx.server