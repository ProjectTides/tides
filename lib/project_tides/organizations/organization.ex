defmodule ProjectTides.Organizations.Organization do
  use Ecto.Schema
  import Ecto.Changeset

  alias ProjectTides.Organizations.BSP

  schema "organizations" do
    field :name, :string
    field :contact_name, :string
    field :email, :string
    field :wa_number, :string
    field :bsp_key, :string
    belongs_to :bsp, BSP

    timestamps()
  end

  @doc false
  def changeset(organization, attrs) do
    organization
    |> cast(attrs, [
      :name,
      :contact_name,
      :email,
      :bsp_id,
      :bsp_key,
      :wa_number
    ])
    |> validate_required([
      :name,
      :contact_name,
      :email,
      :bsp_id,
      :bsp_key,
      :wa_number
    ])
  end

  def data() do
    Dataloader.Ecto.new(ProjectTides.Repo, query: &query/2)
  end

  def query(queryable, _params) do
    queryable
  end
end
