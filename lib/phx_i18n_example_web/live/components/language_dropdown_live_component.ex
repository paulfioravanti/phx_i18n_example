defmodule PhxI18nExampleWeb.LanguageDropdownLiveComponent do
  use Phoenix.LiveComponent
  alias PhxI18nExampleWeb.{Endpoint, LanguageDropdownView}

  @locales Gettext.known_locales(PhxI18nExampleWeb.Gettext)
  @locale_changes "locale-changes"

  def update(assigns, socket) do
    socket = assign(socket, assigns)
    socket = init_dropdown_state(socket)
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

  def handle_event("locale-changed", %{"locale" => locale}, socket) do
    Endpoint.broadcast_from(
      self(),
      @locale_changes,
      "change-locale",
      %{locale: locale}
    )

    socket = assign(socket, %{locale: locale})
    socket = init_dropdown_state(socket)
    {:noreply, socket}
  end

  defp init_dropdown_state(%{assigns: %{locale: locale}} = socket) do
    selectable_locales = List.delete(@locales, locale)

    assign(
      socket,
      %{
        selectable_locales: selectable_locales,
        show_available_locales: false
      }
    )
  end
end
