defmodule ProjectTidesWeb.OptionValueControllerTest do
  use ProjectTidesWeb.ConnCase

  alias ProjectTides.Settings

  @create_attrs %{
    description: "some description",
    filter: 42,
    grouping: "some grouping",
    is_active: true,
    is_default: true,
    is_optgroup: true,
    is_reserved: true,
    label: "some label",
    value: "some value",
    weight: 42,
    option_group_id: 1
  }
  @update_attrs %{
    description: "some updated description",
    filter: 43,
    grouping: "some updated grouping",
    is_active: false,
    is_default: false,
    is_optgroup: false,
    is_reserved: false,
    label: "some updated label",
    value: "some updated value",
    weight: 43,
    option_group_id: 1
  }
  @invalid_attrs %{
    description: nil,
    filter: nil,
    grouping: nil,
    is_active: nil,
    is_default: nil,
    is_optgroup: nil,
    is_reserved: nil,
    label: nil,
    value: nil,
    weight: nil
  }

  def fixture(:option_value) do
    {:ok, option_value} = Settings.create_option_value(@create_attrs)
    option_value
  end

  describe "index" do
    test "lists all option_values", %{conn: conn} do
      conn = get(conn, Routes.option_value_path(conn, :index))
      assert html_response(conn, 200) =~ "Listing Option values"
    end
  end

  describe "new option_value" do
    test "renders form", %{conn: conn} do
      conn = get(conn, Routes.option_value_path(conn, :new))
      assert html_response(conn, 200) =~ "New Option value"
    end
  end

  describe "create option_value" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, Routes.option_value_path(conn, :create), option_value: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == Routes.option_value_path(conn, :show, id)

      conn = get(conn, Routes.option_value_path(conn, :show, id))
      assert html_response(conn, 200) =~ "Show Option value"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.option_value_path(conn, :create), option_value: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Option value"
    end
  end

  describe "edit option_value" do
    setup [:create_option_value]

    test "renders form for editing chosen option_value", %{conn: conn, option_value: option_value} do
      conn = get(conn, Routes.option_value_path(conn, :edit, option_value))
      assert html_response(conn, 200) =~ "Edit Option value"
    end
  end

  describe "update option_value" do
    setup [:create_option_value]

    test "redirects when data is valid", %{conn: conn, option_value: option_value} do
      conn =
        put(conn, Routes.option_value_path(conn, :update, option_value),
          option_value: @update_attrs
        )

      assert redirected_to(conn) == Routes.option_value_path(conn, :show, option_value)

      conn = get(conn, Routes.option_value_path(conn, :show, option_value))
      assert html_response(conn, 200) =~ "some updated description"
    end

    test "renders errors when data is invalid", %{conn: conn, option_value: option_value} do
      conn =
        put(conn, Routes.option_value_path(conn, :update, option_value),
          option_value: @invalid_attrs
        )

      assert html_response(conn, 200) =~ "Edit Option value"
    end
  end

  describe "delete option_value" do
    setup [:create_option_value]

    test "deletes chosen option_value", %{conn: conn, option_value: option_value} do
      conn = delete(conn, Routes.option_value_path(conn, :delete, option_value))
      assert redirected_to(conn) == Routes.option_value_path(conn, :index)

      assert_error_sent 404, fn ->
        get(conn, Routes.option_value_path(conn, :show, option_value))
      end
    end
  end

  defp create_option_value(_) do
    option_value = fixture(:option_value)
    %{option_value: option_value}
  end
end
