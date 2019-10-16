defmodule PhxI18nExampleWeb.TitleLive do
  use Phoenix.LiveView
  import PhxI18nExampleWeb.Gettext, only: [gettext: 1]
  alias PhxI18nExampleWeb.{Endpoint, TitleView}

  @topic "i18n-example"

  def mount(%{current_locale: current_locale} = session, socket) do
    PhxI18nExampleWeb.Endpoint.subscribe(@topic)
    socket = assign(socket, current_locale: current_locale)
    {:ok, socket}
  end

  def render(assigns) do
    ~L"""
    <title>
      <%= Gettext.with_locale(@current_locale, fn -> %>
        <%= gettext("Multilingualisation in Phoenix") %>
      <% end) %>
    </title>
    """
  end

  def handle_info(%{event: "locale-changed", payload: payload}, socket) do
    %{current_locale: current_locale} = payload
    socket = assign(socket, :current_locale, current_locale)
    {:noreply, socket}
  end
end
