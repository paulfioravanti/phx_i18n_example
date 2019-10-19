defmodule PhxI18nExampleWeb.TitleLive do
  use Phoenix.LiveView
  import PhxI18nExampleWeb.Gettext, only: [gettext: 1]

  @topic "i18n-example"

  def mount(%{locale: locale}, socket) do
    PhxI18nExampleWeb.Endpoint.subscribe(@topic)
    socket = assign(socket, locale: locale)
    {:ok, socket}
  end

  def render(assigns) do
    ~L"""
    <title>
      <%= Gettext.with_locale(@locale, fn -> %>
        <%= gettext("Multilingualisation in Phoenix") %>
      <% end) %>
    </title>
    """
  end

  def handle_info(%{event: "locale-changed", payload: payload}, socket) do
    %{locale: locale} = payload
    socket = assign(socket, :locale, locale)
    {:noreply, socket}
  end

  def handle_info(_msg, socket), do: {:noreply, socket}
end
