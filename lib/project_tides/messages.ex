defmodule ProjectTides.Messages do
  @moduledoc """
  The Messages context.
  """

  import Ecto.Query, warn: false
  alias ProjectTides.Repo

  alias ProjectTides.Messages.Message

  @doc """
  Returns the list of messages.

  ## Examples

      iex> list_messages()
      [%Message{}, ...]

  """
  def list_messages(args \\ %{}) do
    args
    |> Enum.reduce(Message, fn
      {:order, order}, query ->
        query |> order_by({^order, :id})

      {:filter, filter}, query ->
        query |> filter_with(filter)
    end)
    |> Repo.all()
  end

  defp filter_with(query, filter) do
    Enum.reduce(filter, query, fn
      {:body, body}, query ->
        from q in query, where: ilike(q.body, ^"%#{body}%")

      {:sender, sender}, query ->
        from q in query,
          join: c in assoc(q, :sender),
          where: ilike(c.name, ^"%#{sender}%")

      {:sender_id, sender_id}, query ->
        from q in query,
          join: c in assoc(q, :sender),
          where: c.id == ^sender_id

      {:recipient_id, recipient_id}, query ->
        from q in query,
          join: c in assoc(q, :recipient),
          where: c.id == ^recipient_id

      {:recipient, recipient}, query ->
        from q in query,
          join: c in assoc(q, :recipient),
          where: ilike(c.name, ^"%#{recipient}%")

      {:either, phone}, query ->
        from q in query,
          join: s in assoc(q, :sender),
          join: r in assoc(q, :receiver),
          where: ilike(s.phone, ^"%#{phone}%") or ilike(r.phone, ^"%#{phone}%")

      {:wa_status, wa_status}, query ->
        from q in query, where: q.wa_status == ^wa_status
    end)
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
  def get_message!(id),
    do: Repo.get!(Message, id)

  def get_message_all!(id),
    do:
      Repo.get!(Message, id)
      |> Repo.preload([:recipient, :sender, :media])

  @doc """
  Creates a message.

  ## Examples

      iex> create_message(%{field: value})
      {:ok, %Message{}}

      iex> create_message(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_message(attrs \\ %{}) do
    # Merge default values if not present in attributes
    attrs =
      %{flow: :inbound, wa_status: :delivered}
      |> Map.merge(attrs)

    %Message{}
    |> Message.changeset(attrs)
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
  def update_message(%Message{} = message, attrs) do
    message
    |> Message.changeset(attrs)
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
  def delete_message(%Message{} = message) do
    Repo.delete(message)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking message changes.

  ## Examples

      iex> change_message(message)
      %Ecto.Changeset{data: %Message{}}

  """
  def change_message(%Message{} = message, attrs \\ %{}) do
    Message.changeset(message, attrs)
  end

  alias ProjectTides.Messages.MessageMedia

  @doc """
  Returns the list of message_media.

  ## Examples

      iex> list_message_media()
      [%MessageMedia{}, ...]

  """
  def list_message_media(args \\ %{}) do
    args
    |> Repo.all(MessageMedia)
  end

  @doc """
  Gets a single message_media.

  Raises `Ecto.NoResultsError` if the Message media does not exist.

  ## Examples

      iex> get_message_media!(123)
      %MessageMedia{}

      iex> get_message_media!(456)
      ** (Ecto.NoResultsError)

  """
  def get_message_media!(id), do: Repo.get!(MessageMedia, id)

  @doc """
  Creates a message_media.

  ## Examples

      iex> create_message_media(%{field: value})
      {:ok, %MessageMedia{}}

      iex> create_message_media(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_message_media(attrs \\ %{}) do
    %MessageMedia{}
    |> MessageMedia.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a message_media.

  ## Examples

      iex> update_message_media(message_media, %{field: new_value})
      {:ok, %MessageMedia{}}

      iex> update_message_media(message_media, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_message_media(%MessageMedia{} = message_media, attrs) do
    message_media
    |> MessageMedia.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a message_media.

  ## Examples

      iex> delete_message_media(message_media)
      {:ok, %MessageMedia{}}

      iex> delete_message_media(message_media)
      {:error, %Ecto.Changeset{}}

  """
  def delete_message_media(%MessageMedia{} = message_media) do
    Repo.delete(message_media)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking message_media changes.

  ## Examples

      iex> change_message_media(message_media)
      %Ecto.Changeset{data: %MessageMedia{}}

  """
  def change_message_media(%MessageMedia{} = message_media, attrs \\ %{}) do
    MessageMedia.changeset(message_media, attrs)
  end
end
