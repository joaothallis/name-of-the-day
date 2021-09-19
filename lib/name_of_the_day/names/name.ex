defmodule NameOfTheDay.Names.Name do
  use Ecto.Schema
  import Ecto.Changeset

  @required_attrs [:name, :meaning, :gender, :country]

  schema "names" do
    field :country, :string
    field :gender, :string
    field :meaning, :string
    field :name, :string

    timestamps()
  end

  @doc false
  def changeset(name, attrs) do
    name
    |> cast(attrs, @required_attrs)
    |> validate_required(@required_attrs)
    |> validate_inclusion(:gender, ["boy", "girl"])
  end
end
