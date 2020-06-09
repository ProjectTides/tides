defmodule ProjectTidesWeb.OptionGroupController do
  use ProjectTidesWeb, :controller

  alias ProjectTides.Settings
  alias ProjectTides.Settings.OptionGroup

  def index(conn, _params) do
    option_groups = Settings.list_option_groups()
    render(conn, "index.html", option_groups: option_groups)
  end

  def new(conn, _params) do
    changeset = Settings.change_option_group(%OptionGroup{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"option_group" => option_group_params}) do
    case Settings.create_option_group(option_group_params) do
      {:ok, option_group} ->
        conn
        |> put_flash(:info, "Option group created successfully.")
        |> redirect(to: Routes.option_group_path(conn, :show, option_group))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    option_group = Settings.get_option_group!(id)
    render(conn, "show.html", option_group: option_group)
  end

  def edit(conn, %{"id" => id}) do
    option_group = Settings.get_option_group!(id)
    changeset = Settings.change_option_group(option_group)
    render(conn, "edit.html", option_group: option_group, changeset: changeset)
  end

  def update(conn, %{"id" => id, "option_group" => option_group_params}) do
    option_group = Settings.get_option_group!(id)

    case Settings.update_option_group(option_group, option_group_params) do
      {:ok, option_group} ->
        conn
        |> put_flash(:info, "Option group updated successfully.")
        |> redirect(to: Routes.option_group_path(conn, :show, option_group))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", option_group: option_group, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    option_group = Settings.get_option_group!(id)
    {:ok, _option_group} = Settings.delete_option_group(option_group)

    conn
    |> put_flash(:info, "Option group deleted successfully.")
    |> redirect(to: Routes.option_group_path(conn, :index))
  end
end
