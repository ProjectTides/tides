defmodule ProjectTidesWeb.SessionMessageController do
  use ProjectTidesWeb, :controller
  # use ProjectTides.WhatsApp.Message

  alias ProjectTides.Content
  alias ProjectTides.Content.SessionMessage

  def index(conn, _params) do
    session_messages = Content.list_session_messages()
    render(conn, "index.html", session_messages: session_messages)
  end

  def new(conn, _params) do
    changeset = Content.change_session_message(%SessionMessage{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"session_message" => session_message_params}) do
    # send_message(session_message_params["body"], "919917443994")
    index(conn, session_message_params)
    # case Content.create_session_message(session_message_params) do
    #   {:ok, session_message} ->
    #     conn
    #     |> put_flash(:info, "Session message created successfully.")
    #     |> redirect(to: Routes.session_message_path(conn, :show, session_message))

    #   {:error, %Ecto.Changeset{} = changeset} ->
    #     render(conn, "new.html", changeset: changeset)
    # end
  end

  def show(conn, %{"id" => id}) do
    session_message = Content.get_session_message!(id)
    render(conn, "show.html", session_message: session_message)
  end

  def edit(conn, %{"id" => id}) do
    session_message = Content.get_session_message!(id)
    changeset = Content.change_session_message(session_message)
    render(conn, "edit.html", session_message: session_message, changeset: changeset)
  end

  def update(conn, %{"id" => id, "session_message" => session_message_params}) do
    session_message = Content.get_session_message!(id)

    case Content.update_session_message(session_message, session_message_params) do
      {:ok, session_message} ->
        conn
        |> put_flash(:info, "Session message updated successfully.")
        |> redirect(to: Routes.session_message_path(conn, :show, session_message))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", session_message: session_message, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    session_message = Content.get_session_message!(id)
    {:ok, _session_message} = Content.delete_session_message(session_message)

    conn
    |> put_flash(:info, "Session message deleted successfully.")
    |> redirect(to: Routes.session_message_path(conn, :index))
  end
end
