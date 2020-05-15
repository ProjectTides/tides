# ProjectTides

### Project setup guide:
1. Duplicate `.env.example` and named it as `.env`.
2. Add the env variables. Few variables are docker specific and can be skipped.
    1. [POSTGRES_MULTIPLE_DATABASES, POSTGRES_ROLE]
3. Run `mix phx.gen.secret` to generate secret and add it to env variable `SECRET_KEY_BASE`

4. Database setup
    1. Dockerized project setup
        * `docker-compose config` Check if docker config and env variables are set properly. 
        * `docker-compose up -d` Start the container.
    2. Non-dockerized project setup
        * Create your application database manually.

5. Duplicate `dev.exs.example` and name it as `dev.exs`.
6. Duplicate `test.exs.example` and name it as `test.exs`.  
7. Run `mix setup`.
8. Run `mix phx.server`

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.
