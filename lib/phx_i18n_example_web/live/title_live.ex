defmodule PhxI18nExampleWeb.TitleLive do
  use Phoenix.LiveView
  import PhxI18nExampleWeb.Gettext, only: [gettext: 1]
  import Gettext, only: [with_locale: 2]
  alias PhxI18nExampleWeb.Endpoint

  @topic "i18n-example"

  def mount(%{locale: locale}, socket) do
    Endpoint.subscribe(@topic)
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

  def handle_info(%{event: "locale-changed", payload: payload}, socket) do
    %{locale: locale} = payload
    socket = assign(socket, :locale, locale)
    {:noreply, socket}
  end

  def handle_info(_msg, socket), do: {:noreply, socket}
end
