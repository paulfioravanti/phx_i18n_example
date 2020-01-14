defmodule PhxI18nExampleWeb.PageLiveComponent do
  use Phoenix.LiveComponent
  alias PhxI18nExampleWeb.PageView

  def render(assigns) do
    PageView.render("index.html", assigns)
  end
end
