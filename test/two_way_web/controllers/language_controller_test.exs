defmodule ProjectTidesWeb.LanguageControllerTest do
  use ProjectTidesWeb.ConnCase

  alias ProjectTides.Settings

  @create_attrs %{
    description: "some description",
    is_active: true,
    label: "some label",
    locale: "some locale"
  }
  @update_attrs %{
    description: "some updated description",
    is_active: false,
    label: "some updated label",
    locale: "some updated locale"
  }
  @invalid_attrs %{description: nil, is_active: nil, label: nil, locale: nil}

  def fixture(:language) do
    {:ok, language} = Settings.create_language(@create_attrs)
    language
  end

  describe "index" do
    test "lists all languages", %{conn: conn} do
      conn = get(conn, Routes.language_path(conn, :index))
      assert html_response(conn, 200) =~ "Listing Languages"
    end
  end

  describe "new language" do
    test "renders form", %{conn: conn} do
      conn = get(conn, Routes.language_path(conn, :new))
      assert html_response(conn, 200) =~ "New Language"
    end
  end

  describe "create language" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, Routes.language_path(conn, :create), language: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == Routes.language_path(conn, :show, id)

      conn = get(conn, Routes.language_path(conn, :show, id))
      assert html_response(conn, 200) =~ "Show Language"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.language_path(conn, :create), language: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Language"
    end
  end

  describe "edit language" do
    setup [:create_language]

    test "renders form for editing chosen language", %{conn: conn, language: language} do
      conn = get(conn, Routes.language_path(conn, :edit, language))
      assert html_response(conn, 200) =~ "Edit Language"
    end
  end

  describe "update language" do
    setup [:create_language]

    test "redirects when data is valid", %{conn: conn, language: language} do
      conn = put(conn, Routes.language_path(conn, :update, language), language: @update_attrs)
      assert redirected_to(conn) == Routes.language_path(conn, :show, language)

      conn = get(conn, Routes.language_path(conn, :show, language))
      assert html_response(conn, 200) =~ "some updated description"
    end

    test "renders errors when data is invalid", %{conn: conn, language: language} do
      conn = put(conn, Routes.language_path(conn, :update, language), language: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Language"
    end
  end

  describe "delete language" do
    setup [:create_language]

    test "deletes chosen language", %{conn: conn, language: language} do
      conn = delete(conn, Routes.language_path(conn, :delete, language))
      assert redirected_to(conn) == Routes.language_path(conn, :index)

      assert_error_sent 404, fn ->
        get(conn, Routes.language_path(conn, :show, language))
      end
    end
  end

  defp create_language(_) do
    language = fixture(:language)
    %{language: language}
  end
end
