defmodule ProjectTides.Settings.OptionValue do
  use Ecto.Schema
  import Ecto.Changeset

  schema "option_values" do
    field :label, :string
    field :value, :string
    field :weight, :integer
    field :description, :string
    field :filter, :integer
    field :grouping, :string
    field :is_optgroup, :boolean, default: false
    field :is_default, :boolean, default: false
    field :is_active, :boolean, default: true
    field :is_reserved, :boolean, default: false

    timestamps()

    belongs_to :option_group, ProjectTides.Settings.OptionGroup
  end

  @doc false
  def changeset(option_value, attrs) do
    option_value
    |> cast(attrs, [
      :label,
      :description,
      :value,
      :grouping,
      :filter,
      :weight,
      :is_default,
      :is_optgroup,
      :is_reserved,
      :is_active,
      :option_group_id
    ])
    |> validate_required([
      :label,
      :description,
      :value,
      :grouping,
      :filter,
      :weight,
      :is_default,
      :is_optgroup,
      :is_reserved,
      :is_active,
      :option_group_id
    ])
  end
end
