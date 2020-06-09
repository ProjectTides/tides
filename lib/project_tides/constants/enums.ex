defmodule ProjectTides.Constants.Enums do
  @moduledoc """
  The Enums constant are where all enum values across our entire
  application should be defined. This is the source of truth for
  all enums
  """

  defmacro __using__(_opts) do
    quote do
      @api_status_const [:ok, :error]
      @contact_status_const [:failed, :invalid, :processing, :valid]
      @message_flow_const [:inbound, :outbound]
      @message_status_const [:sent, :delivered, :enqueued, :read, :received]
      @message_types_const [:audio, :contact, :document, :hsm, :image, :location, :text, :video]
      @sort_order_const [:asc, :desc]
    end
  end
end
