defmodule ProjectTides.Communications.BSP.Twilio.Contact do
  @behaviour ProjectTides.Communications.ContactBehaviour

  @impl ProjectTides.Communications.ContactBehaviour
  def status(_args) do
    {:ok, :status}
  end
end
