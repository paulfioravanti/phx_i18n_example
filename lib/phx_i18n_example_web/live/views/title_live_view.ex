defmodule PhxI18nExampleWeb.TitleLiveView do
  use Phoenix.LiveView
  alias PhxI18nExampleWeb.{Endpoint, TitleLiveComponent}

  @locale_changes "locale-changes"

  def mount(%{locale: locale}, socket) do
    Endpoint.subscribe(@locale_changes)
    socket = assign(socket, locale: locale)
    {:ok, socket}
  end

  def render(assigns) do
    ~L"""
    <%= live_component @socket, TitleLiveComponent, locale: @locale %>
    """
  end

  def handle_info(%{event: "change-locale", payload: payload}, socket) do
    %{locale: locale} = payload
    socket = assign(socket, :locale, locale)
    {:noreply, socket}
  end
end
