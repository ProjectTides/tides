defmodule ProjectTides.Enums do
  @moduledoc """
  The Enum provides a location for all enum related macros
  """

  use ProjectTides.Constants.Enums

  defmacro api_status_const,
    do: Macro.expand(@api_status_const, __CALLER__)

  defmacro contact_status_const,
    do: Macro.expand(@contact_status_const, __CALLER__)

  defmacro message_flow_const,
    do: Macro.expand(@message_flow_const, __CALLER__)

  defmacro message_status_const,
    do: Macro.expand(@message_status_const, __CALLER__)

  defmacro message_types_const,
    do: Macro.expand(@message_types_const, __CALLER__)

  defmacro sort_order_const,
    do: Macro.expand(@sort_order_const, __CALLER__)
end
