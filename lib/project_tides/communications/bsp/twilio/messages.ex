defmodule ProjectTides.Communications.BSP.Twilio.Message do
  @behaviour ProjectTides.Communications.MessageBehaviour

  @impl ProjectTides.Communications.MessageBehaviour
  def send_text(_message), do: {:ok, :response}

  @impl ProjectTides.Communications.MessageBehaviour
  def send_image(_message), do: {:ok, :response}

  @impl ProjectTides.Communications.MessageBehaviour
  def send_audio(_message), do: {:ok, :response}

  @impl ProjectTides.Communications.MessageBehaviour
  def send_video(_message), do: {:ok, :response}

  @impl ProjectTides.Communications.MessageBehaviour
  def send_document(_message), do: {:ok, :response}

  @impl ProjectTides.Communications.MessageBehaviour
  def receive_text(_payload), do: {:message, :contact}

  @impl ProjectTides.Communications.MessageBehaviour
  def receive_media(_payload), do: {:message, :contact}
end
