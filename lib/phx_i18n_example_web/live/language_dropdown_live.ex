defmodule PhxI18nExampleWeb.LanguageDropdownLive do
  use Phoenix.LiveView
  alias PhxI18nExampleWeb.{Endpoint, LanguageDropdownView}

  # @locales Gettext.known_locales(PhxI18nExampleWeb.Gettext)
  @topic "i18n-example"

  def mount(%{current_locale: current_locale} = session, socket) do
    PhxI18nExampleWeb.Endpoint.subscribe(@topic)
    # IO.puts("LanguageDropdownLive Session is")
    # IO.inspect(session)

    socket = Enum.reduce(session, socket, &assign_to_socket/2)

    # IO.puts("LanguageDropdownLive Socket is")
    # IO.inspect(socket)
    #
    Gettext.put_locale(PhxI18nExampleWeb.Gettext, current_locale)

    {:ok, socket}
  end

  def render(assigns) do
    # IO.puts("LanguageDropdownLive Assigns is")
    # IO.inspect(assigns)
    LanguageDropdownView.render("language_dropdown.html", assigns)
  end

  def handle_event("hide", _value, socket) do
    socket = assign(socket, :show_available_locales, false)
    IO.puts("Socket after hide event is")
    IO.inspect(socket)
    {:noreply, socket}
  end

  def handle_event("toggle", _value, socket) do
    IO.puts("Socket is")
    IO.inspect(socket)
    %{assigns: %{show_available_locales: show_available_locales}} = socket
    socket = assign(socket, :show_available_locales, !show_available_locales)
    {:noreply, socket}
  end

  def handle_info(%{event: "hide", topic: @topic}, socket) do
    socket = assign(socket, :show_available_locales, false)
    {:noreply, socket}
  end

  # def handle_event("change-locale", %{"locale" => locale}, socket) do
  #   selectable_locales = List.delete(@locales, locale)

  #   payload = %{
  #     current_locale: locale,
  #     selectable_locales: selectable_locales,
  #     show_available_locales: false
  #   }

  #   Endpoint.broadcast_from(self(), @topic, "change-locale", payload)
  #   Gettext.put_locale(PhxI18nExampleWeb.Gettext, locale)

  #   socket = assign(socket, payload)

  #   # IO.puts("LanguageDropdownLive Socket after change-locale event is")
  #   # IO.inspect(socket)

  #   {:noreply, socket}
  # end

  defp assign_to_socket({key, value}, socket), do: assign(socket, key, value)
end
