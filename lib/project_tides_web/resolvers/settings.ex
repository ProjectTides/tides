defmodule ProjectTidesWeb.Resolvers.Settings do
  alias ProjectTides.{Repo, Settings, Settings.Language}
  alias ProjectTides.Attributes

  def languages(_, args, _) do
    {:ok, Settings.list_languages(args)}
  end

  def search(_, %{matching: term}, _) do
    {:ok, Attributes.search(term)}
  end

  def create_language(_, %{input: params}, _) do
    with {:ok, language} <- Settings.create_language(params) do
      {:ok, %{language: language}}
    end
  end

  def update_language(_, %{id: id, input: params}, _) do
    with {:ok, language} <- Repo.fetch(Language, id),
         {:ok, language} <- Settings.update_language(language, params) do
      {:ok, %{language: language}}
    end
  end
end
