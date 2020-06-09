defmodule ProjectTides.Contacts.Contact do
  use Ecto.Schema
  import Ecto.Changeset

  alias ProjectTides.ContactStatusEnum
  alias ProjectTides.Attributes.Tag

  schema "contacts" do
    field :name, :string
    field :phone, :string
    field :wa_id, :string, default: nil

    field :status, ContactStatusEnum
    field :wa_status, ContactStatusEnum

    field :optin_time, :utc_datetime
    field :optout_time, :utc_datetime

    many_to_many :tags, Tag, join_through: "contacts_tags", on_replace: :delete

    timestamps()
  end

  @doc false
  def changeset(contact, attrs) do
    contact
    |> cast(attrs, [:name, :phone, :wa_status, :wa_id, :status, :optin_time, :optout_time])
    |> validate_required([:name, :phone])
    |> unique_constraint([:phone, :wa_id])
  end

  def data() do
    Dataloader.Ecto.new(ProjectTides.Repo, query: &query/2)
  end

  def query(queryable, _params) do
    queryable
  end
end
