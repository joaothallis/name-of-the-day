defmodule NameOfTheDay.NamesTest do
  use NameOfTheDay.DataCase

  alias NameOfTheDay.Names

  describe "names" do
    alias NameOfTheDay.Names.Name

    import NameOfTheDay.NamesFixtures

    @invalid_attrs %{country: nil, gender: nil, meaning: nil, name: nil}

    test "list_names/0 returns all names" do
      name = name_fixture()
      assert Names.list_names() == [name]
    end

    test "get_name!/1 returns the name with given id" do
      name = name_fixture()
      assert Names.get_name!(name.id) == name
    end

    test "create_name/1 with valid data creates a name" do
      valid_attrs = %{
        country: "some country",
        gender: "boy",
        meaning: "some meaning",
        name: "some name"
      }

      assert {:ok, %Name{} = name} = Names.create_name(valid_attrs)
      assert name.country == "some country"
      assert name.gender == "boy"
      assert name.meaning == "some meaning"
      assert name.name == "some name"
    end

    test "create_name/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Names.create_name(@invalid_attrs)
    end

    test "update_name/2 with valid data updates the name" do
      name = name_fixture()

      update_attrs = %{
        country: "some updated country",
        gender: "girl",
        meaning: "some updated meaning",
        name: "some updated name"
      }

      assert {:ok, %Name{} = name} = Names.update_name(name, update_attrs)
      assert name.country == "some updated country"
      assert name.gender == "girl"
      assert name.meaning == "some updated meaning"
      assert name.name == "some updated name"
    end

    test "update_name/2 with invalid data returns error changeset" do
      name = name_fixture()
      assert {:error, %Ecto.Changeset{}} = Names.update_name(name, @invalid_attrs)
      assert name == Names.get_name!(name.id)
    end

    test "delete_name/1 deletes the name" do
      name = name_fixture()
      assert {:ok, %Name{}} = Names.delete_name(name)
      assert_raise Ecto.NoResultsError, fn -> Names.get_name!(name.id) end
    end

    test "change_name/1 returns a name changeset" do
      name = name_fixture()
      assert %Ecto.Changeset{} = Names.change_name(name)
    end

    test "get_name_by_country/1 return a list of names" do
      country = "Brazil"
      name = name_fixture(country: country)
      name_fixture(country: "Africa", gender: "girl")

      assert Names.get_name_by(gender: "boy") == [name]
    end
  end
end
