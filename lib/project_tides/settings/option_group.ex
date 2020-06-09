defmodule ProjectTides.Settings.OptionGroup do
  use Ecto.Schema
  import Ecto.Changeset

  schema "option_groups" do
    field :name, :string
    field :label, :string
    field :description, :string
    field :data_type, :string
    field :is_active, :boolean, default: true
    field :is_reserved, :boolean, default: false
    field :is_locked, :boolean, default: false

    timestamps()
  end

  @doc false
  def changeset(option_group, attrs) do
    option_group
    |> cast(attrs, [:name, :label, :description, :data_type, :is_reserved, :is_active, :is_locked])
    |> validate_required([
      :name,
      :label,
      :description,
      :data_type,
      :is_reserved,
      :is_active,
      :is_locked
    ])
  end
end
