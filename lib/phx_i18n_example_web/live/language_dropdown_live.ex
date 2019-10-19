defmodule PhxI18nExampleWeb.LanguageDropdownLive do
  use Phoenix.LiveView
  alias PhxI18nExampleWeb.{Endpoint, LanguageDropdownView}

  @locales Gettext.known_locales(PhxI18nExampleWeb.Gettext)
  @topic "i18n-example"

  def mount(%{locale: locale}, socket) do
    PhxI18nExampleWeb.Endpoint.subscribe(@topic)
    socket = init_socket_assigns(socket, locale)

    {:ok, socket}
  end

  def render(assigns) do
    LanguageDropdownView.render("language_dropdown.html", assigns)
  end

  def handle_event("hide", _value, socket) do
    socket = assign(socket, :show_available_locales, false)
    {:noreply, socket}
  end

  def handle_event("toggle", _value, socket) do
    %{assigns: %{show_available_locales: show_available_locales}} = socket
    socket = assign(socket, :show_available_locales, !show_available_locales)
    {:noreply, socket}
  end

  def handle_event("change-locale", %{"locale" => locale}, socket) do
    Endpoint.broadcast_from(self(), @topic, "locale-changed", %{locale: locale})

    socket = init_socket_assigns(socket, locale)

    {:noreply, socket}
  end

  def handle_info(%{event: "hide-dropdown"}, socket) do
    socket = assign(socket, :show_available_locales, false)
    {:noreply, socket}
  end

  defp init_socket_assigns(socket, locale) do
    selectable_locales = List.delete(@locales, locale)

    assign(
      socket,
      %{
        locale: locale,
        selectable_locales: selectable_locales,
        show_available_locales: false
      }
    )
  end
end
