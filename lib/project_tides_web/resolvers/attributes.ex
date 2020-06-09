defmodule ProjectTidesWeb.Resolvers.Attributes do
  alias ProjectTides.{Attributes, Repo, Attributes.Tag}

  def tag(_, %{id: id}, _) do
    with {:ok, tag} <- Repo.fetch(Tag, id),
         do: {:ok, %{tag: tag}}
  end

  def tags(_, args, _) do
    {:ok, Attributes.list_tags(args)}
  end

  def search(_, %{matching: term}, _) do
    {:ok, Attributes.search(term)}
  end

  def tags_for_language(language, _, _) do
    query = Ecto.assoc(language, :tags)
    {:ok, Repo.all(query)}
  end

  def create_tag(_, %{input: params}, _) do
    with {:ok, tag} <- Attributes.create_tag(params) do
      {:ok, %{tag: tag}}
    end
  end

  def update_tag(_, %{id: id, input: params}, _) do
    with {:ok, tag} <- Repo.fetch(Tag, id),
         {:ok, tag} <- Attributes.update_tag(tag, params) do
      {:ok, %{tag: tag}}
    end
  end

  def delete_tag(_, %{id: id}, _) do
    with {:ok, tag} <- Repo.fetch(Tag, id),
         {:ok, tag} <- Attributes.delete_tag(tag) do
      {:ok, tag}
    end
  end
end
