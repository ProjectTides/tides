defmodule ProjectTidesWeb.MessageMediaController do
  use ProjectTidesWeb, :controller

  alias ProjectTides.Messages
  alias ProjectTides.Messages.MessageMedia

  def index(conn, _params) do
    message_media = Messages.list_message_media()
    render(conn, "index.html", message_media: message_media)
  end

  def new(conn, _params) do
    changeset = Messages.change_message_media(%MessageMedia{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"message_media" => message_media_params}) do
    case Messages.create_message_media(message_media_params) do
      {:ok, message_media} ->
        conn
        |> put_flash(:info, "Message media created successfully.")
        |> redirect(to: Routes.message_media_path(conn, :show, message_media))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    message_media = Messages.get_message_media!(id)
    render(conn, "show.html", message_media: message_media)
  end

  def edit(conn, %{"id" => id}) do
    message_media = Messages.get_message_media!(id)
    changeset = Messages.change_message_media(message_media)
    render(conn, "edit.html", message_media: message_media, changeset: changeset)
  end

  def update(conn, %{"id" => id, "message_media" => message_media_params}) do
    message_media = Messages.get_message_media!(id)

    case Messages.update_message_media(message_media, message_media_params) do
      {:ok, message_media} ->
        conn
        |> put_flash(:info, "Message media updated successfully.")
        |> redirect(to: Routes.message_media_path(conn, :show, message_media))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", message_media: message_media, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    message_media = Messages.get_message_media!(id)
    {:ok, _message_media} = Messages.delete_message_media(message_media)

    conn
    |> put_flash(:info, "Message media deleted successfully.")
    |> redirect(to: Routes.message_media_path(conn, :index))
  end
end
