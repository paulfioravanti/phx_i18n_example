defmodule PhxI18nExampleWeb.LanguageDropdownLiveComponent do
  use Phoenix.LiveComponent
  alias PhxI18nExampleWeb.LanguageDropdownView

  def mount(socket) do
    {:ok, socket}
  end

  def update(assigns, socket) do
    {:ok, assign(socket, assigns)}
  end

  def render(assigns) do
    LanguageDropdownView.render("language_dropdown.html", assigns)
  end
end
