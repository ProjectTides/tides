defmodule ProjectTidesWeb.ErrorViewTest do
  use ProjectTidesWeb.ConnCase, async: true

  # Bring render/3 and render_to_string/3 for testing custom views
  import Phoenix.View

  test "renders 404.json" do
    assert render(ProjectTidesWeb.ErrorView, "404.json", []) == %{errors: %{detail: "Not Found"}}
  end

  test "renders 500.json" do
    assert render(ProjectTidesWeb.ErrorView, "500.json", []) ==
             %{errors: %{detail: "Internal Server Error"}}
  end
  test "renders 403.json" do
    assert render(ProjectTidesWeb.ErrorView, "403.json", []) ==
             %{errors: %{detail: "Internal Server Error"}}
  end
end
