defmodule PhxI18nExampleWeb.PageLiveView do
  use Phoenix.LiveView
  alias PhxI18nExampleWeb.{Endpoint, PageLiveComponent}

  @locale_changes "locale-changes:"
  @dropdown_changes "dropdown-changes:"

  def mount(%{locale: locale, user_id: user_id}, socket) do
    Endpoint.subscribe(@locale_changes <> user_id)
    socket = assign(socket, locale: locale, user_id: user_id)
    {:ok, socket}
  end

  def render(assigns) do
    ~L"""
    <%= live_component @socket, PageLiveComponent, locale: @locale %>
    """
  end

  def handle_event("hide-dropdown", _value, socket) do
    Endpoint.broadcast_from(
      self(),
      @dropdown_changes <> socket.assigns.user_id,
      "hide-dropdown",
      %{}
    )

    {:noreply, socket}
  end

  def handle_info(%{event: "change-locale", payload: payload}, socket) do
    socket = assign(socket, :locale, payload.locale)
    {:noreply, socket}
  end
end
