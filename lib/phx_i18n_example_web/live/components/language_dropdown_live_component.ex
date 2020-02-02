defmodule PhxI18nExampleWeb.LanguageDropdownLiveComponent do
  use Phoenix.LiveComponent
  alias PhxI18nExampleWeb.LanguageDropdownView

  @locales Gettext.known_locales(PhxI18nExampleWeb.Gettext)

  def update(%{locale: locale} = assigns, socket) do
    state = Map.merge(assigns, init_dropdown_state(locale))
    socket = assign(socket, state)
    {:ok, socket}
  end

  def update(%{show_available_locales: false}, socket) do
    socket = assign(socket, :show_available_locales, false)
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
    socket =
      assign(
        socket,
        :show_available_locales,
        !socket.assigns.show_available_locales
      )

    {:noreply, socket}
  end

  def handle_event("locale-changed", %{"locale" => locale}, socket) do
    send(self(), {:change_locale, locale})

    state = update_locale_changed_state(socket.assigns, locale)
    socket = assign(socket, state)
    {:noreply, socket}
  end

  defp update_locale_changed_state(assigns, locale) do
    assigns
    |> Map.merge(%{locale: locale})
    |> Map.merge(init_dropdown_state(locale))
  end

  defp init_dropdown_state(locale) do
    selectable_locales = List.delete(@locales, locale)

    %{
      selectable_locales: selectable_locales,
      show_available_locales: false
    }
  end
end
