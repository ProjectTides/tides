defmodule ProjectTides.ContactsTest do
  use ProjectTides.DataCase

  alias ProjectTides.Contacts

  describe "contacts" do
    alias ProjectTides.Contacts.Contact

    @valid_attrs %{
      name: "some name",
      optin_time: ~N[2010-04-17 14:00:00],
      optout_time: ~N[2010-04-17 14:00:00],
      phone: "some phone",
      status: "some status",
      wa_id: "some wa_id",
      wa_status: "some wa_status"
    }
    @update_attrs %{
      name: "some updated name",
      optin_time: ~N[2011-05-18 15:01:01],
      optout_time: ~N[2011-05-18 15:01:01],
      phone: "some updated phone",
      status: "some updated status",
      wa_id: "some updated wa_id",
      wa_status: "some updated wa_status"
    }
    @invalid_attrs %{
      name: nil,
      optin_time: nil,
      optout_time: nil,
      phone: nil,
      status: nil,
      wa_id: nil,
      wa_status: nil
    }

    def contact_fixture(attrs \\ %{}) do
      {:ok, contact} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Contacts.create_contact()

      contact
    end

    test "list_contacts/0 returns all contacts" do
      contact = contact_fixture()
      assert Contacts.list_contacts() == [contact]
    end

    test "get_contact!/1 returns the contact with given id" do
      contact = contact_fixture()
      assert Contacts.get_contact!(contact.id) == contact
    end

    test "create_contact/1 with valid data creates a contact" do
      assert {:ok, %Contact{} = contact} = Contacts.create_contact(@valid_attrs)
      assert contact.name == "some name"
      assert contact.optin_time == ~N[2010-04-17 14:00:00]
      assert contact.optout_time == ~N[2010-04-17 14:00:00]
      assert contact.phone == "some phone"
      assert contact.status == "some status"
      assert contact.wa_id == "some wa_id"
      assert contact.wa_status == "some wa_status"
    end

    test "create_contact/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Contacts.create_contact(@invalid_attrs)
    end

    test "update_contact/2 with valid data updates the contact" do
      contact = contact_fixture()
      assert {:ok, %Contact{} = contact} = Contacts.update_contact(contact, @update_attrs)
      assert contact.name == "some updated name"
      assert contact.optin_time == ~N[2011-05-18 15:01:01]
      assert contact.optout_time == ~N[2011-05-18 15:01:01]
      assert contact.phone == "some updated phone"
      assert contact.status == "some updated status"
      assert contact.wa_id == "some updated wa_id"
      assert contact.wa_status == "some updated wa_status"
    end

    test "update_contact/2 with invalid data returns error changeset" do
      contact = contact_fixture()
      assert {:error, %Ecto.Changeset{}} = Contacts.update_contact(contact, @invalid_attrs)
      assert contact == Contacts.get_contact!(contact.id)
    end

    test "delete_contact/1 deletes the contact" do
      contact = contact_fixture()
      assert {:ok, %Contact{}} = Contacts.delete_contact(contact)
      assert_raise Ecto.NoResultsError, fn -> Contacts.get_contact!(contact.id) end
    end

    test "change_contact/1 returns a contact changeset" do
      contact = contact_fixture()
      assert %Ecto.Changeset{} = Contacts.change_contact(contact)
    end
  end

  describe "contacts" do
    alias ProjectTides.Contacts.Contact

    @valid_attrs %{
      name: "some name",
      optin_time: "2010-04-17T14:00:00Z",
      optout_time: "2010-04-17T14:00:00Z",
      phone: "some phone",
      status: "some status",
      wa_id: "some wa_id",
      wa_status: "some wa_status"
    }
    @update_attrs %{
      name: "some updated name",
      optin_time: "2011-05-18T15:01:01Z",
      optout_time: "2011-05-18T15:01:01Z",
      phone: "some updated phone",
      status: "some updated status",
      wa_id: "some updated wa_id",
      wa_status: "some updated wa_status"
    }
    @invalid_attrs %{
      name: nil,
      optin_time: nil,
      optout_time: nil,
      phone: nil,
      status: nil,
      wa_id: nil,
      wa_status: nil
    }

    def contact_fixture(attrs \\ %{}) do
      {:ok, contact} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Contacts.create_contact()

      contact
    end

    test "list_contacts/0 returns all contacts" do
      contact = contact_fixture()
      assert Contacts.list_contacts() == [contact]
    end

    test "get_contact!/1 returns the contact with given id" do
      contact = contact_fixture()
      assert Contacts.get_contact!(contact.id) == contact
    end

    test "create_contact/1 with valid data creates a contact" do
      assert {:ok, %Contact{} = contact} = Contacts.create_contact(@valid_attrs)
      assert contact.name == "some name"
      assert contact.optin_time == DateTime.from_naive!(~N[2010-04-17T14:00:00Z], "Etc/UTC")
      assert contact.optout_time == DateTime.from_naive!(~N[2010-04-17T14:00:00Z], "Etc/UTC")
      assert contact.phone == "some phone"
      assert contact.status == "some status"
      assert contact.wa_id == "some wa_id"
      assert contact.wa_status == "some wa_status"
    end

    test "create_contact/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Contacts.create_contact(@invalid_attrs)
    end

    test "update_contact/2 with valid data updates the contact" do
      contact = contact_fixture()
      assert {:ok, %Contact{} = contact} = Contacts.update_contact(contact, @update_attrs)
      assert contact.name == "some updated name"
      assert contact.optin_time == DateTime.from_naive!(~N[2011-05-18T15:01:01Z], "Etc/UTC")
      assert contact.optout_time == DateTime.from_naive!(~N[2011-05-18T15:01:01Z], "Etc/UTC")
      assert contact.phone == "some updated phone"
      assert contact.status == "some updated status"
      assert contact.wa_id == "some updated wa_id"
      assert contact.wa_status == "some updated wa_status"
    end

    test "update_contact/2 with invalid data returns error changeset" do
      contact = contact_fixture()
      assert {:error, %Ecto.Changeset{}} = Contacts.update_contact(contact, @invalid_attrs)
      assert contact == Contacts.get_contact!(contact.id)
    end

    test "delete_contact/1 deletes the contact" do
      contact = contact_fixture()
      assert {:ok, %Contact{}} = Contacts.delete_contact(contact)
      assert_raise Ecto.NoResultsError, fn -> Contacts.get_contact!(contact.id) end
    end

    test "change_contact/1 returns a contact changeset" do
      contact = contact_fixture()
      assert %Ecto.Changeset{} = Contacts.change_contact(contact)
    end
  end
end
