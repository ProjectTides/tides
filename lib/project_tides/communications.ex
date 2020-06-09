defmodule ProjectTides.Communications do
  @spec effective_bsp :: any
  def effective_bsp() do
    with nil <- bsp_per_organisation(),
         nil <- bsp_from_config(),
         do: bsp_default()
  end

  def organisation_contact() do
    with nil <- contact_per_organisation(),
         nil <- contact_from_config(),
         do: contact_default()
  end

  defp bsp_per_organisation() do
    nil
  end

  defp bsp_from_config() do
    case Application.fetch_env!(:project_tides, :bsp) do
      nil -> nil
      provider -> provider
    end
  end

  defp bsp_default() do
    ProjectTides.Communications.BSP.Twilio
  end

  defp contact_per_organisation() do
    nil
  end

  defp contact_from_config() do
    nil
  end

  defp contact_default() do
    # For sendbox only
    %{"source" => "917834811114", "src.name" => "NGO Name"}
  end
end
