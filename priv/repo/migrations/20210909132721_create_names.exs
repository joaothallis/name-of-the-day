defmodule NameOfTheDay.Repo.Migrations.CreateNames do
  use Ecto.Migration

  def change do
    create table(:names) do
      add :name, :string
      add :meaning, :string
      add :gender, :string
      add :country, :string

      timestamps()
    end
  end
end
