defmodule ProjectTidesWeb.Schema.BSPTypes do
  use Absinthe.Schema.Notation

  alias ProjectTidesWeb.{Resolvers}

  object :bsp_result do
    field :bsp, :bsp
    field :errors, list_of(:input_error)
  end

  object :bsp do
    field :id, :id
    field :name, :string
    field :url, :string
    field :api_end_point, :string
  end

  @desc "Filtering options for bsps"
  input_object :bsp_filter do
    @desc "Match the name"
    field :name, :string
    field :url, :string
    field :api_end_point, :string
  end

  input_object :bsp_input do
    field :name, :string
    field :url, :string
    field :api_end_point, :string
  end

  object :bsp_queries do
    @desc "get the details of one bsp"
    field :bsp, :bsp_result do
      arg(:id, non_null(:id))
      resolve(&Resolvers.Organizations.bsp/3)
    end

    @desc "Get a list of all bsps filtered by various criteria"
    field :bsps, list_of(:bsp) do
      arg(:filter, :bsp_filter)
      arg(:order, type: :sort_order, default_value: :asc)
      resolve(&Resolvers.Organizations.bsps/3)
    end
  end

  object :bsp_mutations do
    field :create_bsp, :bsp_result do
      arg(:input, non_null(:bsp_input))
      resolve(&Resolvers.Organizations.create_bsp/3)
    end

    field :update_bsp, :bsp_result do
      arg(:id, non_null(:id))
      arg(:input, :bsp_input)
      resolve(&Resolvers.Organizations.update_bsp/3)
    end

    field :delete_bsp, :bsp_result do
      arg(:id, non_null(:id))
      resolve(&Resolvers.Organizations.delete_bsp/3)
    end
  end
end
