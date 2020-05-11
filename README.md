# ProjectTides

To start your Phoenix server:
  * Check if docker config is set properly `docker-compose config`
  * Setup the project with `docker-compose up -d`
  * Setup the project with `mix setup`
  * Start Phoenix endpoint with `mix phx.server`

  Some other useful docker commands
  * `docker-compose down`           To destroy/remove container completly.
  * `docker-compose stop`           To stop the server.
  * `docker container ls`           To see the list of running container.
  * `docker logs <CONTAINER ID>`    To see the logs.
  * `docker compose build`          Only if there is any change in docker files.

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.

Ready to run in production? 
  * Dockerized env? 
  * Otherwise please [check our deployment guides](https://hexdocs.pm/phoenix/deployment.html).