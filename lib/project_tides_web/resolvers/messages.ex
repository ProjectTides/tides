defmodule ProjectTidesWeb.Resolvers.Messages do
  alias ProjectTides.{Messages, Repo, Messages.Message}
  alias ProjectTides.Communications.Message, as: Communications

  def message(_, %{id: id}, _) do
    with {:ok, message} <- Repo.fetch(Message, id),
         do: {:ok, %{message: message}}
  end

  def messages(_, args, _) do
    {:ok, Messages.list_messages(args)}
  end

  def create_message(_, %{input: params}, _) do
    with {:ok, message} <- Messages.create_message(params) do
      {:ok, %{message: message}}
    end
  end

  def send_message(_, %{input: params}, _) do
    with {:ok, message} <- Messages.create_message(params) do
      Repo.preload(message, [:recipient, :sender, :media])
      |> Communications.send_message()

      {:ok, %{message: message}}
    end
  end

  def update_message(_, %{id: id, input: params}, _) do
    with {:ok, message} <- Repo.fetch(Message, id),
         {:ok, message} <- Messages.update_message(message, params) do
      {:ok, %{message: message}}
    end
  end

  def delete_message(_, %{id: id}, _) do
    with {:ok, message} <- Repo.fetch(Message, id),
         {:ok, message} <- Messages.delete_message(message) do
      {:ok, message}
    end
  end
end
