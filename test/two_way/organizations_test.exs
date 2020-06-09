defmodule ProjectTides.OrganizationsTest do
  use ProjectTides.DataCase

  alias ProjectTides.Organizations

  describe "organizations" do
    alias ProjectTides.Organizations.Organization

    @valid_attrs %{
      bsp: "some bsp",
      bsp_key: "some bsp_key",
      contact_name: "some contact_name",
      email: "some email",
      name: "some name",
      wa_number: "some wa_number"
    }
    @update_attrs %{
      bsp: "some updated bsp",
      bsp_key: "some updated bsp_key",
      contact_name: "some updated contact_name",
      email: "some updated email",
      name: "some updated name",
      wa_number: "some updated wa_number"
    }
    @invalid_attrs %{
      bsp: nil,
      bsp_key: nil,
      contact_name: nil,
      email: nil,
      name: nil,
      wa_number: nil
    }

    def organization_fixture(attrs \\ %{}) do
      {:ok, organization} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Organizations.create_organization()

      organization
    end

    test "list_organizations/0 returns all organizations" do
      organization = organization_fixture()
      assert Organizations.list_organizations() == [organization]
    end

    test "get_organization!/1 returns the organization with given id" do
      organization = organization_fixture()
      assert Organizations.get_organization!(organization.id) == organization
    end

    test "create_organization/1 with valid data creates a organization" do
      assert {:ok, %Organization{} = organization} =
               Organizations.create_organization(@valid_attrs)

      assert organization.bsp == "some bsp"
      assert organization.bsp_key == "some bsp_key"
      assert organization.contact_name == "some contact_name"
      assert organization.email == "some email"
      assert organization.name == "some name"
      assert organization.wa_number == "some wa_number"
    end

    test "create_organization/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Organizations.create_organization(@invalid_attrs)
    end

    test "update_organization/2 with valid data updates the organization" do
      organization = organization_fixture()

      assert {:ok, %Organization{} = organization} =
               Organizations.update_organization(organization, @update_attrs)

      assert organization.bsp == "some updated bsp"
      assert organization.bsp_key == "some updated bsp_key"
      assert organization.contact_name == "some updated contact_name"
      assert organization.email == "some updated email"
      assert organization.name == "some updated name"
      assert organization.wa_number == "some updated wa_number"
    end

    test "update_organization/2 with invalid data returns error changeset" do
      organization = organization_fixture()

      assert {:error, %Ecto.Changeset{}} =
               Organizations.update_organization(organization, @invalid_attrs)

      assert organization == Organizations.get_organization!(organization.id)
    end

    test "delete_organization/1 deletes the organization" do
      organization = organization_fixture()
      assert {:ok, %Organization{}} = Organizations.delete_organization(organization)
      assert_raise Ecto.NoResultsError, fn -> Organizations.get_organization!(organization.id) end
    end

    test "change_organization/1 returns a organization changeset" do
      organization = organization_fixture()
      assert %Ecto.Changeset{} = Organizations.change_organization(organization)
    end
  end

  describe "bsps" do
    alias ProjectTides.Organizations.BSP

    @valid_attrs %{api_end_point: "some api_end_point", name: "some name", url: "some url"}
    @update_attrs %{
      api_end_point: "some updated api_end_point",
      name: "some updated name",
      url: "some updated url"
    }
    @invalid_attrs %{api_end_point: nil, name: nil, url: nil}

    def bsp_fixture(attrs \\ %{}) do
      {:ok, bsp} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Organizations.create_bsp()

      bsp
    end

    test "list_bsps/0 returns all bsps" do
      bsp = bsp_fixture()
      assert Organizations.list_bsps() == [bsp]
    end

    test "get_bsp!/1 returns the bsp with given id" do
      bsp = bsp_fixture()
      assert Organizations.get_bsp!(bsp.id) == bsp
    end

    test "create_bsp/1 with valid data creates a bsp" do
      assert {:ok, %BSP{} = bsp} = Organizations.create_bsp(@valid_attrs)
      assert bsp.api_end_point == "some api_end_point"
      assert bsp.name == "some name"
      assert bsp.url == "some url"
    end

    test "create_bsp/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Organizations.create_bsp(@invalid_attrs)
    end

    test "update_bsp/2 with valid data updates the bsp" do
      bsp = bsp_fixture()
      assert {:ok, %BSP{} = bsp} = Organizations.update_bsp(bsp, @update_attrs)
      assert bsp.api_end_point == "some updated api_end_point"
      assert bsp.name == "some updated name"
      assert bsp.url == "some updated url"
    end

    test "update_bsp/2 with invalid data returns error changeset" do
      bsp = bsp_fixture()
      assert {:error, %Ecto.Changeset{}} = Organizations.update_bsp(bsp, @invalid_attrs)
      assert bsp == Organizations.get_bsp!(bsp.id)
    end

    test "delete_bsp/1 deletes the bsp" do
      bsp = bsp_fixture()
      assert {:ok, %BSP{}} = Organizations.delete_bsp(bsp)
      assert_raise Ecto.NoResultsError, fn -> Organizations.get_bsp!(bsp.id) end
    end

    test "change_bsp/1 returns a bsp changeset" do
      bsp = bsp_fixture()
      assert %Ecto.Changeset{} = Organizations.change_bsp(bsp)
    end
  end
end
