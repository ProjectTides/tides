defmodule ProjectTides.SettingsTest do
  use ProjectTides.DataCase

  alias ProjectTides.Settings

  describe "option_groups" do
    alias ProjectTides.Settings.OptionGroup

    @valid_attrs %{
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

    def option_group_fixture(attrs \\ %{}) do
      {:ok, option_group} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Settings.create_option_group()

      option_group
    end

    test "list_option_groups/0 returns all option_groups" do
      option_group = option_group_fixture()
      assert Settings.list_option_groups() == [option_group]
    end

    test "get_option_group!/1 returns the option_group with given id" do
      option_group = option_group_fixture()
      assert Settings.get_option_group!(option_group.id) == option_group
    end

    test "create_option_group/1 with valid data creates a option_group" do
      assert {:ok, %OptionGroup{} = option_group} = Settings.create_option_group(@valid_attrs)
      assert option_group.data_type == "some data_type"
      assert option_group.description == "some description"
      assert option_group.is_active == true
      assert option_group.is_locked == true
      assert option_group.is_reserved == true
      assert option_group.label == "some label"
      assert option_group.name == "some name"
    end

    test "create_option_group/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Settings.create_option_group(@invalid_attrs)
    end

    test "update_option_group/2 with valid data updates the option_group" do
      option_group = option_group_fixture()

      assert {:ok, %OptionGroup{} = option_group} =
               Settings.update_option_group(option_group, @update_attrs)

      assert option_group.data_type == "some updated data_type"
      assert option_group.description == "some updated description"
      assert option_group.is_active == false
      assert option_group.is_locked == false
      assert option_group.is_reserved == false
      assert option_group.label == "some updated label"
      assert option_group.name == "some updated name"
    end

    test "update_option_group/2 with invalid data returns error changeset" do
      option_group = option_group_fixture()

      assert {:error, %Ecto.Changeset{}} =
               Settings.update_option_group(option_group, @invalid_attrs)

      assert option_group == Settings.get_option_group!(option_group.id)
    end

    test "delete_option_group/1 deletes the option_group" do
      option_group = option_group_fixture()
      assert {:ok, %OptionGroup{}} = Settings.delete_option_group(option_group)
      assert_raise Ecto.NoResultsError, fn -> Settings.get_option_group!(option_group.id) end
    end

    test "change_option_group/1 returns a option_group changeset" do
      option_group = option_group_fixture()
      assert %Ecto.Changeset{} = Settings.change_option_group(option_group)
    end
  end

  describe "option_values" do
    alias ProjectTides.Settings.OptionValue

    @valid_attrs %{
      description: "some description",
      filter: 42,
      grouping: "some grouping",
      is_active: true,
      is_default: true,
      is_optgroup: true,
      is_reserved: true,
      label: "some label",
      value: "some value",
      weight: 42
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
      weight: 43
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

    def option_value_fixture(attrs \\ %{}) do
      {:ok, option_value} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Settings.create_option_value()

      option_value
    end

    test "list_option_values/0 returns all option_values" do
      option_value = option_value_fixture()
      assert Settings.list_option_values() == [option_value]
    end

    test "get_option_value!/1 returns the option_value with given id" do
      option_value = option_value_fixture()
      assert Settings.get_option_value!(option_value.id) == option_value
    end

    test "create_option_value/1 with valid data creates a option_value" do
      assert {:ok, %OptionValue{} = option_value} = Settings.create_option_value(@valid_attrs)
      assert option_value.description == "some description"
      assert option_value.filter == 42
      assert option_value.grouping == "some grouping"
      assert option_value.is_active == true
      assert option_value.is_default == true
      assert option_value.is_optgroup == true
      assert option_value.is_reserved == true
      assert option_value.label == "some label"
      assert option_value.value == "some value"
      assert option_value.weight == 42
    end

    test "create_option_value/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Settings.create_option_value(@invalid_attrs)
    end

    test "update_option_value/2 with valid data updates the option_value" do
      option_value = option_value_fixture()

      assert {:ok, %OptionValue{} = option_value} =
               Settings.update_option_value(option_value, @update_attrs)

      assert option_value.description == "some updated description"
      assert option_value.filter == 43
      assert option_value.grouping == "some updated grouping"
      assert option_value.is_active == false
      assert option_value.is_default == false
      assert option_value.is_optgroup == false
      assert option_value.is_reserved == false
      assert option_value.label == "some updated label"
      assert option_value.value == "some updated value"
      assert option_value.weight == 43
    end

    test "update_option_value/2 with invalid data returns error changeset" do
      option_value = option_value_fixture()

      assert {:error, %Ecto.Changeset{}} =
               Settings.update_option_value(option_value, @invalid_attrs)

      assert option_value == Settings.get_option_value!(option_value.id)
    end

    test "delete_option_value/1 deletes the option_value" do
      option_value = option_value_fixture()
      assert {:ok, %OptionValue{}} = Settings.delete_option_value(option_value)
      assert_raise Ecto.NoResultsError, fn -> Settings.get_option_value!(option_value.id) end
    end

    test "change_option_value/1 returns a option_value changeset" do
      option_value = option_value_fixture()
      assert %Ecto.Changeset{} = Settings.change_option_value(option_value)
    end
  end

  describe "languages" do
    alias ProjectTides.Settings.Language

    @valid_attrs %{
      description: "some description",
      is_active: true,
      label: "some label",
      locale: "some locale"
    }
    @update_attrs %{
      description: "some updated description",
      is_active: false,
      label: "some updated label",
      locale: "some updated locale"
    }
    @invalid_attrs %{description: nil, is_active: nil, label: nil, locale: nil}

    def language_fixture(attrs \\ %{}) do
      {:ok, language} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Settings.create_language()

      language
    end

    test "list_languages/0 returns all languages" do
      language = language_fixture()
      assert Settings.list_languages() == [language]
    end

    test "get_language!/1 returns the language with given id" do
      language = language_fixture()
      assert Settings.get_language!(language.id) == language
    end

    test "create_language/1 with valid data creates a language" do
      assert {:ok, %Language{} = language} = Settings.create_language(@valid_attrs)
      assert language.description == "some description"
      assert language.is_active == true
      assert language.label == "some label"
      assert language.locale == "some locale"
    end

    test "create_language/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Settings.create_language(@invalid_attrs)
    end

    test "update_language/2 with valid data updates the language" do
      language = language_fixture()
      assert {:ok, %Language{} = language} = Settings.update_language(language, @update_attrs)
      assert language.description == "some updated description"
      assert language.is_active == false
      assert language.label == "some updated label"
      assert language.locale == "some updated locale"
    end

    test "update_language/2 with invalid data returns error changeset" do
      language = language_fixture()
      assert {:error, %Ecto.Changeset{}} = Settings.update_language(language, @invalid_attrs)
      assert language == Settings.get_language!(language.id)
    end

    test "delete_language/1 deletes the language" do
      language = language_fixture()
      assert {:ok, %Language{}} = Settings.delete_language(language)
      assert_raise Ecto.NoResultsError, fn -> Settings.get_language!(language.id) end
    end

    test "change_language/1 returns a language changeset" do
      language = language_fixture()
      assert %Ecto.Changeset{} = Settings.change_language(language)
    end
  end
end
