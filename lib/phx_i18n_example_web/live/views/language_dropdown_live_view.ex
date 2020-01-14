defmodule PhxI18nExampleWeb.LanguageDropdownLiveView do
  use Phoenix.LiveView
  alias PhxI18nExampleWeb.{Endpoint, LanguageDropdownLiveComponent}

  @locales Gettext.known_locales(PhxI18nExampleWeb.Gettext)
  @locale_changes "locale-changes"
  @dropdown_changes "dropdown-changes"

  def mount(%{locale: locale}, socket) do
    Endpoint.subscribe(@dropdown_changes)
    socket = init_dropdown_state(socket, locale)
    {:ok, socket}
  end

  def render(assigns) do
    ~L"""
    <%= live_component @socket,
                       LanguageDropdownLiveComponent,
                       locale: @locale,
                       selectable_locales: @selectable_locales,
                       show_available_locales: @show_available_locales %>
    """
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

  def handle_event("locale-changed", %{"locale" => locale}, socket) do
    Endpoint.broadcast_from(self(), @locale_changes, "change-locale", %{
      locale: locale
    })

    socket = init_dropdown_state(socket, locale)
    {:noreply, socket}
  end

  def handle_info(%{event: "hide-dropdown"}, socket) do
    socket = assign(socket, :show_available_locales, false)
    {:noreply, socket}
  end

  defp init_dropdown_state(socket, locale) do
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
