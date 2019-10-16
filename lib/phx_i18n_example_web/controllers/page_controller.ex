defmodule PhxI18nExampleWeb.PageController do
  use PhxI18nExampleWeb, :controller
  alias PhxI18nExampleWeb.PageLive

  def index(%{assigns: assigns} = conn, _params) do
    live_render(conn, PageLive, session: assigns)
  end
end
