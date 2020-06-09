defmodule ProjectTidesWeb.SessionMessageControllerTest do
  use ProjectTidesWeb.ConnCase

  alias ProjectTides.Content

  @create_attrs %{
    body: "some body",
    is_active: true,
    is_reserved: true,
    is_source: true,
    is_translated: true,
    label: "some label",
    language_id: 42
  }
  @update_attrs %{
    body: "some updated body",
    is_active: false,
    is_reserved: false,
    is_source: false,
    is_translated: false,
    label: "some updated label",
    language_id: 43
  }
  @invalid_attrs %{
    body: nil,
    is_active: nil,
    is_reserved: nil,
    is_source: nil,
    is_translated: nil,
    label: nil,
    language_id: nil
  }

  def fixture(:session_message) do
    {:ok, session_message} = Content.create_session_message(@create_attrs)
    session_message
  end

  describe "index" do
    test "lists all session_messages", %{conn: conn} do
      conn = get(conn, Routes.session_message_path(conn, :index))
      assert html_response(conn, 200) =~ "Listing Session messages"
    end
  end

  describe "new session_message" do
    test "renders form", %{conn: conn} do
      conn = get(conn, Routes.session_message_path(conn, :new))
      assert html_response(conn, 200) =~ "New Session message"
    end
  end

  describe "create session_message" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn =
        post(conn, Routes.session_message_path(conn, :create), session_message: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == Routes.session_message_path(conn, :show, id)

      conn = get(conn, Routes.session_message_path(conn, :show, id))
      assert html_response(conn, 200) =~ "Show Session message"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn =
        post(conn, Routes.session_message_path(conn, :create), session_message: @invalid_attrs)

      assert html_response(conn, 200) =~ "New Session message"
    end
  end

  describe "edit session_message" do
    setup [:create_session_message]

    test "renders form for editing chosen session_message", %{
      conn: conn,
      session_message: session_message
    } do
      conn = get(conn, Routes.session_message_path(conn, :edit, session_message))
      assert html_response(conn, 200) =~ "Edit Session message"
    end
  end

  describe "update session_message" do
    setup [:create_session_message]

    test "redirects when data is valid", %{conn: conn, session_message: session_message} do
      conn =
        put(conn, Routes.session_message_path(conn, :update, session_message),
          session_message: @update_attrs
        )

      assert redirected_to(conn) == Routes.session_message_path(conn, :show, session_message)

      conn = get(conn, Routes.session_message_path(conn, :show, session_message))
      assert html_response(conn, 200) =~ "some updated body"
    end

    test "renders errors when data is invalid", %{conn: conn, session_message: session_message} do
      conn =
        put(conn, Routes.session_message_path(conn, :update, session_message),
          session_message: @invalid_attrs
        )

      assert html_response(conn, 200) =~ "Edit Session message"
    end
  end

  describe "delete session_message" do
    setup [:create_session_message]

    test "deletes chosen session_message", %{conn: conn, session_message: session_message} do
      conn = delete(conn, Routes.session_message_path(conn, :delete, session_message))
      assert redirected_to(conn) == Routes.session_message_path(conn, :index)

      assert_error_sent 404, fn ->
        get(conn, Routes.session_message_path(conn, :show, session_message))
      end
    end
  end

  defp create_session_message(_) do
    session_message = fixture(:session_message)
    %{session_message: session_message}
  end
end
