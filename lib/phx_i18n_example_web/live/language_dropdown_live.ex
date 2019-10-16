defmodule PhxI18nExampleWeb.LanguageDropdownLive do
  use Phoenix.LiveView
  alias PhxI18nExampleWeb.{Endpoint, LanguageDropdownView}

  @locales Gettext.known_locales(PhxI18nExampleWeb.Gettext)
  @topic "i18n-example"

  def mount(%{current_locale: current_locale} = session, socket) do
    PhxI18nExampleWeb.Endpoint.subscribe(@topic)
    socket = Enum.reduce(session, socket, &assign_to_socket/2)
    {:ok, socket}
  end

  def render(%{current_locale: current_locale} = assigns) do
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
    selectable_locales = List.delete(@locales, locale)

    socket =
      assign(
        socket,
        %{
          current_locale: locale,
          selectable_locales: selectable_locales,
          show_available_locales: false
        }
      )

    Endpoint.broadcast_from(
      self(),
      @topic,
      "locale-changed",
      %{current_locale: locale}
    )

    {:noreply, socket}
  end

  def handle_info(%{event: "hide"}, socket) do
    socket = assign(socket, :show_available_locales, false)
    {:noreply, socket}
  end

  defp assign_to_socket({key, value}, socket), do: assign(socket, key, value)
end
