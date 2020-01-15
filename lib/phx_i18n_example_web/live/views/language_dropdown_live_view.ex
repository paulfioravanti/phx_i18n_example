defmodule PhxI18nExampleWeb.LanguageDropdownLiveView do
  use Phoenix.LiveView
  alias PhxI18nExampleWeb.{Endpoint, LanguageDropdownLiveComponent}

  @dropdown_changes "dropdown-changes"

  def mount(%{locale: locale}, socket) do
    Endpoint.subscribe(@dropdown_changes)
    socket = assign(socket, locale: locale)
    {:ok, socket}
  end

  def render(assigns) do
    ~L"""
    <%= live_component @socket,
                       LanguageDropdownLiveComponent,
                       id: :language_dropdown,
                       locale: @locale %>
    """
  end

  def handle_info(%{event: "hide-dropdown"}, socket) do
    send_update(
      LanguageDropdownLiveComponent,
      id: :language_dropdown,
      show_available_locales: false
    )

    {:noreply, socket}
  end
end
