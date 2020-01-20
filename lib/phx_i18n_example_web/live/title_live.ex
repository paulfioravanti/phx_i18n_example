defmodule PhxI18nExampleWeb.TitleLive do
  use Phoenix.LiveView
  import PhxI18nExampleWeb.Gettext, only: [gettext: 1]
  import Gettext, only: [with_locale: 2]
  alias PhxI18nExampleWeb.Endpoint

  @locale_changes "locale-changes:"

  def mount(%{locale: locale, user_id: user_id}, socket) do
    Endpoint.subscribe(@locale_changes <> user_id)
    socket = assign(socket, locale: locale)
    {:ok, socket}
  end

  def render(assigns) do
    ~L"""
    <%= with_locale(@locale, fn -> %>
      <title>
        <%= gettext("Multilingualisation in Phoenix") %>
      </title>
    <% end) %>
    """
  end

  def handle_info(%{event: "change-locale", payload: payload}, socket) do
    socket = assign(socket, :locale, payload.locale)
    {:noreply, socket}
  end
end
