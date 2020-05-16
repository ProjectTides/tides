use Mix.Config

# Configure your database
#
# The MIX_TEST_PARTITION environment variable can be used
# to provide built-in test partitioning in CI environment.
# Run `mix help test` for more information.
config :project_tides, ProjectTides.Repo,
  username: "user1",
  password: "pass1",
  # database: "project_tides_test#{System.get_env("MIX_TEST_PARTITION")}",
  database: "testdb",
  hostname: "localhost",
  pool: Ecto.Adapters.SQL.Sandbox,
  port: 5460

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :project_tides, ProjectTidesWeb.Endpoint,
  http: [port: 4002],
  server: false

# Print only warnings and errors during test
config :logger, level: :warn
