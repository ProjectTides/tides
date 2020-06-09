defmodule ProjectTides.Messages.Message do
  use Ecto.Schema
  import Ecto.Changeset

  alias ProjectTides.{MessageStatusEnum, MessageTypesEnum, MessageFlowEnum}
  alias ProjectTides.{Contacts.Contact, Messages.MessageMedia, Attributes.Tag}

  @required_fields [
    :type,
    :flow,
    :wa_status,
    :sender_id,
    :recipient_id
  ]
  @optional_fields [
    :body,
    :wa_message_id,
    :media_id
  ]

  schema "messages" do
    field :body, :string
    field :flow, MessageFlowEnum
    field :type, MessageTypesEnum
    field :wa_message_id, :string
    field :wa_status, MessageStatusEnum

    belongs_to :sender, Contact
    belongs_to :recipient, Contact
    belongs_to :media, MessageMedia

    many_to_many :tags, Tag, join_through: "messages_tags", on_replace: :delete

    timestamps()
  end

  @doc false
  def changeset(message, attrs) do
    message
    |> cast(attrs, @required_fields ++ @optional_fields)
    |> validate_required(@required_fields)
  end

  def to_minimal_map(message) do
    Map.take(message, [:id | @required_fields])
  end

  def data() do
    Dataloader.Ecto.new(ProjectTides.Repo, query: &query/2)
  end

  def query(queryable, _params) do
    queryable
  end
end
