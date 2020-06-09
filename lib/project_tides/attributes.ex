defmodule ProjectTides.Attributes do
  @moduledoc """
  The Attributes context.
  """

  import Ecto.Query, warn: false
  alias ProjectTides.Repo

  alias ProjectTides.Attributes.Tag

  @doc """
  Returns the list of tags.

  ## Examples

      iex> list_tags()
      [%Tag{}, ...]

  """
  def list_tags(args \\ %{}) do
    args
    |> Enum.reduce(Tag, fn
      {:order, order}, query ->
        query |> order_by({^order, :label})

      {:filter, filter}, query ->
        query |> filter_with(filter)
    end)
    |> Repo.all()
  end

  defp filter_with(query, filter) do
    Enum.reduce(filter, query, fn
      {:label, label}, query ->
        from q in query, where: ilike(q.label, ^"%#{label}%")

      {:language, language}, query ->
        from q in query,
          join: l in assoc(q, :language),
          where: ilike(l.label, ^"%#{language}%")
    end)
  end

  @doc """
  Gets a single tag.

  Raises `Ecto.NoResultsError` if the Tag does not exist.

  ## Examples

      iex> get_tag!(123)
      %Tag{}

      iex> get_tag!(456)
      ** (Ecto.NoResultsError)

  """
  def get_tag!(id), do: Repo.get!(Tag, id)

  @doc """
  Creates a tag.

  ## Examples

      iex> create_tag(%{field: value})
      {:ok, %Tag{}}

      iex> create_tag(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_tag(attrs \\ %{}) do
    %Tag{}
    |> Tag.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a tag.

  ## Examples

      iex> update_tag(tag, %{field: new_value})
      {:ok, %Tag{}}

      iex> update_tag(tag, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_tag(%Tag{} = tag, attrs) do
    tag
    |> Tag.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a tag.

  ## Examples

      iex> delete_tag(tag)
      {:ok, %Tag{}}

      iex> delete_tag(tag)
      {:error, %Ecto.Changeset{}}

  """
  def delete_tag(%Tag{} = tag) do
    tag
    |> Tag.changeset(%{})
    |> Repo.delete()
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking tag changes.

  ## Examples

      iex> change_tag(tag)
      %Ecto.Changeset{data: %Tag{}}

  """
  def change_tag(%Tag{} = tag, attrs \\ %{}) do
    Tag.changeset(tag, attrs)
  end

  @search [Tag, Language]
  def search(term) do
    pattern = "%#{term}%"
    Enum.flat_map(@search, &search_ecto(&1, pattern))
  end

  defp search_ecto(ecto_schema, pattern) do
    Repo.all(
      from q in ecto_schema,
        where: ilike(q.label, ^pattern) or ilike(q.description, ^pattern)
    )
  end
end
