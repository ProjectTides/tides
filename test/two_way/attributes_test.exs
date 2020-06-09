defmodule ProjectTides.AttributesTest do
  use ProjectTides.DataCase

  alias ProjectTides.Attributes

  describe "tags" do
    alias ProjectTides.Attributes.Tag

    @valid_attrs %{
      description: "some description",
      is_active: true,
      is_reserved: true,
      label: "some label",
      language_id: 42
    }
    @update_attrs %{
      description: "some updated description",
      is_active: false,
      is_reserved: false,
      label: "some updated label",
      language_id: 43
    }
    @invalid_attrs %{
      description: nil,
      is_active: nil,
      is_reserved: nil,
      label: nil,
      language_id: nil
    }

    def tag_fixture(attrs \\ %{}) do
      {:ok, tag} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Attributes.create_tag()

      tag
    end

    test "list_tags/0 returns all tags" do
      tag = tag_fixture()
      assert Attributes.list_tags() == [tag]
    end

    test "get_tag!/1 returns the tag with given id" do
      tag = tag_fixture()
      assert Attributes.get_tag!(tag.id) == tag
    end

    test "create_tag/1 with valid data creates a tag" do
      assert {:ok, %Tag{} = tag} = Attributes.create_tag(@valid_attrs)
      assert tag.description == "some description"
      assert tag.is_active == true
      assert tag.is_reserved == true
      assert tag.label == "some label"
      assert tag.language_id == 42
    end

    test "create_tag/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Attributes.create_tag(@invalid_attrs)
    end

    test "update_tag/2 with valid data updates the tag" do
      tag = tag_fixture()
      assert {:ok, %Tag{} = tag} = Attributes.update_tag(tag, @update_attrs)
      assert tag.description == "some updated description"
      assert tag.is_active == false
      assert tag.is_reserved == false
      assert tag.label == "some updated label"
      assert tag.language_id == 43
    end

    test "update_tag/2 with invalid data returns error changeset" do
      tag = tag_fixture()
      assert {:error, %Ecto.Changeset{}} = Attributes.update_tag(tag, @invalid_attrs)
      assert tag == Attributes.get_tag!(tag.id)
    end

    test "delete_tag/1 deletes the tag" do
      tag = tag_fixture()
      assert {:ok, %Tag{}} = Attributes.delete_tag(tag)
      assert_raise Ecto.NoResultsError, fn -> Attributes.get_tag!(tag.id) end
    end

    test "change_tag/1 returns a tag changeset" do
      tag = tag_fixture()
      assert %Ecto.Changeset{} = Attributes.change_tag(tag)
    end
  end
end
