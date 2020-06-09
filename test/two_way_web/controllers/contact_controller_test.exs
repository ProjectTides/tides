defmodule ProjectTidesWeb.ContactControllerTest do
  use ProjectTidesWeb.ConnCase

  alias ProjectTides.Contacts

  @create_attrs %{
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

  def fixture(:contact) do
    {:ok, contact} = Contacts.create_contact(@create_attrs)
    contact
  end

  describe "index" do
    test "lists all contacts", %{conn: conn} do
      conn = get(conn, Routes.contact_path(conn, :index))
      assert html_response(conn, 200) =~ "Listing Contacts"
    end
  end

  describe "new contact" do
    test "renders form", %{conn: conn} do
      conn = get(conn, Routes.contact_path(conn, :new))
      assert html_response(conn, 200) =~ "New Contact"
    end
  end

  describe "create contact" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, Routes.contact_path(conn, :create), contact: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == Routes.contact_path(conn, :show, id)

      conn = get(conn, Routes.contact_path(conn, :show, id))
      assert html_response(conn, 200) =~ "Show Contact"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.contact_path(conn, :create), contact: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Contact"
    end
  end

  describe "edit contact" do
    setup [:create_contact]

    test "renders form for editing chosen contact", %{conn: conn, contact: contact} do
      conn = get(conn, Routes.contact_path(conn, :edit, contact))
      assert html_response(conn, 200) =~ "Edit Contact"
    end
  end

  describe "update contact" do
    setup [:create_contact]

    test "redirects when data is valid", %{conn: conn, contact: contact} do
      conn = put(conn, Routes.contact_path(conn, :update, contact), contact: @update_attrs)
      assert redirected_to(conn) == Routes.contact_path(conn, :show, contact)

      conn = get(conn, Routes.contact_path(conn, :show, contact))
      assert html_response(conn, 200) =~ "some updated name"
    end

    test "renders errors when data is invalid", %{conn: conn, contact: contact} do
      conn = put(conn, Routes.contact_path(conn, :update, contact), contact: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Contact"
    end
  end

  describe "delete contact" do
    setup [:create_contact]

    test "deletes chosen contact", %{conn: conn, contact: contact} do
      conn = delete(conn, Routes.contact_path(conn, :delete, contact))
      assert redirected_to(conn) == Routes.contact_path(conn, :index)

      assert_error_sent 404, fn ->
        get(conn, Routes.contact_path(conn, :show, contact))
      end
    end
  end

  defp create_contact(_) do
    contact = fixture(:contact)
    %{contact: contact}
  end
end
