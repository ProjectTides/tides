defmodule ProjectTides.ContentTest do
  use ProjectTides.DataCase

  alias ProjectTides.Content

  describe "session_messages" do
    alias ProjectTides.Content.SessionMessage

    @valid_attrs %{
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

    def session_message_fixture(attrs \\ %{}) do
      {:ok, session_message} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Content.create_session_message()

      session_message
    end

    test "list_session_messages/0 returns all session_messages" do
      session_message = session_message_fixture()
      assert Content.list_session_messages() == [session_message]
    end

    test "get_session_message!/1 returns the session_message with given id" do
      session_message = session_message_fixture()
      assert Content.get_session_message!(session_message.id) == session_message
    end

    test "create_session_message/1 with valid data creates a session_message" do
      assert {:ok, %SessionMessage{} = session_message} =
               Content.create_session_message(@valid_attrs)

      assert session_message.body == "some body"
      assert session_message.is_active == true
      assert session_message.is_reserved == true
      assert session_message.is_source == true
      assert session_message.is_translated == true
      assert session_message.label == "some label"
      assert session_message.language_id == 42
    end

    test "create_session_message/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Content.create_session_message(@invalid_attrs)
    end

    test "update_session_message/2 with valid data updates the session_message" do
      session_message = session_message_fixture()

      assert {:ok, %SessionMessage{} = session_message} =
               Content.update_session_message(session_message, @update_attrs)

      assert session_message.body == "some updated body"
      assert session_message.is_active == false
      assert session_message.is_reserved == false
      assert session_message.is_source == false
      assert session_message.is_translated == false
      assert session_message.label == "some updated label"
      assert session_message.language_id == 43
    end

    test "update_session_message/2 with invalid data returns error changeset" do
      session_message = session_message_fixture()

      assert {:error, %Ecto.Changeset{}} =
               Content.update_session_message(session_message, @invalid_attrs)

      assert session_message == Content.get_session_message!(session_message.id)
    end

    test "delete_session_message/1 deletes the session_message" do
      session_message = session_message_fixture()
      assert {:ok, %SessionMessage{}} = Content.delete_session_message(session_message)
      assert_raise Ecto.NoResultsError, fn -> Content.get_session_message!(session_message.id) end
    end

    test "change_session_message/1 returns a session_message changeset" do
      session_message = session_message_fixture()
      assert %Ecto.Changeset{} = Content.change_session_message(session_message)
    end
  end
end
