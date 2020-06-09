defmodule ProjectTides.MessagesTags do
  @moduledoc """
  The Messages context.
  """

  import Ecto.Query, warn: false
  alias ProjectTides.Repo
  alias ProjectTides.MessagesTags.MessageTag

  @doc """
  Returns the list of messages.

  ## Examples

      iex> list_messages()
      [%Message{}, ...]

  """
  def list_messages_tags(args \\ %{}) do
    args
    |> Repo.all(MessageTag)
  end

  @doc """
  Gets a single message.

  Raises `Ecto.NoResultsError` if the Message does not exist.

  ## Examples

      iex> get_message!(123)
      %Message{}

      iex> get_message!(456)
      ** (Ecto.NoResultsError)

  """
  def get_message_tag!(id),
    do: Repo.get!(MessageTag, id)

  def get_message_tag_all!(id),
    do:
      Repo.get!(MessageTag, id)
      |> Repo.preload([:recipient, :sender, :media])

  @doc """
  Creates a message.

  ## Examples

      iex> create_message(%{field: value})
      {:ok, %Message{}}

      iex> create_message(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_message_tag(attrs \\ %{}) do
    # Merge default values if not present in attributes
    %MessageTag{}
    |> MessageTag.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a message.

  ## Examples

      iex> update_message(message, %{field: new_value})
      {:ok, %Message{}}

      iex> update_message(message, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_message_tag(%MessageTag{} = message_tag, attrs) do
    message_tag
    |> MessageTag.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a message.

  ## Examples

      iex> delete_message(message)
      {:ok, %Message{}}

      iex> delete_message(message)
      {:error, %Ecto.Changeset{}}

  """
  def delete_message_tag(%MessageTag{} = message_tag) do
    Repo.delete(message_tag)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking message changes.

  ## Examples

      iex> change_message(message)
      %Ecto.Changeset{data: %Message{}}

  """
  def change_message(%MessageTag{} = message_tag, attrs \\ %{}) do
    MessageTag.changeset(message_tag, attrs)
  end
end
