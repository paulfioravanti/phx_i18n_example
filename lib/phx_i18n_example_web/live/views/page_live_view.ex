defmodule PhxI18nExampleWeb.PageLiveView do
  use Phoenix.LiveView
  alias PhxI18nExampleWeb.{Endpoint, PageLiveComponent}

  @locale_changes "locale-changes"

  def mount(%{locale: locale}, socket) do
    Endpoint.subscribe(@locale_changes)
    socket = assign(socket, locale: locale)
    {:ok, socket}
  end

  def render(assigns) do
    ~L"""
    <%= live_component @socket,
                       PageLiveComponent,
                       id: :page,
                       locale: @locale %>
    """
  end

  def handle_info(%{event: "change-locale", payload: payload}, socket) do
    %{locale: locale} = payload
    send_update(PageLiveComponent, id: :page, locale: locale)
    {:noreply, socket}
  end
end
