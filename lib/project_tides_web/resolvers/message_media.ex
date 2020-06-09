defmodule ProjectTidesWeb.Resolvers.MessageMedia do
  alias ProjectTides.{Repo, Messages, Messages.MessageMedia}

  def message_media(_, %{id: id}, _) do
    with {:ok, message_media} <- Repo.fetch(MessageMedia, id),
         do: {:ok, %{message_media: message_media}}
  end

  def message_medias(_, args, _) do
    {:ok, Messages.list_message_media(args)}
  end

  def create_message_media(_, %{input: params}, _) do
    with {:ok, message_media} <- Messages.create_message_media(params) do
      {:ok, %{message_media: message_media}}
    end
  end

  def update_message_media(_, %{id: id, input: params}, _) do
    with {:ok, message_media} <- Repo.fetch(MessageMedia, id),
         {:ok, message_media} <- Messages.update_message_media(message_media, params) do
      {:ok, %{message_media: message_media}}
    end
  end

  def delete_message_media(_, %{id: id}, _) do
    with {:ok, message_media} <- Repo.fetch(MessageMedia, id),
         {:ok, message_media} <- Messages.delete_message_media(message_media) do
      {:ok, message_media}
    end
  end
end
