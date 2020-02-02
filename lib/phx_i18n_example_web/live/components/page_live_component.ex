defmodule PhxI18nExampleWeb.PageLiveComponent do
  use Phoenix.LiveComponent
  alias PhxI18nExampleWeb.PageView

  def render(assigns) do
    PageView.render("index.html", assigns)
  end

  def handle_event("hide-dropdown", _value, socket) do
    send(self(), :hide_dropdown)

    {:noreply, socket}
  end
end
