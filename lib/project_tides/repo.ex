defmodule ProjectTides.Repo do
  use Ecto.Repo,
    otp_app: :project_tides,
    adapter: Ecto.Adapters.Postgres
end
