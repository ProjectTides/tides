defmodule ProjectTidesWeb.Router do
  use ProjectTidesWeb, :router
  use Pow.Phoenix.Router

  use Pow.Extension.Phoenix.Router,
    extensions: [PowResetPassword, PowEmailConfirmation]

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  pipeline :protected do
    plug Pow.Plug.RequireAuthenticated,
      error_handler: Pow.Phoenix.PlugErrorHandler
  end

  scope "/" do
    pipe_through :browser

    pow_routes()
    pow_extension_routes()
  end

  scope "/", ProjectTidesWeb do
    pipe_through [:browser, :protected]

    # Add protected routes here
  end

  scope "/", ProjectTidesWeb do
    pipe_through :browser

    get "/", PageController, :index

    get "/test-outbound", PageController, :test

    resources "/option_groups", OptionGroupController
    resources "/option_values", OptionValueController
    resources "/languages", LanguageController
    resources "/tags", TagController
    resources "/session_messages", SessionMessageController

    resources "/contacts", ContactController
    resources "/message_media", MessageMediaController
    resources "/messages", MessageController
  end

  # Other scopes may use custom stacks.
  scope "/" do
    pipe_through :api

    forward "/api", Absinthe.Plug, schema: ProjectTidesWeb.Schema

    forward "/graphiql", Absinthe.Plug.GraphiQL,
      schema: ProjectTidesWeb.Schema,
      interface: :simple,
      socket: ProjectTidesWeb.UserSocket
  end

  scope "/", ProjectTidesWeb do
    forward("/gupshup", Plugs.GupshupShunt)
  end

  # Enables LiveDashboard only for development
  #
  # If you want to use the LiveDashboard in production, you should put
  # it behind authentication and allow only admins to access it.
  # If your application does not have an admins-only section yet,
  # you can use Plug.BasicAuth to set up some basic authentication
  # as long as you are also using SSL (which you should anyway).
  if Mix.env() in [:dev, :test] do
    import Phoenix.LiveDashboard.Router

    scope "/" do
      pipe_through :browser
      live_dashboard "/dashboard", metrics: ProjectTidesWeb.Telemetry
    end
  end
end
