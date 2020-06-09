defmodule ProjectTidesWeb.OptionValueController do
  use ProjectTidesWeb, :controller

  alias ProjectTides.Settings
  alias ProjectTides.Settings.OptionValue

  def index(conn, _params) do
    option_values = Settings.list_option_values()
    render(conn, "index.html", option_values: option_values)
  end

  def new(conn, _params) do
    changeset = Settings.change_option_value(%OptionValue{})

    option_groups = Settings.list_option_groups()

    render(conn, "new.html", changeset: changeset, option_groups: option_groups)
  end

  def create(conn, %{"option_value" => option_value_params}) do
    case Settings.create_option_value(option_value_params) do
      {:ok, option_value} ->
        conn
        |> put_flash(:info, "Option value created successfully.")
        |> redirect(to: Routes.option_value_path(conn, :show, option_value))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    option_value = Settings.get_option_value!(id)
    render(conn, "show.html", option_value: option_value)
  end

  def edit(conn, %{"id" => id}) do
    option_value = Settings.get_option_value!(id)
    changeset = Settings.change_option_value(option_value)
    render(conn, "edit.html", option_value: option_value, changeset: changeset)
  end

  def update(conn, %{"id" => id, "option_value" => option_value_params}) do
    option_value = Settings.get_option_value!(id)

    case Settings.update_option_value(option_value, option_value_params) do
      {:ok, option_value} ->
        conn
        |> put_flash(:info, "Option value updated successfully.")
        |> redirect(to: Routes.option_value_path(conn, :show, option_value))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", option_value: option_value, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    option_value = Settings.get_option_value!(id)
    {:ok, _option_value} = Settings.delete_option_value(option_value)

    conn
    |> put_flash(:info, "Option value deleted successfully.")
    |> redirect(to: Routes.option_value_path(conn, :index))
  end
end
