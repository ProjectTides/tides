defmodule ProjectTides.Content do
  @moduledoc """
  The Content context.
  """

  import Ecto.Query, warn: false
  alias ProjectTides.Repo

  alias ProjectTides.Content.SessionMessage

  @doc """
  Returns the list of session_messages.

  ## Examples

      iex> list_session_messages()
      [%SessionMessage{}, ...]

  """
  def list_session_messages do
    Repo.all(SessionMessage)
  end

  @doc """
  Gets a single session_message.

  Raises `Ecto.NoResultsError` if the Session message does not exist.

  ## Examples

      iex> get_session_message!(123)
      %SessionMessage{}

      iex> get_session_message!(456)
      ** (Ecto.NoResultsError)

  """
  def get_session_message!(id), do: Repo.get!(SessionMessage, id)

  @doc """
  Creates a session_message.

  ## Examples

      iex> create_session_message(%{field: value})
      {:ok, %SessionMessage{}}

      iex> create_session_message(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_session_message(attrs \\ %{}) do
    %SessionMessage{}
    |> SessionMessage.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a session_message.

  ## Examples

      iex> update_session_message(session_message, %{field: new_value})
      {:ok, %SessionMessage{}}

      iex> update_session_message(session_message, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_session_message(%SessionMessage{} = session_message, attrs) do
    session_message
    |> SessionMessage.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a session_message.

  ## Examples

      iex> delete_session_message(session_message)
      {:ok, %SessionMessage{}}

      iex> delete_session_message(session_message)
      {:error, %Ecto.Changeset{}}

  """
  def delete_session_message(%SessionMessage{} = session_message) do
    Repo.delete(session_message)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking session_message changes.

  ## Examples

      iex> change_session_message(session_message)
      %Ecto.Changeset{data: %SessionMessage{}}

  """
  def change_session_message(%SessionMessage{} = session_message, attrs \\ %{}) do
    SessionMessage.changeset(session_message, attrs)
  end
end
