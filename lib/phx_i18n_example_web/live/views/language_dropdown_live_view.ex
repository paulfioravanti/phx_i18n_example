defmodule PhxI18nExampleWeb.LanguageDropdownLiveView do
  use Phoenix.LiveView
  alias PhxI18nExampleWeb.{Endpoint, LanguageDropdownLiveComponent}

  @dropdown_changes "dropdown-changes:"

  def mount(%{locale: locale, user_id: user_id}, socket) do
    Endpoint.subscribe(@dropdown_changes <> user_id)
    socket = assign(socket, locale: locale, user_id: user_id)
    {:ok, socket}
  end

  def render(assigns) do
    ~L"""
    <%= live_component @socket,
                       LanguageDropdownLiveComponent,
                       id: :language_dropdown,
                       locale: @locale,
                       user_id: @user_id %>
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
