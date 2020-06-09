defmodule ProjectTidesWeb.MessageMediaControllerTest do
  use ProjectTidesWeb.ConnCase

  alias ProjectTides.Messages

  @create_attrs %{
    caption: "some caption",
    original_url: "some original_url",
    thumbnail: "some thumbnail",
    url: "some url",
    wa_media_id: "some wa_media_id"
  }
  @update_attrs %{
    caption: "some updated caption",
    original_url: "some updated original_url",
    thumbnail: "some updated thumbnail",
    url: "some updated url",
    wa_media_id: "some updated wa_media_id"
  }
  @invalid_attrs %{caption: nil, original_url: nil, thumbnail: nil, url: nil, wa_media_id: nil}

  def fixture(:message_media) do
    {:ok, message_media} = Messages.create_message_media(@create_attrs)
    message_media
  end

  describe "index" do
    test "lists all message_media", %{conn: conn} do
      conn = get(conn, Routes.message_media_path(conn, :index))
      assert html_response(conn, 200) =~ "Listing Message media"
    end
  end

  describe "new message_media" do
    test "renders form", %{conn: conn} do
      conn = get(conn, Routes.message_media_path(conn, :new))
      assert html_response(conn, 200) =~ "New Message media"
    end
  end

  describe "create message_media" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, Routes.message_media_path(conn, :create), message_media: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == Routes.message_media_path(conn, :show, id)

      conn = get(conn, Routes.message_media_path(conn, :show, id))
      assert html_response(conn, 200) =~ "Show Message media"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.message_media_path(conn, :create), message_media: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Message media"
    end
  end

  describe "edit message_media" do
    setup [:create_message_media]

    test "renders form for editing chosen message_media", %{
      conn: conn,
      message_media: message_media
    } do
      conn = get(conn, Routes.message_media_path(conn, :edit, message_media))
      assert html_response(conn, 200) =~ "Edit Message media"
    end
  end

  describe "update message_media" do
    setup [:create_message_media]

    test "redirects when data is valid", %{conn: conn, message_media: message_media} do
      conn =
        put(conn, Routes.message_media_path(conn, :update, message_media),
          message_media: @update_attrs
        )

      assert redirected_to(conn) == Routes.message_media_path(conn, :show, message_media)

      conn = get(conn, Routes.message_media_path(conn, :show, message_media))
      assert html_response(conn, 200) =~ "some updated caption"
    end

    test "renders errors when data is invalid", %{conn: conn, message_media: message_media} do
      conn =
        put(conn, Routes.message_media_path(conn, :update, message_media),
          message_media: @invalid_attrs
        )

      assert html_response(conn, 200) =~ "Edit Message media"
    end
  end

  describe "delete message_media" do
    setup [:create_message_media]

    test "deletes chosen message_media", %{conn: conn, message_media: message_media} do
      conn = delete(conn, Routes.message_media_path(conn, :delete, message_media))
      assert redirected_to(conn) == Routes.message_media_path(conn, :index)

      assert_error_sent 404, fn ->
        get(conn, Routes.message_media_path(conn, :show, message_media))
      end
    end
  end

  defp create_message_media(_) do
    message_media = fixture(:message_media)
    %{message_media: message_media}
  end
end
