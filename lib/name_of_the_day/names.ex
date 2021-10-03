defmodule NameOfTheDay.Names do
  @moduledoc """
  The Names context.
  """

  import Ecto.Query, warn: false
  alias NameOfTheDay.Repo

  alias NameOfTheDay.Names.Name

  def list_names, do: Repo.all(Name)

  def get_name!(id), do: Repo.get!(Name, id)

  def create_name(attrs \\ %{}) do
    %Name{}
    |> Name.changeset(attrs)
    |> Repo.insert()
  end

  def update_name(%Name{} = name, attrs) do
    name
    |> Name.changeset(attrs)
    |> Repo.update()
  end

  def delete_name(%Name{} = name), do: Repo.delete(name)

  def change_name(%Name{} = name, attrs \\ %{}) do
    Name.changeset(name, attrs)
  end

  @spec get_name_by(keyword) :: list(%Name{})
  def get_name_by(opts) do
    where = opts |> Enum.reject(fn {_k, v} -> is_nil(v) end)

    Name
    |> where(^where)
    |> Repo.all()
  end
end
