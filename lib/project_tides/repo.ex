defmodule ProjectTides.Repo do
  use Ecto.Repo,
    otp_app: :project_tides,
    adapter: Ecto.Adapters.Postgres

  def fetch(queryable, id, opts \\ []) do
    case get(queryable, id, opts) do
      nil -> {:error, ["#{queryable} #{id}", "Resource not found"]}
      resource -> {:ok, resource}
    end
  end

  def fetch_by(queryable, clauses, opts \\ []) do
    case get_by(queryable, clauses, opts) do
      nil -> {:error, "Resource not found"}
      resource -> {:ok, resource}
    end
  end
end
