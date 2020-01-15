defmodule PhxI18nExampleWeb.PageLiveComponent do
  use Phoenix.LiveComponent
  alias PhxI18nExampleWeb.{Endpoint, PageView}

  @dropdown_changes "dropdown-changes"

  def render(assigns) do
    PageView.render("index.html", assigns)
  end

  def handle_event("hide-dropdown", _value, socket) do
    Endpoint.broadcast_from(self(), @dropdown_changes, "hide-dropdown", %{})
    {:noreply, socket}
  end
end
