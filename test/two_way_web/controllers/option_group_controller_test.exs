defmodule ProjectTidesWeb.OptionGroupControllerTest do
  use ProjectTidesWeb.ConnCase

  alias ProjectTides.Settings

  @create_attrs %{
    data_type: "some data_type",
    description: "some description",
    is_active: true,
    is_locked: true,
    is_reserved: true,
    label: "some label",
    name: "some name"
  }
  @update_attrs %{
    data_type: "some updated data_type",
    description: "some updated description",
    is_active: false,
    is_locked: false,
    is_reserved: false,
    label: "some updated label",
    name: "some updated name"
  }
  @invalid_attrs %{
    data_type: nil,
    description: nil,
    is_active: nil,
    is_locked: nil,
    is_reserved: nil,
    label: nil,
    name: nil
  }

  def fixture(:option_group) do
    {:ok, option_group} = Settings.create_option_group(@create_attrs)
    option_group
  end

  describe "index" do
    test "lists all option_groups", %{conn: conn} do
      conn = get(conn, Routes.option_group_path(conn, :index))
      assert html_response(conn, 200) =~ "Listing Option groups"
    end
  end

  describe "new option_group" do
    test "renders form", %{conn: conn} do
      conn = get(conn, Routes.option_group_path(conn, :new))
      assert html_response(conn, 200) =~ "New Option group"
    end
  end

  describe "create option_group" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, Routes.option_group_path(conn, :create), option_group: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == Routes.option_group_path(conn, :show, id)

      conn = get(conn, Routes.option_group_path(conn, :show, id))
      assert html_response(conn, 200) =~ "Show Option group"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.option_group_path(conn, :create), option_group: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Option group"
    end
  end

  describe "edit option_group" do
    setup [:create_option_group]

    test "renders form for editing chosen option_group", %{conn: conn, option_group: option_group} do
      conn = get(conn, Routes.option_group_path(conn, :edit, option_group))
      assert html_response(conn, 200) =~ "Edit Option group"
    end
  end

  describe "update option_group" do
    setup [:create_option_group]

    test "redirects when data is valid", %{conn: conn, option_group: option_group} do
      conn =
        put(conn, Routes.option_group_path(conn, :update, option_group),
          option_group: @update_attrs
        )

      assert redirected_to(conn) == Routes.option_group_path(conn, :show, option_group)

      conn = get(conn, Routes.option_group_path(conn, :show, option_group))
      assert html_response(conn, 200) =~ "some updated data_type"
    end

    test "renders errors when data is invalid", %{conn: conn, option_group: option_group} do
      conn =
        put(conn, Routes.option_group_path(conn, :update, option_group),
          option_group: @invalid_attrs
        )

      assert html_response(conn, 200) =~ "Edit Option group"
    end
  end

  describe "delete option_group" do
    setup [:create_option_group]

    test "deletes chosen option_group", %{conn: conn, option_group: option_group} do
      conn = delete(conn, Routes.option_group_path(conn, :delete, option_group))
      assert redirected_to(conn) == Routes.option_group_path(conn, :index)

      assert_error_sent 404, fn ->
        get(conn, Routes.option_group_path(conn, :show, option_group))
      end
    end
  end

  defp create_option_group(_) do
    option_group = fixture(:option_group)
    %{option_group: option_group}
  end
end
