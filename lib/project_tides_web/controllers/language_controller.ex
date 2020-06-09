defmodule ProjectTidesWeb.LanguageController do
  use ProjectTidesWeb, :controller

  alias ProjectTides.Settings
  alias ProjectTides.Settings.Language

  def index(conn, _params) do
    languages = Settings.list_languages()
    render(conn, "index.html", languages: languages)
  end

  def new(conn, _params) do
    changeset = Settings.change_language(%Language{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"language" => language_params}) do
    case Settings.create_language(language_params) do
      {:ok, language} ->
        conn
        |> put_flash(:info, "Language created successfully.")
        |> redirect(to: Routes.language_path(conn, :show, language))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    language = Settings.get_language!(id)
    render(conn, "show.html", language: language)
  end

  def edit(conn, %{"id" => id}) do
    language = Settings.get_language!(id)
    changeset = Settings.change_language(language)
    render(conn, "edit.html", language: language, changeset: changeset)
  end

  def update(conn, %{"id" => id, "language" => language_params}) do
    language = Settings.get_language!(id)

    case Settings.update_language(language, language_params) do
      {:ok, language} ->
        conn
        |> put_flash(:info, "Language updated successfully.")
        |> redirect(to: Routes.language_path(conn, :show, language))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", language: language, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    language = Settings.get_language!(id)
    {:ok, _language} = Settings.delete_language(language)

    conn
    |> put_flash(:info, "Language deleted successfully.")
    |> redirect(to: Routes.language_path(conn, :index))
  end
end
