# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :project_tides,
  ecto_repos: [ProjectTides.Repo],
  bsp: ProjectTides.Communications.BSP.Gupshup,
  bsp_id: "gupshup-bsp-23",
  bsp_limit: 10

# Configures the endpoint
config :project_tides, ProjectTidesWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "m5NAUz+7SssCglFHfCYDCBAqe/iwFTxVjiPpJeIknyFw5br6HfYcPub9IzDIpYis",
  render_errors: [view: ProjectTidesWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: ProjectTides.PubSub,
  live_view: [signing_salt: "r3mbo+aV"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

config :absinthe,
  log: true

# Configure to use UTC timestamp in tables
config :project_tides,
       ProjectTides.Repo,
       migration_timestamps: [type: :utc_datetime]

config :project_tides, :pow,
  user: ProjectTides.Users.User,
  repo: ProjectTides.Repo,
  web_module: ProjectTidesWeb,
  extensions: [PowResetPassword, PowEmailConfirmation],
  controller_callbacks: Pow.Extension.Phoenix.ControllerCallbacks,
  mailer_backend: ProjectTidesWeb.Pow.Mailer,
  web_mailer_module: ProjectTidesWeb

config :tesla, adapter: Tesla.Adapter.Hackney

config :project_tides, Oban,
  repo: ProjectTides.Repo,
  prune: {:maxlen, 10_000},
  queues: [default: 10, gupshup: 10, webhook: 10]

# Import environment specific config. This must remain at the bottom

# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
