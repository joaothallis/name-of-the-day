defmodule NameOfTheDay.NamesFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `NameOfTheDay.Names` context.
  """

  @doc """
  Generate a name.
  """
  def name_fixture(attrs \\ %{}) do
    {:ok, name} =
      attrs
      |> Enum.into(%{
        country: "some country",
        gender: "boy",
        meaning: "some meaning",
        name: "some name"
      })
      |> NameOfTheDay.Names.create_name()

    name
  end
end
