defmodule PhxI18nExampleWeb.PageLive do
  use Phoenix.LiveView
  alias PhxI18nExampleWeb.{Endpoint, PageView}

  @topic "i18n-example"

  def mount(%{current_locale: current_locale}, socket) do
    PhxI18nExampleWeb.Endpoint.subscribe(@topic)
    socket = assign(socket, current_locale: current_locale)
    {:ok, socket}
  end

  def render(assigns) do
    PageView.render("index.html", assigns)
  end

  def handle_event("hide", _value, socket) do
    Endpoint.broadcast_from(self(), @topic, "hide", %{})
    {:noreply, socket}
  end

  def handle_info(%{event: "locale-changed", payload: payload}, socket) do
    %{current_locale: current_locale} = payload
    socket = assign(socket, :current_locale, current_locale)
    {:noreply, socket}
  end
end
