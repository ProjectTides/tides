defmodule ProjectTidesWeb.Schema.EnumTypes do
  use Absinthe.Schema.Notation

  require ProjectTides.Enums

  # define all enums specifically for absinthere
  @desc "API Function Status enum"
  enum(:api_status_enum, values: ProjectTides.Enums.api_status_const())

  @desc "The Contact Status enum"
  enum(:contact_status_enum, values: ProjectTides.Enums.contact_status_const())

  @desc "The Message Flow enum"
  enum(:message_flow_enum, values: ProjectTides.Enums.message_flow_const())

  @desc "The Message Status enum"
  enum(:message_status_enum, values: ProjectTides.Enums.message_status_const())

  @desc "The Message Types enum"
  enum(:message_types_enum, values: ProjectTides.Enums.message_types_const())

  @desc "Enum for ordering results"
  enum(:sort_order, values: ProjectTides.Enums.sort_order_const())
end
