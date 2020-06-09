defmodule ProjectTidesWeb.PageController do
  use ProjectTidesWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end

  def hook(conn, _params) do
    json(conn, nil)
  end

  def handle(data, conn) do
    case data do
      {:ok, message} -> json(conn, message)
      {:error, message} -> json(conn, message)
      _ -> json(conn, data)
    end
  end

  def test(conn, _params) do
    handle([], conn)
  end
end
