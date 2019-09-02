defmodule PhxI18nExampleWeb.PageController do
  use PhxI18nExampleWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
