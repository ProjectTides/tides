defmodule ProjectTides.Attributes.Tag do
  use Ecto.Schema
  import Ecto.Changeset

  alias ProjectTides.{Settings.Language, Attributes.Tag, Contacts.Contact, Messages.Message}

  schema "tags" do
    field :label, :string
    field :description, :string

    field :is_active, :boolean, default: false
    field :is_reserved, :boolean, default: false

    belongs_to :language, Language

    belongs_to :tags, Tag, foreign_key: :parent_id

    many_to_many :contacts, Contact, join_through: "contacts_tags", on_replace: :delete
    many_to_many :messages, Message, join_through: "messages_tags", on_replace: :delete

    timestamps()
  end

  @doc false
  def changeset(tag, attrs) do
    tag
    |> cast(attrs, [:label, :description, :is_reserved, :is_active, :language_id])
    |> validate_required([:label, :language_id])
    |> foreign_key_constraint(:language_id)
    |> foreign_key_constraint(:parent_id)
    |> unique_constraint([:label, :language_id])
  end

  def data() do
    Dataloader.Ecto.new(ProjectTides.Repo, query: &query/2)
  end

  def query(queryable, _params) do
    queryable
  end
end
