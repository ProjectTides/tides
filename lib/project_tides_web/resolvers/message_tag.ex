defmodule ProjectTidesWeb.Resolvers.MessageTag do
  alias ProjectTides.{Repo, MessagesTags, MessagesTags.MessageTag}

  def message_tag(_, %{id: id}, _) do
    with {:ok, message_tag} <- Repo.fetch(MessageTag, id),
         do: {:ok, %{message_tag: message_tag}}
  end

  def message_tags(_, args, _) do
    {:ok, MessagesTags.list_messages_tags(args)}
  end

  def create_message_tag(_, %{input: params}, _) do
    with {:ok, message_tag} <- MessagesTags.create_message_tag(params) do
      {:ok, %{message_tag: message_tag}}
    end
  end

  def update_message_tag(_, %{id: id, input: params}, _) do
    with {:ok, message_tag} <- Repo.fetch(MessageTag, id),
         {:ok, message_tag} <- MessagesTags.update_message_tag(message_tag, params) do
      {:ok, %{message_tag: message_tag}}
    end
  end

  def delete_message_tag(_, %{id: id}, _) do
    with {:ok, message_tag} <- Repo.fetch(MessageTag, id),
         {:ok, message_tag} <- MessagesTags.delete_message_tag(message_tag) do
      {:ok, message_tag}
    end
  end
end
