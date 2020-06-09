defmodule ProjectTides.MessagesTags.MessageTag do
  use Ecto.Schema
  import Ecto.Changeset

  alias ProjectTides.{Attributes.Tag, Messages.Message}

  @required_fields [
    :message_id,
    :tag_id
  ]

  schema "messages_tags" do
    belongs_to :message, Message
    belongs_to :tag, Tag
  end

  @doc false
  def changeset(message, attrs) do
    message
    |> cast(attrs, @required_fields)
    |> validate_required(@required_fields)
  end

  def data() do
    Dataloader.Ecto.new(ProjectTides.Repo, query: &query/2)
  end

  def query(queryable, _params) do
    queryable
  end
end
