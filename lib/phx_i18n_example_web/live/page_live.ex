defmodule PhxI18nExampleWeb.PageLive do
  use Phoenix.LiveView
  alias PhxI18nExampleWeb.{Endpoint, PageView}

  @topic "i18n-example"

  def mount(%{locale: locale}, socket) do
    PhxI18nExampleWeb.Endpoint.subscribe(@topic)
    socket = assign(socket, locale: locale)
    {:ok, socket}
  end

  def render(assigns) do
    PageView.render("index.html", assigns)
  end

  def handle_event("hide-dropdown", _value, socket) do
    Endpoint.broadcast_from(self(), @topic, "hide-dropdown", %{})
    {:noreply, socket}
  end

  def handle_info(%{event: "locale-changed", payload: payload}, socket) do
    %{locale: locale} = payload
    socket = assign(socket, :locale, locale)
    {:noreply, socket}
  end
end
