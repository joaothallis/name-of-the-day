defmodule NameOfTheDay.Repo do
  use Ecto.Repo,
    otp_app: :name_of_the_day,
    adapter: Ecto.Adapters.Postgres
end
