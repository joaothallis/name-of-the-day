defmodule NameOfTheDayWeb.PageController do
  use NameOfTheDayWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
