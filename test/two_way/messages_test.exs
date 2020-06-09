defmodule ProjectTides.MessagesTest do
  use ProjectTides.DataCase

  alias ProjectTides.Messages

  describe "contacts" do
    alias ProjectTides.Messages.Contact

    @valid_attrs %{name: "some name", phone_number: "some phone_number", status: "some status"}
    @update_attrs %{
      name: "some updated name",
      phone_number: "some updated phone_number",
      status: "some updated status"
    }
    @invalid_attrs %{name: nil, phone_number: nil, status: nil}

    def contact_fixture(attrs \\ %{}) do
      {:ok, contact} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Messages.create_contact()

      contact
    end

    test "list_contacts/0 returns all contacts" do
      contact = contact_fixture()
      assert Messages.list_contacts() == [contact]
    end

    test "get_contact!/1 returns the contact with given id" do
      contact = contact_fixture()
      assert Messages.get_contact!(contact.id) == contact
    end

    test "create_contact/1 with valid data creates a contact" do
      assert {:ok, %Contact{} = contact} = Messages.create_contact(@valid_attrs)
      assert contact.name == "some name"
      assert contact.phone_number == "some phone_number"
      assert contact.status == "some status"
    end

    test "create_contact/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Messages.create_contact(@invalid_attrs)
    end

    test "update_contact/2 with valid data updates the contact" do
      contact = contact_fixture()
      assert {:ok, %Contact{} = contact} = Messages.update_contact(contact, @update_attrs)
      assert contact.name == "some updated name"
      assert contact.phone_number == "some updated phone_number"
      assert contact.status == "some updated status"
    end

    test "update_contact/2 with invalid data returns error changeset" do
      contact = contact_fixture()
      assert {:error, %Ecto.Changeset{}} = Messages.update_contact(contact, @invalid_attrs)
      assert contact == Messages.get_contact!(contact.id)
    end

    test "delete_contact/1 deletes the contact" do
      contact = contact_fixture()
      assert {:ok, %Contact{}} = Messages.delete_contact(contact)
      assert_raise Ecto.NoResultsError, fn -> Messages.get_contact!(contact.id) end
    end

    test "change_contact/1 returns a contact changeset" do
      contact = contact_fixture()
      assert %Ecto.Changeset{} = Messages.change_contact(contact)
    end
  end

  describe "message_media" do
    alias ProjectTides.Messages.MessageMedia

    @valid_attrs %{
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

    def message_media_fixture(attrs \\ %{}) do
      {:ok, message_media} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Messages.create_message_media()

      message_media
    end

    test "list_message_media/0 returns all message_media" do
      message_media = message_media_fixture()
      assert Messages.list_message_media() == [message_media]
    end

    test "get_message_media!/1 returns the message_media with given id" do
      message_media = message_media_fixture()
      assert Messages.get_message_media!(message_media.id) == message_media
    end

    test "create_message_media/1 with valid data creates a message_media" do
      assert {:ok, %MessageMedia{} = message_media} = Messages.create_message_media(@valid_attrs)
      assert message_media.caption == "some caption"
      assert message_media.original_url == "some original_url"
      assert message_media.thumbnail == "some thumbnail"
      assert message_media.url == "some url"
      assert message_media.wa_media_id == "some wa_media_id"
    end

    test "create_message_media/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Messages.create_message_media(@invalid_attrs)
    end

    test "update_message_media/2 with valid data updates the message_media" do
      message_media = message_media_fixture()

      assert {:ok, %MessageMedia{} = message_media} =
               Messages.update_message_media(message_media, @update_attrs)

      assert message_media.caption == "some updated caption"
      assert message_media.original_url == "some updated original_url"
      assert message_media.thumbnail == "some updated thumbnail"
      assert message_media.url == "some updated url"
      assert message_media.wa_media_id == "some updated wa_media_id"
    end

    test "update_message_media/2 with invalid data returns error changeset" do
      message_media = message_media_fixture()

      assert {:error, %Ecto.Changeset{}} =
               Messages.update_message_media(message_media, @invalid_attrs)

      assert message_media == Messages.get_message_media!(message_media.id)
    end

    test "delete_message_media/1 deletes the message_media" do
      message_media = message_media_fixture()
      assert {:ok, %MessageMedia{}} = Messages.delete_message_media(message_media)
      assert_raise Ecto.NoResultsError, fn -> Messages.get_message_media!(message_media.id) end
    end

    test "change_message_media/1 returns a message_media changeset" do
      message_media = message_media_fixture()
      assert %Ecto.Changeset{} = Messages.change_message_media(message_media)
    end
  end

  describe "messages" do
    alias ProjectTides.Messages.Message

    @valid_attrs %{
      body: "some body",
      flow: "some flow",
      type: "some type",
      wa_message_id: "some wa_message_id"
    }
    @update_attrs %{
      body: "some updated body",
      flow: "some updated flow",
      type: "some updated type",
      wa_message_id: "some updated wa_message_id"
    }
    @invalid_attrs %{body: nil, flow: nil, type: nil, wa_message_id: nil}

    def message_fixture(attrs \\ %{}) do
      {:ok, message} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Messages.create_message()

      message
    end

    test "list_messages/0 returns all messages" do
      message = message_fixture()
      assert Messages.list_messages() == [message]
    end

    test "get_message!/1 returns the message with given id" do
      message = message_fixture()
      assert Messages.get_message!(message.id) == message
    end

    test "create_message/1 with valid data creates a message" do
      assert {:ok, %Message{} = message} = Messages.create_message(@valid_attrs)
      assert message.body == "some body"
      assert message.flow == "some flow"
      assert message.type == "some type"
      assert message.wa_message_id == "some wa_message_id"
    end

    test "create_message/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Messages.create_message(@invalid_attrs)
    end

    test "update_message/2 with valid data updates the message" do
      message = message_fixture()
      assert {:ok, %Message{} = message} = Messages.update_message(message, @update_attrs)
      assert message.body == "some updated body"
      assert message.flow == "some updated flow"
      assert message.type == "some updated type"
      assert message.wa_message_id == "some updated wa_message_id"
    end

    test "update_message/2 with invalid data returns error changeset" do
      message = message_fixture()
      assert {:error, %Ecto.Changeset{}} = Messages.update_message(message, @invalid_attrs)
      assert message == Messages.get_message!(message.id)
    end

    test "delete_message/1 deletes the message" do
      message = message_fixture()
      assert {:ok, %Message{}} = Messages.delete_message(message)
      assert_raise Ecto.NoResultsError, fn -> Messages.get_message!(message.id) end
    end

    test "change_message/1 returns a message changeset" do
      message = message_fixture()
      assert %Ecto.Changeset{} = Messages.change_message(message)
    end
  end

  describe "messages" do
    alias ProjectTides.Messages.Message

    @valid_attrs %{
      body: "some body",
      flow: "some flow",
      type: "some type",
      wa_message_id: "some wa_message_id",
      wa_status: "some wa_status"
    }
    @update_attrs %{
      body: "some updated body",
      flow: "some updated flow",
      type: "some updated type",
      wa_message_id: "some updated wa_message_id",
      wa_status: "some updated wa_status"
    }

    @invalid_attrs %{body: nil, flow: nil, type: nil, wa_message_id: nil, wa_status: nil}

    def message_fixture(attrs \\ %{}) do
      {:ok, message} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Messages.create_message()

      message
    end

    test "list_messages/0 returns all messages" do
      message = message_fixture()
      assert Messages.list_messages() == [message]
    end

    test "get_message!/1 returns the message with given id" do
      message = message_fixture()
      assert Messages.get_message!(message.id) == message
    end

    test "create_message/1 with valid data creates a message" do
      assert {:ok, %Message{} = message} = Messages.create_message(@valid_attrs)
      assert message.body == "some body"
      assert message.flow == "some flow"
      assert message.type == "some type"
      assert message.wa_message_id == "some wa_message_id"
      assert message.wa_status == "some wa_status"
    end

    test "create_message/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Messages.create_message(@invalid_attrs)
    end

    test "update_message/2 with valid data updates the message" do
      message = message_fixture()
      assert {:ok, %Message{} = message} = Messages.update_message(message, @update_attrs)
      assert message.body == "some updated body"
      assert message.flow == "some updated flow"
      assert message.type == "some updated type"
      assert message.wa_message_id == "some updated wa_message_id"
      assert message.wa_status == "some updated wa_status"
    end

    test "update_message/2 with invalid data returns error changeset" do
      message = message_fixture()
      assert {:error, %Ecto.Changeset{}} = Messages.update_message(message, @invalid_attrs)
      assert message == Messages.get_message!(message.id)
    end

    test "delete_message/1 deletes the message" do
      message = message_fixture()
      assert {:ok, %Message{}} = Messages.delete_message(message)
      assert_raise Ecto.NoResultsError, fn -> Messages.get_message!(message.id) end
    end

    test "change_message/1 returns a message changeset" do
      message = message_fixture()
      assert %Ecto.Changeset{} = Messages.change_message(message)
    end
  end
end
