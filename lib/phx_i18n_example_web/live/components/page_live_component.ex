defmodule PhxI18nExampleWeb.PageLiveComponent do
  use Phoenix.LiveComponent
  alias PhxI18nExampleWeb.PageView

  def mount(socket) do
    {:ok, socket}
  end

  def update(assigns, socket) do
    {:ok, assign(socket, assigns)}
  end

  def render(assigns) do
    PageView.render("index.html", assigns)
  end
end
